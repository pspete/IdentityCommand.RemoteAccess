BeforeAll {
    $ModuleName = 'IdentityCommand.RemoteAccess'

    $Here = Split-Path -Parent $PSCommandPath
    $ModulePath = Resolve-Path "$Here\..\$ModuleName"
    $ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"

    if ( -not (Get-Module -Name $ModuleName -All)) {
        Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop
    }
}

Describe 'Get-RAModuleData' {

    InModuleScope 'IdentityCommand.RemoteAccess' {

        BeforeEach {

            $ISPSSSession = [ordered]@{
                tenant_url = 'https://api.alero.io'
                WebSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession
                StartTime  = (Get-Date).AddMinutes(-5)
            }
            New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force

        }

        It 'returns a clone of the session data' {

            $Result = Get-RAModuleData

            $Result.tenant_url | Should -Be 'https://api.alero.io'

        }

        It 'calculates the elapsed time since the session started' {

            $Result = Get-RAModuleData

            $Result.ElapsedTime | Should -Not -BeNullOrEmpty

        }

    }

}
