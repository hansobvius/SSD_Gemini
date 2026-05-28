<#
.SYNOPSIS
Watcher skill to restart the Antigravity session when any file in the .agents directory is created or edited.
#>

$folderToWatch = (Resolve-Path "$PSScriptRoot\..").Path

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderToWatch
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Track the last restart time to debounce multiple rapid events
$global:lastRestart = [DateTime]::MinValue

$action = {
    $path = $Event.SourceEventArgs.FullPath
    $changeType = $Event.SourceEventArgs.ChangeType
    
    $now = [DateTime]::Now
    # Debounce for 3 seconds to avoid multiple triggers on a single file save
    if (($now - $global:lastRestart).TotalSeconds -gt 3) {
        $global:lastRestart = $now
        
        Write-Host ""
        Write-Host "=========================================" -ForegroundColor Cyan
        Write-Host "Detected $changeType in: $path" -ForegroundColor Yellow
        Write-Host "Checking for active Antigravity session..." -ForegroundColor Cyan
        
        # Find Antigravity processes
        $antigravityProcesses = Get-Process | Where-Object { $_.Name -match "antigravity" } -ErrorAction SilentlyContinue
        
        if ($antigravityProcesses) {
            Write-Host "Shutting down current Antigravity session..." -ForegroundColor Red
            $antigravityProcesses | Stop-Process -Force -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 1
            
            Write-Host "Starting a new Antigravity session..." -ForegroundColor Green
            Start-Process "antigravity"
            Write-Host "=========================================" -ForegroundColor Cyan
        } else {
            Write-Host "No Antigravity session running." -ForegroundColor DarkGray
            Write-Host "=========================================" -ForegroundColor Cyan
        }
    }
}

# Register events for file creation and modification
Register-ObjectEvent $watcher "Created" -Action $action | Out-Null
Register-ObjectEvent $watcher "Changed" -Action $action | Out-Null

Write-Host "Antigravity Watcher Skill Started." -ForegroundColor Green
Write-Host "Watching $folderToWatch for changes..."
Write-Host "Press Ctrl+C to exit."

# Keep the script running
while ($true) {
    Start-Sleep -Seconds 1
}
