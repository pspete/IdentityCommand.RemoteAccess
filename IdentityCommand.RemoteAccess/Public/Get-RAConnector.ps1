# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAConnector {

    [CmdletBinding()]
    param(

        #The unique ID of the site.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$siteId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/connectors/$([uri]::EscapeDataString($siteId))"

        #No offset/limit query parameters are documented for this endpoint - a single call returns
        #every connector for the site.
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            $result.connectors
        }

    }#process

    end { }#end

}
