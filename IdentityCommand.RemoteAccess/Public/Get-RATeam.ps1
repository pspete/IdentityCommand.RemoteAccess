# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RATeam {

    [CmdletBinding(DefaultParameterSetName = 'List')]
    param(

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$teamId,

        #Search string to filter teams by name.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [String]$searchString,

        #The number of entries to skip.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [int]$limit,

        #Field to sort by.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [ValidateSet('NAME', 'INVITED_AT', 'INVITED_BY_NAME')]
        [String]$sortBy,

        #Sort direction.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [ValidateSet('ASC', 'DESC')]
        [String]$sortDirection

    )

    begin { }#begin

    process {

        switch ($PSCmdlet.ParameterSetName) {

            'ById' {

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams/$([uri]::EscapeDataString($teamId))"
                Invoke-IDRestMethod -Uri $URI -Method GET

            }

            'List' {

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams"
                $boundparameters = $PSBoundParameters | Get-Parameter
                $URI = Add-QueryString -URI $URI -Parameter $boundparameters
                $result = Invoke-IDRestMethod -Uri $URI -Method GET

                if ($null -ne $result) {
                    Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'teams'
                }

            }

        }

    }#process

    end { }#end

}
