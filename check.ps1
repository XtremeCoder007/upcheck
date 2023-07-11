if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "PSWindowsUpdate module not found. Installing PSWindowsUpdate module..."
    Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
    Write-Host "PSWindowsUpdate module installed successfully."
}

Write-Host "Importing PSWindowsUpdate module..."
Import-Module -Name PSWindowsUpdate -Force

Write-Host "Checking for updates installed today..."
$updates = Get-WUHistory -Last 30 | Where-Object { $_.Date -ge (Get-Date).Date } | Select-Object Title, Date
if ($updates) {
    Write-Host "Updates installed today:"
    $updates
} else {
    Write-Host "No updates installed today."
}
