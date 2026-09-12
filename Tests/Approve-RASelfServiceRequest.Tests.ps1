BeforeAll {
    $Script:RAModuleName = 'IdentityCommand.RemoteAccess'

    $Here = Split-Path -Parent $PSCommandPath
    $ModulePath = Resolve-Path "$Here\..\$Script:RAModuleName"
    $ManifestPath = Join-Path "$ModulePath" "$Script:RAModuleName.psd1"

    if ( -not (Get-Module -Name $Script:RAModuleName -All)) {
        Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop
    }
}

Describe 'Approve-RASelfServiceRequest' {

    BeforeEach {

        Mock -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -MockWith { [pscustomobject]@{ } }

        InModuleScope -ModuleName $Script:RAModuleName {
            $ISPSSSession = [ordered]@{
                tenant_url = 'https://api.alero.io'
                WebSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession
            }
            New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force
        }

        $Script:response = Approve-RASelfServiceRequest -id 'r1' -initialStatus Activated -accessStartDate (Get-Date '2026-01-01') -accessEndDate (Get-Date '2026-06-01') -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' }) -Confirm:$false

    }

    Context 'Request' {

        It 'sends request to expected endpoint' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $URI -eq 'https://api.alero.io/v2-edge/selfServiceRequests/r1'
            } -Times 1 -Exactly -Scope It
        }

        It 'uses expected method' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $Method -eq 'POST'
            } -Times 1 -Exactly -Scope It
        }

        It 'sends expected body' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                ($Body | ConvertFrom-Json).initialStatus -eq 'Activated'
            } -Times 1 -Exactly -Scope It
        }

        It 'does not send a request when WhatIf is specified' {
            Approve-RASelfServiceRequest -id 'r1' -initialStatus Activated -accessStartDate (Get-Date '2026-01-01') -accessEndDate (Get-Date '2026-06-01') -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' }) -WhatIf
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -Times 1 -Exactly -Scope It
        }

    }

}
