# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RAUser {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))"

        if ($PSCmdlet.ShouldProcess($userId, 'Delete user')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
