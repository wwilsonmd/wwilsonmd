<#
.SYNOPSIS
This script disables Microsoft consumer experiences by setting the DisableWindowsConsumerFeatures policy to 1, preventing automatic installation of suggested apps and related content.

.NOTES
    Author          : Michael Wilson
    LinkedIn        : linkedin.com/in/wwilsonmd/
    GitHub          : github.com/wwilsonmd/wwilsonmd
    Date Created    : 2026-04-09
    Last Modified   : 2026-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000197.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000197).ps1 
#>

# YOUR CODE GOES HERE

# WN11-CC-000197
# Turn off Microsoft consumer experiences

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent'

# Create the key if it does not exist
New-Item -Path $path -Force | Out-Null

# Set the required value
New-ItemProperty -Path $path -Name 'DisableWindowsConsumerFeatures' -PropertyType DWord -Value 1 -Force | Out-Null
