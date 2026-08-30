import { existsSync, readFileSync, readdirSync } from "node:fs";
import { dirname, join, relative, resolve, sep } from "node:path";

const root = resolve(import.meta.dirname, "..");
const lessonsRoot = join(root, "lessons");
const failures = [];

function walk(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap(entry => {
    const path = join(directory, entry.name);
    return entry.isDirectory() ? walk(path) : [path];
  });
}

function safeRelative(path) {
  return typeof path === "string" && path.length > 0 && !path.startsWith("/") &&
    !path.startsWith("\\") && !path.split(/[\\/]/).includes("..");
}

function fail(manifest, message) {
  failures.push(`${relative(root, manifest)}: ${message}`);
}

const discoveryFields = ["problems", "methods", "plots", "terms", "aliases", "functions"];
const requiredDiscoveryFields = new Set(["problems", "methods", "terms", "aliases"]);
function validDiscoverability(value) {
  return value && typeof value === "object" && !Array.isArray(value) &&
    discoveryFields.every(field => Array.isArray(value[field]) && (!requiredDiscoveryFields.has(field) || value[field].length > 0) &&
      value[field].every(term => typeof term === "string" && term.length > 1 && term.trim() === term) &&
      new Set(value[field]).size === value[field].length);
}

for (const manifestPath of walk(lessonsRoot).filter(path => path.endsWith(`${sep}lesson.json`))) {
  let manifest;
  try { manifest = JSON.parse(readFileSync(manifestPath, "utf8")); }
  catch (error) { fail(manifestPath, `invalid JSON (${error.message})`); continue; }

  if (![1, 2].includes(manifest.schema)) fail(manifestPath, "schema must be 1 or 2");
  if (!/^[a-z0-9][a-z0-9._-]*$/i.test(manifest.id ?? "")) fail(manifestPath, "id is invalid");
  if (!manifest.title || !manifest.summary) fail(manifestPath, "title and summary are required");
  if (!manifest.source?.url?.startsWith("https://")) fail(manifestPath, "source.url must use HTTPS");
  if (!Array.isArray(manifest.datasets) || !Array.isArray(manifest.tags)) fail(manifestPath, "datasets and tags must be arrays");
  if (!validDiscoverability(manifest.discoverability)) {
    fail(manifestPath, "discoverability must provide problems, methods, plots, terms, aliases, and functions arrays; only plots and functions may be empty");
  }
  if (manifest.series && (!/^[a-z0-9][a-z0-9._-]*$/i.test(manifest.series.id ?? "") || !manifest.series.title ||
      !manifest.series.url?.startsWith("https://") || !Number.isInteger(manifest.series.order) || manifest.series.order < 0 ||
      !manifest.series.chapter)) fail(manifestPath, "series metadata is invalid");

  const entries = manifest.schema === 1
    ? [{ id: manifest.id, entry: manifest.entry }]
    : manifest.lessons;
  if (!Array.isArray(entries) || entries.length < (manifest.schema === 2 ? 2 : 1)) {
    fail(manifestPath, "lesson entries are missing");
    continue;
  }
  const ids = new Set();
  for (const entry of entries) {
    if (!entry?.id || ids.has(entry.id)) fail(manifestPath, `duplicate or missing lesson id '${entry?.id ?? ""}'`);
    ids.add(entry?.id);
    if (!safeRelative(entry?.entry) || !entry.entry.endsWith(".bln")) fail(manifestPath, `unsafe notebook path '${entry?.entry ?? ""}'`);
    else if (!existsSync(join(dirname(manifestPath), entry.entry))) fail(manifestPath, `missing notebook '${entry.entry}'`);
    if (manifest.schema === 2 && !validDiscoverability(entry.discoverability)) {
      fail(manifestPath, `lesson '${entry?.id ?? ""}' must provide its own discoverability metadata`);
    }
    if (manifest.schema === 2 && validDiscoverability(entry.discoverability) && validDiscoverability(manifest.discoverability)) {
      for (const field of discoveryFields) {
        const aggregate = new Set(manifest.discoverability[field]);
        const missing = entry.discoverability[field].filter(term => !aggregate.has(term));
        if (missing.length) fail(manifestPath, `lesson '${entry.id}' has ${field} missing from aggregate discoverability: ${missing.join(", ")}`);
      }
    }
  }

  for (const dataset of manifest.datasets ?? []) {
    if (!safeRelative(dataset.path)) fail(manifestPath, `unsafe dataset path '${dataset.path}'`);
    if (!/^https:\/\//.test(dataset.url ?? "")) fail(manifestPath, `dataset '${dataset.id}' must use HTTPS`);
    if (!/^[a-f0-9]{64}$/i.test(dataset.sha256 ?? "")) fail(manifestPath, `dataset '${dataset.id}' has no SHA-256`);
  }
  if (manifest.attribution && !existsSync(join(dirname(manifestPath), manifest.attribution))) fail(manifestPath, `missing attribution '${manifest.attribution}'`);
  if (manifest.sourceMap && !existsSync(join(dirname(manifestPath), manifest.sourceMap))) fail(manifestPath, `missing source map '${manifest.sourceMap}'`);
}

if (failures.length) {
  console.error(failures.join("\n"));
  process.exit(1);
}
console.log("All lesson manifests and local entries are structurally valid.");
