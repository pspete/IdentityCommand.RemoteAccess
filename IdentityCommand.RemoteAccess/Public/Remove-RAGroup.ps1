# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RAGroup {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the VendorLDAP group. Groups that contain members or pending invitations cannot be deleted.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$groupId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/groups/$([uri]::EscapeDataString($groupId))"

        if ($PSCmdlet.ShouldProcess($groupId, 'Delete group')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
