 <#
.SYNOPSIS
    This PowerShell script ensures Web publishing and online ordering wizards must be prevented from downloading a list of providers.

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-27
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000105
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000105/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-CC-000105).ps1 
#>

$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty `
    -Path $Path `
    -Name "NoWebServices" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null 
