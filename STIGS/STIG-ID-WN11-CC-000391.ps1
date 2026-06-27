 <#
.SYNOPSIS
    This PowerShell script ensures Internet Explorer must be disabled for Windows 11.

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-27
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000391/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-CC-000391).ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty `
    -Path $Path `
    -Name "NotifyDisableIEOptions" `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null 
