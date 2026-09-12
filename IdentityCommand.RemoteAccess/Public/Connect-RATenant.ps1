# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Connect-RATenant {

    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '', Justification = 'Re-securing a plaintext secret read from a service account file the caller already controls, for consistent in-memory handling with the ClientCredentials parameter set')]
    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'ClientCredentials')]
    param(

        #The Remote Access datacenter hosting the tenant (alero.io, alero.eu, ca.alero.io, etc) -
        #forms both the token endpoint (auth.<datacenter>) and the API endpoint (api.<datacenter>).
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ClientCredentials')]
        [ValidateNotNullOrEmpty()]
        [String]$Datacenter,

        #The service account Client ID.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ClientCredentials')]
        [ValidateNotNullOrEmpty()]
        [String]$ClientID,

        #The service account Client Secret.
        [parameter(Mandatory = $true, ParameterSetName = 'ClientCredentials')]
        [ValidateNotNullOrEmpty()]
        [SecureString]$ClientSecret,

        #Path to a Remote Access service account JSON file (ClientID, ClientSecret, discoveryURI),
        #as issued from the Remote Access admin portal.
        [parameter(Mandatory = $true, ParameterSetName = 'ServiceAccountFile')]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo]$Path

    )

    begin { }#begin

    process {

        if ($PSCmdlet.ParameterSetName -eq 'ServiceAccountFile') {

            $ServiceAccount = Get-Content -Path $Path -Raw | ConvertFrom-Json

            $Datacenter = ($ServiceAccount.discoveryURI -split '/')[2] -replace '^auth\.', ''
            $ClientID = $ServiceAccount.ClientID
            $ClientSecret = ConvertTo-SecureString -String $ServiceAccount.ClientSecret -AsPlainText -Force

        }

        $TokenUrl = "https://auth.$Datacenter/auth/realms/serviceaccounts/protocol/openid-connect/token"

        if ($PSCmdlet.ShouldProcess($Datacenter, 'Authenticate Remote Access service account')) {

            $PlainClientSecret = ConvertTo-InsecureString -SecureString $ClientSecret

            $FormBody = -join (
                'grant_type=client_credentials',
                '&client_assertion_type=', [uri]::EscapeDataString('urn:ietf:params:oauth:client-assertion-type:jwt-bearer'),
                '&client_id=', [uri]::EscapeDataString($ClientID),
                '&client_secret=', [uri]::EscapeDataString($PlainClientSecret)
            )

            $TokenResponse = Invoke-IDRestMethod -Method POST -URI $TokenUrl -Body $FormBody -ContentType 'application/x-www-form-urlencoded'

            #Remote Access authenticates with its own service-account client-credentials flow, not the
            #CyberArk Identity bearer session every other companion module shares - building an
            #independent WebRequestSession here (rather than anything derived from Get-IDSession) keeps
            #this module's calls from ever mutating, or being mutated by, the shared Identity session.
            $WebSession = [Microsoft.PowerShell.Commands.WebRequestSession]::new()
            $WebSession.Headers['Authorization'] = "Bearer $($TokenResponse.access_token)"

            $ISPSSSession.WebSession = $WebSession
            $ISPSSSession.tenant_url = "https://api.$Datacenter"
            $ISPSSSession.StartTime = Get-Date

        }

    }#process

    end { }#end

}
