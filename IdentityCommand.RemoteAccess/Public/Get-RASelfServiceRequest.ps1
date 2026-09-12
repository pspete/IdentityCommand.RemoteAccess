# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RASelfServiceRequest {

    [CmdletBinding()]
    param(

        #The string to use in the search.
        [parameter(Mandatory = $false)]
        [String]$searchString,

        #The field in which to perform the search.
        [parameter(Mandatory = $false)]
        [String]$searchIn,

        #The start of the time range filter.
        [parameter(Mandatory = $false)]
        [datetime]$fromTime,

        #The end of the time range filter.
        [parameter(Mandatory = $false)]
        [datetime]$toTime,

        #The number of entries to skip.
        [parameter(Mandatory = $false)]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false)]
        [int]$limit

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/selfServiceRequests/"

        $boundparameters = $PSBoundParameters | Get-Parameter

        if ($PSBoundParameters.ContainsKey('fromTime')) { $boundparameters.fromTime = $fromTime | ConvertTo-RAEpochMillisecond }
        if ($PSBoundParameters.ContainsKey('toTime')) { $boundparameters.toTime = $toTime | ConvertTo-RAEpochMillisecond }

        $URI = Add-QueryString -URI $URI -Parameter $boundparameters
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'requests'
        }

    }#process

    end { }#end

}
