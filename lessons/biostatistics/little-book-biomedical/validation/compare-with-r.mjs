import { existsSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

const here = dirname(fileURLToPath(import.meta.url));
const workspace = resolve(here, "..", "..", "..", "..", "..");
const defaultBl = process.platform === "win32"
  ? join(workspace, "biolang", "target", "release", "bl.exe")
  : "bl";
const defaultR = process.platform === "win32"
  ? "C:\\Program Files\\R\\R-4.5.2\\bin\\Rscript.exe"
  : "Rscript";
const bl = process.env.BIOLANG_BIN || defaultBl;
const rscript = process.env.RSCRIPT || defaultR;

function run(executable, args) {
  if (executable.includes("\\") && !existsSync(executable)) throw new Error(`Executable not found: ${executable}`);
  const result = spawnSync(executable, args, { cwd: here, encoding: "utf8" });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`${executable} failed:\n${result.stderr}\n${result.stdout}`);
  const start = result.stdout.indexOf("{");
  const end = result.stdout.lastIndexOf("}");
  if (start < 0 || end < start) throw new Error(`${executable} produced no JSON result`);
  return JSON.parse(result.stdout.slice(start, end + 1));
}

let comparisons = 0;
function compare(left, right, path = "result") {
  if (typeof left === "number" && typeof right === "number") {
    const tolerance = Math.max(1e-10, Math.max(Math.abs(left), Math.abs(right)) * 1e-8);
    if (Math.abs(left - right) > tolerance) throw new Error(`${path}: BioLang ${left} differs from R ${right} (tolerance ${tolerance})`);
    comparisons += 1;
    return;
  }
  if (Array.isArray(left) && Array.isArray(right)) {
    if (left.length !== right.length) throw new Error(`${path}: array lengths differ`);
    left.forEach((value, index) => compare(value, right[index], `${path}[${index}]`));
    return;
  }
  if (left && right && typeof left === "object" && typeof right === "object") {
    const leftKeys = Object.keys(left).sort();
    const rightKeys = Object.keys(right).sort();
    if (JSON.stringify(leftKeys) !== JSON.stringify(rightKeys)) throw new Error(`${path}: fields differ (${leftKeys} vs ${rightKeys})`);
    leftKeys.forEach(key => compare(left[key], right[key], `${path}.${key}`));
    return;
  }
  if (left !== right) throw new Error(`${path}: BioLang ${JSON.stringify(left)} differs from R ${JSON.stringify(right)}`);
}

const reference = run(rscript, [join(here, "reference.R")]);
const actual = run(bl, ["--no-gpu", "run", join(here, "biolang.bl")]);
compare(actual, reference);
console.log(`${comparisons} numerical values match the independent R oracle, including both Tarone-adjusted tests and both plot datasets.`);
