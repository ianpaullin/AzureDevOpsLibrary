Import-Module Pester -Passthru

# get all files that are named *.Tests.ps1 

# execute each file against pester

Invoke-Pester .\Configuration.Tests.ps1
Invoke-Pester .\Utilities.Tests.ps1