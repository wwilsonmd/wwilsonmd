<#
.SYNOPSIS
This script enables the Windows 11 Kernel DMA Protection policy by configuring incompatible external devices to be fully blocked from enumeration.



.NOTES
    Author          : Michael Wilson
    LinkedIn        : linkedin.com/in/wwilsonmd/
    GitHub          : github.com/wwilsonmd/wwilsonmd
    Date Created    : 2026-04-10
    Last Modified   : 2026-04-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000310.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000310).ps1 
#>

# YOUR CODE GOES HERE








# WN11-EP-000310
# Windows 11 Kernel DMA Protection must be enabled
# Policy: Enumeration policy for external devices incompatible with Kernel DMA Protection
# Setting: Enabled
# Enumeration Policy: Block All

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"
$valueName = "DeviceEnumerationPolicy"
$valueData = 0

try {
    # Ensure the registry path exists
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the policy to "Block All"
    New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

    Write-Host "STIG WN11-EP-000310 has been successfully applied." -ForegroundColor Green
    Write-Host "Registry value set: $regPath\$valueName = $valueData"
}
catch {
    Write-Error "Failed to apply STIG WN11-EP-000310. $_"
}
