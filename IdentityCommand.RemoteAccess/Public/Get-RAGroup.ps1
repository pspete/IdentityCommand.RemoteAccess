# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAGroup {

    [CmdletBinding(DefaultParameterSetName = 'List')]
    param(

        #The unique ID of the VendorLDAP group.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$groupId,

        #The string to use in the search.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [String]$searchString,

        #The field in which to perform the search.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [String]$searchIn,

        #The number of entries to skip.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [int]$limit

    )

    begin { }#begin

    process {

        switch ($PSCmdlet.ParameterSetName) {

            'ById' {

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/groups/$([uri]::EscapeDataString($groupId))"
                Invoke-IDRestMethod -Uri $URI -Method GET

            }

            'List' {

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/groups"
                $boundparameters = $PSBoundParameters | Get-Parameter
                $URI = Add-QueryString -URI $URI -Parameter $boundparameters
                $result = Invoke-IDRestMethod -Uri $URI -Method GET

                if ($null -ne $result) {
                    Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'groups'
                }

            }

        }

    }#process

    end { }#end

}
