Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property Name, State | Sort-Object -Property Name

$UseWUServer = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" | Select-Object -ExpandProperty UseWUServer

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" -Value 0

Restart-Service "Windows Update"

# Get-WindowsCapability -Name "RSAT*" -Online | Add-WindowsCapability –Online
Get-WindowsCapability -Name RSAT.A* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.C* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.D* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.F* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.G* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.V* -Online | Add-WindowsCapability -Online
Get-WindowsCapability -Name RSAT.W* -Online | Add-WindowsCapability -Online

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" -Value $UseWUServer

Restart-Service "Windows Update"
