param (
    [string]$directory,
    [string]$extension
)

if (-not $directory -or -not $extension) {
    Write-Host "Використання: $MyInvocation.MyCommand.Name -directory <шлях до директорії> -extension <розширення файлів>"
    exit 1
}

if (-not (Test-Path -Path $directory -PathType Container)) {
    Write-Host "Директорія '$directory' не існує."
    exit 1
}

Get-ChildItem -Path $directory -File -Filter "*.$extension" | Select-Object -ExpandProperty FullName
