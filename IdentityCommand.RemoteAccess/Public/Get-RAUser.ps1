# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAUser {

    [CmdletBinding(DefaultParameterSetName = 'List')]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$userId,

        #The name of the user to include in the returned list, or part of the name.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [String]$name,

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

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))"
                Invoke-IDRestMethod -Uri $URI -Method GET

            }

            'List' {

                $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/"
                $boundparameters = $PSBoundParameters | Get-Parameter
                $URI = Add-QueryString -URI $URI -Parameter $boundparameters
                $result = Invoke-IDRestMethod -Uri $URI -Method GET

                if ($null -ne $result) {
                    Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'users'
                }

            }

        }

    }#process

    end { }#end

}
