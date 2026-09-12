# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAVendor {

    [CmdletBinding(DefaultParameterSetName = 'List')]
    param(

        #The unique ID of the vendor.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$vendorId,

        #The phone number that the vendor set when they registered for Remote Access, in international format.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ByPhone')]
        [ValidateNotNullOrEmpty()]
        [String]$phoneNumber,

        #The ID of the Remote Access user who invited the vendor.
        [parameter(Mandatory = $false, ParameterSetName = 'List')]
        [String]$invitedBy,

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

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/vendors"

        switch ($PSCmdlet.ParameterSetName) {

            'ById' {

                $URI = "$URI/$([uri]::EscapeDataString($vendorId))"
                Invoke-IDRestMethod -Uri $URI -Method GET

            }

            'ByPhone' {

                $URI = "$URI/phone/$([uri]::EscapeDataString($phoneNumber))"
                Invoke-IDRestMethod -Uri $URI -Method GET

            }

            'List' {

                $boundparameters = $PSBoundParameters | Get-Parameter
                $URI = Add-QueryString -URI $URI -Parameter $boundparameters
                $result = Invoke-IDRestMethod -Uri $URI -Method GET

                if ($null -ne $result) {
                    Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'vendors'
                }

            }

        }

    }#process

    end { }#end

}
