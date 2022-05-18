class Configuration {
    [string]
    $AzureDevOpsUrl 
    
    [string]
    $PersonalAccessToken
    
    [hashtable]
    $EnvironmentVariables

    [string]
    $AzureDevOpsUserEmail

    [string]
    $AzureDevOpsPersonalAccessToken

    Configuration() {
        $this.Init()
    }

    [void]Init() {
        $this.GetAzureDevOpsEnvironmentVariables()
    }

    [void]SetPersonalAccessToken ( [string]$PAToken ) {
        PersonalAccessToken = $PAToken 
    }

    [string]GetAzureDevOpsUrl() {
        return AzureDevOpsUrl
    }

    [string]GetEnvironmentVariableValue([string]$keyName) {

        $evHT = $this.GetEnvironmentVariables()

        if ($evHT.count -gt 0) {
            return ($evHT | ?{ $_.Key -eq "$($keyName)" }).Value
        }
        else {
            return [String]::Empty()
        }
        
    }

    [object[]]GetEnvironmentVariables() {
        return (((Get-Item -Path Env:) | sort-object -property Name -Descending) | ForEach-Object { $envHt.Add($_.key, $_.value) })
    }

    [void]GetAzureDevOpsEnvironmentVariables() {

        $this.AzureDevOpsUserEmail = $this.GetEnvironmentVariableValue("AZDO_USER_EMAIL")
        $this.AzureDevOpsPersonalAccessToken = $this.GetEnvironmentVariableValue("AZDO_USER_PAT")
    }


    [bool]FindEnvironmentVariable([string]$KeyName) {
        return $true
    }

}