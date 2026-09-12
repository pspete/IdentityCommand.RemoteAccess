# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RATeamMember {

    [CmdletBinding()]
    param(

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$teamId,

        #Search string to filter members by name.
        [parameter(Mandatory = $false)]
        [String]$searchString,

        #The number of entries to skip.
        [parameter(Mandatory = $false)]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false)]
        [int]$limit,

        #Field to sort by.
        [parameter(Mandatory = $false)]
        [ValidateSet('FULLNAME')]
        [String]$sortBy,

        #Sort direction.
        [parameter(Mandatory = $false)]
        [ValidateSet('ASC', 'DESC')]
        [String]$sortDirection

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams/$([uri]::EscapeDataString($teamId))/members"

        $boundparameters = $PSBoundParameters | Get-Parameter -ParametersToRemove 'teamId'
        $URI = Add-QueryString -URI $URI -Parameter $boundparameters
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'members'
        }

    }#process

    end { }#end

}
