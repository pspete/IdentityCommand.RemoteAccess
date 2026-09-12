# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAUserRole {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId,

        #The user role.
        [parameter(Mandatory = $true)]
        [ValidateSet('TenantAdmin', 'User', 'VendorManager')]
        [String]$role

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))/role"

        if ($PSCmdlet.ShouldProcess($userId, "Set user role: $role")) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($role | ConvertTo-Json)

        }

    }#process

    end { }#end

}
