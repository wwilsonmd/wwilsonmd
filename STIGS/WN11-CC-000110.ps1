<#
.SYNOPSIS
This script configures Windows to block printing over HTTP by setting the DisableHTTPPrinting registry policy to 1, ensuring the system cannot send print jobs over HTTP.

.NOTES
    Author          : Michael Wilson
    LinkedIn        : linkedin.com/in/wwilsonmd/
    GitHub          : github.com/wwilsonmd/wwilsonmd
    Date Created    : 2026-04-09
    Last Modified   : 2026-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000110.ps1

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000110).ps1 
#>

# YOUR CODE GOES HERE



# WN11-CC-000110
# Prevent printing over HTTP

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers'

# Create the key if it does not exist
New-Item -Path $path -Force | Out-Null

# Set the required value
New-ItemProperty -Path $path -Name 'DisableHTTPPrinting' -PropertyType DWord -Value 1 -Force | Out-Null
