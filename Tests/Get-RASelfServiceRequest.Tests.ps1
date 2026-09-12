BeforeAll {
    $Script:RAModuleName = 'IdentityCommand.RemoteAccess'

    $Here = Split-Path -Parent $PSCommandPath
    $ModulePath = Resolve-Path "$Here\..\$Script:RAModuleName"
    $ManifestPath = Join-Path "$ModulePath" "$Script:RAModuleName.psd1"

    if ( -not (Get-Module -Name $Script:RAModuleName -All)) {
        Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop
    }
}

Describe 'Get-RASelfServiceRequest' {

    BeforeEach {

        Mock -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -MockWith { [pscustomobject]@{ requests = @([pscustomobject]@{ id = "r1" }); totalCount = 1 } }

        InModuleScope -ModuleName $Script:RAModuleName {
            $ISPSSSession = [ordered]@{
                tenant_url = 'https://api.alero.io'
                WebSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession
            }
            New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force
        }

        $Script:response = Get-RASelfServiceRequest

    }

    Context 'Request' {

        It 'sends request to expected endpoint' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $URI -eq 'https://api.alero.io/v2-edge/selfServiceRequests/'
            } -Times 1 -Exactly -Scope It
        }

        It 'uses expected method' {
            Should -Invoke -CommandName Invoke-IDRestMethod -ModuleName $Script:RAModuleName -ParameterFilter {
                $Method -eq 'GET'
            } -Times 1 -Exactly -Scope It
        }

    }

}
