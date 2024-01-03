param (
    [string]$directoryPath,
    [string]$searchText
)

if (-not ($directoryPath -and $searchText)) {
    Write-Host "Usage: .\Find-Text.ps1 -directoryPath <directory_path> -searchText <text_to_search>"
    exit 1
}

Get-ChildItem -Path $directoryPath -Recurse | Where-Object { $_.Type -eq 'File' } | ForEach-Object {
    $file = $_.FullName
    if (Get-Content $file | Select-String -Pattern $searchText -Quiet) {
        Write-Host $file
    }
}

# .\Find-Text.ps1 -directoryPath "path" -searchText "text"
