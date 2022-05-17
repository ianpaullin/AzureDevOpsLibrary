class Configuration {
    [string]$AzureDevOpsUrl 
    [string]$PersonalAccessToken
    [hashtable]$EnvironmentVariables

    Configuration() {
        # check for environment variables first
        $tempHt = $this.GetEnvironmentVariables()

        if ($tempHt.Count -gt 0 ) {
            $this.EnvironmentVariables = $tempHt
        }
    }

    [void]SetPersonalAccessToken ( [string]$PAToken ) {
        $this.PersonalAccessToken = $PAToken 
    }

    [string]GetAzureDevOpsUrl() {
        return $this.AzureDevOpsUrl
    }

    [hashtable]GetEnvironmentVariables() {
        $envHt = @{}

        return [Hashtable] (((Get-Item -Path Env:) | sort-object -property Name -Descending) | `
            ForEach-Object { $envHt.Add($_.key, $_.value) })
    }

    [bool]FindEnvironmentVariable([string]$KeyName) {
        return $true
    }

}

$test = [AzureDevOpsConfig]::new()

$test.EnvironmentVariables.Count
$test.EnvironmentVariables

$test.GetEnvironmentVariables()