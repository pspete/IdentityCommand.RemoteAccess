# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAApplication {

    [CmdletBinding()]
    param(

        #The unique ID of the site.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$siteId,

        #The number of entries to skip.
        [parameter(Mandatory = $false)]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false)]
        [int]$limit

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/sites/$([uri]::EscapeDataString($siteId))/applications"

        $boundparameters = $PSBoundParameters | Get-Parameter -ParametersToRemove 'siteId'
        $URI = Add-QueryString -URI $URI -Parameter $boundparameters
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'applications'
        }

    }#process

    end { }#end

}
