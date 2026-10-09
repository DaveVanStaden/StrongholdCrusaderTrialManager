param([string]$GamePath)
$ErrorActionPreference='Stop'
if(!$GamePath){
 $setting=Join-Path $PSScriptRoot 'game-folder.txt'
 if(Test-Path -LiteralPath $setting){$GamePath=(Get-Content -LiteralPath $setting -Raw).Trim()}
 else{$GamePath=Read-Host 'Paste your Stronghold Crusader Definitive Edition game folder'}
}
$target=[IO.Path]::GetFullPath($GamePath).TrimEnd('\')
if(Get-Process -Name 'Stronghold Crusader Definitive Edition' -ErrorAction SilentlyContinue){throw 'Close the game first.'}
$manifest=Join-Path $target 'TrailManager\installed-files.json'
if(!(Test-Path -LiteralPath $manifest)){throw 'Installation manifest not found.'}
$files=@(foreach($item in (Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json)){$item})
foreach($entry in $files){
 $path=[IO.Path]::GetFullPath($entry.Path)
 if(!$path.StartsWith($target+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Installation manifest contains a path outside the game folder.'}
}
foreach($entry in $files){
 if(Test-Path -LiteralPath $entry.Path){
  if((Get-FileHash -LiteralPath $entry.Path).Hash -eq $entry.Hash){Remove-Item -LiteralPath $entry.Path}
  else{Write-Warning "Modified file preserved: $($entry.Path)"}
 }
}
Remove-Item -LiteralPath $manifest
Write-Output 'Unchanged tracked files removed. Profiles, logs and backups preserved.'

