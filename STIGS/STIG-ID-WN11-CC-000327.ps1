 <#
.SYNOPSIS
    This PowerShell script ensures PowerShell Transcription must be enabled on Windows 11.

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-27
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000327/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-CC-000327).ps1 
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty `
    -Path $Path `
    -Name "EnableTranscripting" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null 
