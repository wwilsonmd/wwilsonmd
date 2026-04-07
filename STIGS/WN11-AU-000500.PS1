<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Michael Wilson
    LinkedIn        : linkedin.com/in/wwilsonmd/
    GitHub          : github.com/wwilsonmd/wwilsonmd
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

# YOUR CODE GOES HERE




$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the key if it does not already exist
New-Item -Path $path -Force | Out-Null

# Set MaxSize to dword:00008000
New-ItemProperty -Path $path -Name 'MaxSize' -PropertyType DWord -Value 0x00008000 -Force | Out-Null
