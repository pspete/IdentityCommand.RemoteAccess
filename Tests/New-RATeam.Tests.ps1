BeforeAll {
    $Script:RAModuleName = 'IdentityCommand.RemoteAccess'

    $Here = Split-Path -Parent $PSCommandPath
    $ModulePath = Resolve-Path "$Here\..\$Script:RAModuleName"
    $ManifestPath = Join-Path "$ModulePath" "$Script:RAModuleName.psd1"

    if ( -not (Get-Module -Name $Script:RAModuleName -All)) {
        Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop
    }
}

Describe 'New-RATeam' {

    BeforeEach {

        Mock -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -MockWith { [pscustomobject]@{ } }

        InModuleScope -ModuleName $Script:RAModuleName {
            $ISPSSSession = [ordered]@{
                tenant_url = 'https://api.alero.io'
                WebSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession
            }
            New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force
        }

        $Script:response = New-RATeam -name 'myteam' -accessPeriodStartDate (Get-Date '2026-01-01') -accessPeriodEndDate (Get-Date '2026-06-01') -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true -Confirm:$false

    }

    Context 'Request' {

        It 'sends request to expected endpoint' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $URI -eq 'https://api.alero.io/v2-edge/teams'
            } -Times 1 -Exactly -Scope It
        }

        It 'uses expected method' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $Method -eq 'POST'
            } -Times 1 -Exactly -Scope It
        }

        It 'sends expected body' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                ($Body | ConvertFrom-Json).name -eq 'myteam'
            } -Times 1 -Exactly -Scope It
        }

        It 'does not send a request when WhatIf is specified' {
            New-RATeam -name 'myteam' -accessPeriodStartDate (Get-Date '2026-01-01') -accessPeriodEndDate (Get-Date '2026-06-01') -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true -WhatIf
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -Times 1 -Exactly -Scope It
        }

    }

}
