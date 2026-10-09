param([string]$GamePath)
$ErrorActionPreference='Stop'
if(!$GamePath){
 $setting=Join-Path $PSScriptRoot 'game-folder.txt'
 if(Test-Path -LiteralPath $setting){$GamePath=(Get-Content -LiteralPath $setting -Raw).Trim()}
 else{$GamePath=Read-Host 'Paste your Stronghold Crusader Definitive Edition game folder'}
}
$target=[IO.Path]::GetFullPath($GamePath).TrimEnd('\')
if(!(Test-Path -LiteralPath (Join-Path $target 'Stronghold Crusader Definitive Edition.exe'))){throw 'Game installation not found.'}
if(Get-Process -Name 'Stronghold Crusader Definitive Edition' -ErrorAction SilentlyContinue){throw 'Close the game before installing the mod.'}
if(!(Test-Path -LiteralPath (Join-Path $target 'BepInEx\core\BepInEx.dll'))){throw 'Install the official SHCDE BepInEx loader first: https://gitlab.com/rawra-stronghold-crusader/shcde-bepinex/-/releases'}
$hash=(Get-FileHash -LiteralPath (Join-Path $target 'Stronghold Crusader Definitive Edition_Data\Managed\Assembly-CSharp.dll')).Hash
if($hash -ne 'BC8B6A395F01D48557DB413600C8DD8D1FDFD3ABDF97BFBBB68A3C56B04FD789'){throw 'This game build is not supported by version 1.0.'}
$source=Join-Path $PSScriptRoot 'CrusaderTrailPlugin.dll'
if(!(Test-Path -LiteralPath $source)){throw 'Plugin DLL is missing from this package.'}
$destination=Join-Path $target 'BepInEx\plugins\CrusaderTrailManager\CrusaderTrailPlugin.dll'
$manifest=Join-Path $target 'TrailManager\installed-files.json'
$entries=@()
if(Test-Path -LiteralPath $manifest){$entries=@(foreach($item in (Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json)){$item})}
foreach($entry in $entries){
 if(![IO.Path]::GetFullPath($entry.Path).StartsWith($target+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'The installation manifest contains a path outside the game folder.'}
}
$entry=$entries | Where-Object Path -eq $destination
if(Test-Path -LiteralPath $destination){
 if(!$entry -or (Get-FileHash -LiteralPath $destination).Hash -ne $entry.Hash){throw 'An untracked or modified plugin is already installed. It has not been overwritten.'}
}
$backup=$null
$wasPresent=Test-Path -LiteralPath $destination
if($wasPresent){
 $backup=Join-Path $target ('TrailManager\Backups\CrusaderTrailPlugin.'+[DateTime]::UtcNow.Ticks+'.dll')
 New-Item -ItemType Directory -Force -Path (Split-Path $backup) | Out-Null
 Copy-Item -LiteralPath $destination -Destination $backup
}
try{
 New-Item -ItemType Directory -Force -Path (Split-Path $destination) | Out-Null
 Copy-Item -LiteralPath $source -Destination $destination
 $newHash=(Get-FileHash -LiteralPath $destination).Hash
 if($newHash -ne (Get-FileHash -LiteralPath $source).Hash){throw 'Installed plugin hash verification failed.'}
 if($entry){$entry.Hash=$newHash}else{$entries+=@{Path=$destination;Hash=$newHash}}
 New-Item -ItemType Directory -Force -Path (Split-Path $manifest) | Out-Null
 ConvertTo-Json -InputObject @($entries) -Depth 3 | Set-Content -LiteralPath ($manifest+'.tmp')
 if(Test-Path -LiteralPath $manifest){[IO.File]::Replace($manifest+'.tmp',$manifest,$manifest+'.previous')}
 else{Move-Item -LiteralPath ($manifest+'.tmp') -Destination $manifest}
}catch{
 if($backup){Copy-Item -LiteralPath $backup -Destination $destination}
 elseif(!$wasPresent -and (Test-Path -LiteralPath $destination)){Remove-Item -LiteralPath $destination}
 throw
}
Write-Output 'Version 1.0 installed and verified. Existing profiles were preserved.'



