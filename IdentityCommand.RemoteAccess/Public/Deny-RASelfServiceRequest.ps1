# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Deny-RASelfServiceRequest {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the request.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$id

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/selfServiceRequests/$([uri]::EscapeDataString($id))"

        if ($PSCmdlet.ShouldProcess($id, 'Reject self-service request')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
