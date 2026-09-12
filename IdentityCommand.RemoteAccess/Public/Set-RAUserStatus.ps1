# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAUserStatus {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId,

        #The updated status of the user's account. PendingActivation is not allowed here.
        [parameter(Mandatory = $true)]
        [ValidateSet('Deactivated', 'Activated')]
        [String]$status

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))/status"

        if ($PSCmdlet.ShouldProcess($userId, "Set user status: $status")) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($status | ConvertTo-Json)

        }

    }#process

    end { }#end

}
