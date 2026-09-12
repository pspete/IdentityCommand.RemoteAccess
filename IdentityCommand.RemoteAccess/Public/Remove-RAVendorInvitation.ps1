# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RAVendorInvitation {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the vendor invitation.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$invitationId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/invitations/vendor-invitations/$([uri]::EscapeDataString($invitationId))"

        if ($PSCmdlet.ShouldProcess($invitationId, 'Delete vendor invitation')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
