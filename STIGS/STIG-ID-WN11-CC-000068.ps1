 <#
.SYNOPSIS
    This PowerShell script ensures Windows 11 must be configured to enable Remote host allows delegation of non-exportable credentials.

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-27
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000068
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000068/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-CC-000068).ps1 
#>

# Registry path
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"

# Create the registry key if it doesn't exist
if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Enable "Remote host allows delegation of non-exportable credentials"
New-ItemProperty `
    -Path $Path `
    -Name "AllowProtectedCreds" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Successfully enabled Remote host allows delegation of non-exportable credentials." 
