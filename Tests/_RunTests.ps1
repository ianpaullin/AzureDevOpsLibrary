$pesterVersion = (Import-Module Pester -Passthru).Version 

Write-Host "Running Pester version $($pesterVersion)"

# get all files that are named *.Tests.ps1 
$testFiles = (Get-ChildItem -Name) -like "*.Tests.ps1" 

Write-Host "Found $($testFiles.count) test files to run."

# execute each file against pester
$testFiles | %{ Invoke-Pester ".\$_" }