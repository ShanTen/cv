# Phase - 1:
# Moves latest version *pdf to curr folder 
# Renames it Shantanu-Ramanujapuram.pdf

$mostRecent = Get-ChildItem -Path . -Filter "ShantanuRamanujapuram*.pdf" | Where-Object { $_.Name -match 'v\d{3}' } | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if ($mostRecent) {
    $destinationFolder = Join-Path -Path $mostRecent.Directory.FullName -ChildPath "curr"
    if (-not (Test-Path $destinationFolder)) {
        New-Item -Path $destinationFolder -ItemType Directory | Out-Null
    }

    $destinationPath = Join-Path -Path $destinationFolder -ChildPath "Shantanu-Ramanujapuram.pdf"
    Copy-Item -Path $mostRecent.FullName -Destination $destinationPath -Force
}

