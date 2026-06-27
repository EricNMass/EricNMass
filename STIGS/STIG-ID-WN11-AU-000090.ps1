 <#
.SYNOPSIS
    This PowerShell script ensures The system must be configured to audit Object Access - Removable Storage successes.

.NOTES
    Author          : Eric Mass
    LinkedIn        : linkedin.com/in/eric-n-mass/
    GitHub          : github.com/EricNMass
    Date Created    : 2026-06-27
    Last Modified   : 2026-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000090
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-AU-000090/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN11-AU-000090).ps1 
#>

# Enable Advanced Audit Policy override
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

Set-ItemProperty `
    -Path $Path `
    -Name "SCENoApplyLegacyAuditPolicy" `
    -Value 1 `
    -Type DWord

# Enable Object Access > Removable Storage - Success
auditpol /set /subcategory:"Removable Storage" /success:enable /failure:disable 
