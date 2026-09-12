# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAVendorStatus {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the vendor.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$vendorId,

        #The updated status of the vendor's account. PendingActivation is not allowed here.
        [parameter(Mandatory = $true)]
        [ValidateSet('Activated', 'Deactivated')]
        [String]$status

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/vendors/$([uri]::EscapeDataString($vendorId))/status"

        if ($PSCmdlet.ShouldProcess($vendorId, "Set vendor status: $status")) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($status | ConvertTo-Json)

        }

    }#process

    end { }#end

}
