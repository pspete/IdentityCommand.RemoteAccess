# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RAVendor {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the vendor.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$vendorId,

        #The phone number that the vendor set when they registered for Remote Access, in international format.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ByPhone')]
        [ValidateNotNullOrEmpty()]
        [String]$phoneNumber

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/vendors"

        $URI = switch ($PSCmdlet.ParameterSetName) {
            'ById' { "$URI/$([uri]::EscapeDataString($vendorId))" }
            'ByPhone' { "$URI/phone/$([uri]::EscapeDataString($phoneNumber))" }
        }

        if ($PSCmdlet.ShouldProcess($(if ($vendorId) { $vendorId } else { $phoneNumber }), 'Delete vendor')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
