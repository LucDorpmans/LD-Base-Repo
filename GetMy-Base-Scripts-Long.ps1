# GetMy-WS013-Scripts-Long.ps1
Function Get-MyScript 
{    [CmdletBinding()]
    Param    ( 
        [Parameter(Mandatory=$true,Position=0)]
        [string]$AFile,
        [string]$SaveLocation = "$env:USERPROFILE\Downloads\", 
		[switch]$EditFile = $False )
        Invoke-Webrequest -Uri "https://raw.githubusercontent.com/LucDorpmans/My-Base-Repo/main/$AFile"  -Outfile "$SaveLocation$AFile" 
		If ($EditFile) { PSEdit  ("$SaveLocation$AFile" )} }

Get-MyScript "Chrome-Download+Run-Installer.ps1" -EditFile
Get-MyScript "WAC-Download+Install.ps1" -EditFile
Get-MyScript "EdgeMSI-Download-Only-Complete.ps1" -EditFile
Get-MyScript "Edge-InstallOnly.ps1"

$ProgressPreference = 'SilentlyContinue'
$url = "https://github.com/LucDorpmans/$MyRepo/archive/refs/heads/main.zip" 
$outFile = "$env:USERPROFILE\Downloads\$MyRepo.zip"

Invoke-WebRequest -uri $url -OutFile $OutFile
# (new-object Net.WebClient).DownloadFile($url, $outFile)
Expand-Archive "$env:USERPROFILE\Downloads\$MyRepo.zip" -DestinationPath C:\ -Force

