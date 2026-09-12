# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAVendorManagerPermission {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId,

        #The date when the vendor's access to Remote Access begins.
        [parameter(Mandatory = $true)]
        [datetime]$accessPeriodStartDate,

        #The date when the vendor's access to Remote Access ends.
        [parameter(Mandatory = $true)]
        [datetime]$accessPeriodEndDate,

        #The account activation type.
        [parameter(Mandatory = $true)]
        [ValidateSet('AUTOMATIC', 'REQUIRES_ADMIN_CONFIRMATION', 'REQUIRES_INTERNAL_VENDOR_MANAGER_CONFIRMATION')]
        [String]$accountActivation,

        #A Vault user must be created to represent invited vendors in the Idira PAM environment.
        [parameter(Mandatory = $true)]
        [ValidateSet('ProvisionedByAlero', 'ManagedByAdmin', 'None')]
        [String]$userProvisioning,

        #Indicates whether the vendor manager can invite vendors to web applications.
        [parameter(Mandatory = $true)]
        [switch]$canInviteToWebApps,

        #Indicates whether the vendor manager can delegate permissions to other external vendor managers.
        [parameter(Mandatory = $true)]
        [switch]$canDelegatePermissionsToExternalVendorManagers,

        #Indicates whether the vendor manager can create groups.
        [parameter(Mandatory = $true)]
        [switch]$canCreateGroups,

        #Indicates whether the vendor manager can invite vendors to all groups.
        [parameter(Mandatory = $true)]
        [switch]$canInviteToAllGroups,

        #Indicates whether the vendor manager can invite vendors to all applications.
        [parameter(Mandatory = $true)]
        [switch]$canInviteToAllApps,

        #The applications that the vendor can access through Remote Access, as objects with id/siteId properties.
        [parameter(Mandatory = $false)]
        [Object[]]$allowedApps,

        #The number of vendors that the vendor manager can invite. 0 for unlimited.
        [parameter(Mandatory = $false)]
        [int]$maxInvitedVendors,

        #The groups that invited vendors should belong to.
        [parameter(Mandatory = $false)]
        [String[]]$userGroups,

        #The identity roles that invited vendors should have.
        [parameter(Mandatory = $false)]
        [String[]]$idaptiveRoles,

        #The Vault user in the Idira PAM environment to be created for the vendor.
        [parameter(Mandatory = $false)]
        [String]$provisioningUsername,

        #Allowed email domains for invited vendors.
        [parameter(Mandatory = $false)]
        [String[]]$allowedEmailDomains

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))/vendor-manager-permission"

        $Body = [ordered]@{
            accessPeriodStartDate                          = $accessPeriodStartDate | ConvertTo-RAEpochMillisecond
            accessPeriodEndDate                            = $accessPeriodEndDate | ConvertTo-RAEpochMillisecond
            accountActivation                               = $accountActivation
            userProvisioning                                = $userProvisioning
            canInviteToWebApps                              = [bool]$canInviteToWebApps
            canDelegatePermissionsToExternalVendorManagers  = [bool]$canDelegatePermissionsToExternalVendorManagers
            canCreateGroups                                 = [bool]$canCreateGroups
            canInviteToAllGroups                            = [bool]$canInviteToAllGroups
            canInviteToAllApps                              = [bool]$canInviteToAllApps
        }

        if ($PSBoundParameters.ContainsKey('allowedApps')) { $Body.allowedApps = @($allowedApps) }
        if ($PSBoundParameters.ContainsKey('maxInvitedVendors')) { $Body.maxInvitedVendors = $maxInvitedVendors }
        if ($PSBoundParameters.ContainsKey('userGroups')) { $Body.userGroups = @($userGroups) }
        if ($PSBoundParameters.ContainsKey('idaptiveRoles')) { $Body.idaptiveRoles = @($idaptiveRoles) }
        if ($PSBoundParameters.ContainsKey('provisioningUsername')) { $Body.provisioningUsername = $provisioningUsername }
        if ($PSBoundParameters.ContainsKey('allowedEmailDomains')) { $Body.allowedEmailDomains = @($allowedEmailDomains) }

        if ($PSCmdlet.ShouldProcess($userId, 'Update internal vendor manager permissions')) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
