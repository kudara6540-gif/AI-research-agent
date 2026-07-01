param(
    [switch]$NoLogout
)

$ErrorActionPreference = "Stop"

function Get-FeynmanExecutable {
    $feynman = Get-Command feynman -ErrorAction SilentlyContinue
    if ($feynman) {
        return $feynman.Source
    }

    $bundleRoot = Join-Path $env:LOCALAPPDATA "Programs\feynman\feynman-0.2.58-win32-x64"
    $bundledScript = Join-Path $bundleRoot "bin\feynman.ps1"
    if (Test-Path $bundledScript) {
        return $bundledScript
    }

    throw "feynman was not found on PATH and no bundled install was found."
}

function Clear-CallbackPort {
    $port = 9876
    $listener = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($listener -and $listener.OwningProcess) {
        Stop-Process -Id $listener.OwningProcess -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1
    }
}

$port = 9876
$hostName = "127.0.0.1"
$redirectUri = "http://${hostName}:${port}/callback"

Clear-CallbackPort

$env:ALPHA_CALLBACK_HOST = $hostName
$env:ALPHA_CALLBACK_PORT = "$port"
$env:ALPHA_REDIRECT_URI = $redirectUri

Write-Host "Using callback: $redirectUri"

if (-not $NoLogout) {
    Write-Host "Clearing previous alphaXiv auth..."
    & (Get-FeynmanExecutable) alpha logout 2>$null
}

Write-Host "Starting alphaXiv login..."
Write-Host "If the browser does not redirect back automatically, copy the full final URL from the browser address bar after sign-in. It should include ?code=..."
& (Get-FeynmanExecutable) alpha login
