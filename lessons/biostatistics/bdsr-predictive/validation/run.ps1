param(
    [string]$BioLang = "C:\work\bio\biolang\target\release\bl.exe",
    [string]$Rscript = "C:\Program Files\R\R-4.5.2\bin\Rscript.exe"
)

$ErrorActionPreference = "Stop"
$validationRoot = $PSScriptRoot
$lessonRoot = Split-Path $validationRoot -Parent

& $Rscript (Join-Path $validationRoot "reference.R") $lessonRoot (Join-Path $validationRoot "r-reference.json")
if ($LASTEXITCODE -ne 0) { throw "R oracle failed with exit code $LASTEXITCODE" }

$timer = [System.Diagnostics.Stopwatch]::StartNew()
Push-Location $validationRoot
try {
    & $BioLang --no-gpu run "biolang.bl" --plot none
    if ($LASTEXITCODE -ne 0) { throw "BioLang validation failed with exit code $LASTEXITCODE" }
} finally {
    Pop-Location
    $timer.Stop()
}

node (Join-Path $validationRoot "compare.mjs") $timer.Elapsed.TotalSeconds.ToString("R", [System.Globalization.CultureInfo]::InvariantCulture)
if ($LASTEXITCODE -ne 0) { throw "Validation comparison failed with exit code $LASTEXITCODE" }
