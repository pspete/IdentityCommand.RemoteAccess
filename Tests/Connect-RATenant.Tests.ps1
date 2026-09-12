Describe $($PSCommandPath -Replace '.Tests.ps1') {

    BeforeAll {

        $Here = Split-Path -Parent $PSCommandPath
        $ModuleName = 'IdentityCommand.RemoteAccess'
        $ModulePath = Resolve-Path "$Here\..\$ModuleName"
        $ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"

        if ( -not (Get-Module -Name $ModuleName -All)) {

            Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

        }

    }

    InModuleScope 'IdentityCommand.RemoteAccess' {

        BeforeEach {

            $ISPSSSession = [ordered]@{
                tenant_url = $null
                WebSession = $null
                StartTime  = $null
            }
            New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force

            Mock Invoke-IDRestMethod -MockWith {
                [pscustomobject]@{ access_token = 'the-access-token' }
            }

        }

        Context 'Client credentials' {

            It 'authenticates against auth.<datacenter> with the supplied service account' {

                $Secret = 'topsecret' | ConvertTo-SecureString -AsPlainText -Force

                Connect-RATenant -Datacenter 'alero.io' -ClientID 't1.client1' -ClientSecret $Secret

                Should -Invoke -CommandName Invoke-IDRestMethod -ParameterFilter {
                    $URI -eq 'https://auth.alero.io/auth/realms/serviceaccounts/protocol/openid-connect/token' -and
                    $Method -eq 'POST' -and
                    $ContentType -eq 'application/x-www-form-urlencoded' -and
                    $Body -match 'client_id=t1\.client1' -and
                    $Body -match 'client_secret=topsecret'
                } -Times 1 -Exactly -Scope It

            }

            It 'sets the tenant url to api.<datacenter>' {

                $Secret = 'topsecret' | ConvertTo-SecureString -AsPlainText -Force

                Connect-RATenant -Datacenter 'alero.io' -ClientID 't1.client1' -ClientSecret $Secret

                $ISPSSSession.tenant_url | Should -Be 'https://api.alero.io'

            }

            It 'builds an independent WebRequestSession carrying the Bearer access token' {

                $Secret = 'topsecret' | ConvertTo-SecureString -AsPlainText -Force

                Connect-RATenant -Datacenter 'alero.io' -ClientID 't1.client1' -ClientSecret $Secret

                $ISPSSSession.WebSession | Should -BeOfType 'Microsoft.PowerShell.Commands.WebRequestSession'
                $ISPSSSession.WebSession.Headers['Authorization'] | Should -Be 'Bearer the-access-token'

            }

        }

        Context 'ServiceAccountFile' {

            It 'extracts the client id, secret and datacenter from the file' {

                $FilePath = Join-Path $TestDrive 'service-account.json'
                @{
                    ClientID     = 't1.client1'
                    ClientSecret = 'topsecret'
                    discoveryURI = 'https://auth.alero.eu/auth/realms/serviceaccounts'
                } | ConvertTo-Json | Set-Content -Path $FilePath

                Connect-RATenant -Path $FilePath

                Should -Invoke -CommandName Invoke-IDRestMethod -ParameterFilter {
                    $URI -eq 'https://auth.alero.eu/auth/realms/serviceaccounts/protocol/openid-connect/token' -and
                    $Body -match 'client_id=t1\.client1' -and
                    $Body -match 'client_secret=topsecret'
                } -Times 1 -Exactly -Scope It

                $ISPSSSession.tenant_url | Should -Be 'https://api.alero.eu'

            }

        }

    }

}
