# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAUserTeam {

    [CmdletBinding()]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))/teams"

        #Response is a bare array (maxItems 500), with no offset/limit query parameters documented.
        Invoke-IDRestMethod -Uri $URI -Method GET

    }#process

    end { }#end

}
