# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RASite {

    [CmdletBinding()]
    param(

        #The number of entries to skip.
        [parameter(Mandatory = $false)]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false)]
        [int]$limit

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/sites"

        $boundparameters = $PSBoundParameters | Get-Parameter
        $URI = Add-QueryString -URI $URI -Parameter $boundparameters
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'sites'
        }

    }#process

    end { }#end

}
