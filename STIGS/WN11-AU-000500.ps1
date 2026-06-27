 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-24
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-AU-000500).ps1 
#>

# Registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the key if it doesn't exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set MaxSize (DWORD = 0x00008000 = 32768)
New-ItemProperty `
    -Path $RegistryPath `
    -Name "MaxSize" `
    -Value 0x00008000 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Application Event Log MaxSize has been set to 32768 (0x00008000)." 
