<#
.SYNOPSIS
This script enables Windows support for delegating non-exportable credentials to remote hosts by creating and setting the AllowProtectedCreds policy registry value to 1.



.NOTES
    Author          : Michael Wilson
    LinkedIn        : linkedin.com/in/wwilsonmd/
    GitHub          : github.com/wwilsonmd/wwilsonmd
    Date Created    : 2026-04-10
    Last Modified   : 2026-04-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000068.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000068).ps1 
#>

# YOUR CODE GOES HERE


 
# WN11-CC-000068
# Enables: Remote host allows delegation of non-exportable credentials
# Registry: HKLM\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation
# Value: AllowProtectedCreds = 1

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"
$valueName = "AllowProtectedCreds"
$valueData = 1

try {
    # Ensure the registry path exists
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the required registry value
    New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

    Write-Host "STIG WN11-CC-000068 has been successfully applied." -ForegroundColor Green
    Write-Host "Registry value set: $regPath\$valueName = $valueData"
}
catch {
    Write-Error "Failed to apply STIG WN11-CC-000068. $_"
}

