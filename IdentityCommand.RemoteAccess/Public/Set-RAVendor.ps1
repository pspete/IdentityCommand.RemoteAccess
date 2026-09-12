# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAVendor {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the vendor.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [String]$vendorId,

        #The phone number that the vendor set when they registered for Remote Access, in international format.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ByPhone')]
        [ValidateNotNullOrEmpty()]
        [String]$phoneNumber,

        #The date when the vendor's access to Remote Access begins.
        [parameter(Mandatory = $false)]
        [datetime]$accessStartDate,

        #The date when the vendor's access to Remote Access ends.
        [parameter(Mandatory = $false)]
        [datetime]$accessEndDate,

        #Indicates whether the vendor can invite other vendors.
        [parameter(Mandatory = $false)]
        [switch]$canInvite,

        #Indicates whether additional vendors invited by the vendor are activated automatically or manually.
        [parameter(Mandatory = $false)]
        [ValidateSet('Activated', 'RequiresAdminConfirmation')]
        [String]$invitedVendorsInitialStatus,

        #The number of subvendors that the vendor can invite.
        [parameter(Mandatory = $false)]
        [int]$maxNumInvitedVendors,

        #The provisioning type of the invitee.
        [parameter(Mandatory = $false)]
        [ValidateSet('ProvisionedByAlero', 'ManagedByAdmin', 'None')]
        [String]$provisioningType,

        #The Vault user in the Idira PAM environment for the vendor.
        [parameter(Mandatory = $false)]
        [String]$username,

        #The groups that the vendor belongs to.
        [parameter(Mandatory = $false)]
        [String[]]$groups,

        #The identity roles that the vendor is added to.
        [parameter(Mandatory = $false)]
        [String[]]$idaptiveRoles,

        #Comments about the vendor, including the purpose of the invitation.
        [parameter(Mandatory = $false)]
        [String]$comments,

        #The applications and sites to update, as objects with siteId/applicationId properties.
        [parameter(Mandatory = $false)]
        [Object[]]$applications,

        #Indicates whether the vendor can access web applications.
        [parameter(Mandatory = $false)]
        [switch]$pvwaApplications

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/vendors"

        $URI = switch ($PSCmdlet.ParameterSetName) {
            'ById' { "$URI/$([uri]::EscapeDataString($vendorId))" }
            'ByPhone' { "$URI/phone/$([uri]::EscapeDataString($phoneNumber))" }
        }

        $Body = [ordered]@{ }

        if ($PSBoundParameters.ContainsKey('accessStartDate')) { $Body.accessStartDate = $accessStartDate | ConvertTo-RAEpochMillisecond }
        if ($PSBoundParameters.ContainsKey('accessEndDate')) { $Body.accessEndDate = $accessEndDate | ConvertTo-RAEpochMillisecond }
        if ($PSBoundParameters.ContainsKey('canInvite')) { $Body.canInvite = [bool]$canInvite }
        if ($PSBoundParameters.ContainsKey('invitedVendorsInitialStatus')) { $Body.invitedVendorsInitialStatus = $invitedVendorsInitialStatus }
        if ($PSBoundParameters.ContainsKey('maxNumInvitedVendors')) { $Body.maxNumInvitedVendors = $maxNumInvitedVendors }
        if ($PSBoundParameters.ContainsKey('provisioningType')) { $Body.provisioningType = $provisioningType }
        if ($PSBoundParameters.ContainsKey('username')) { $Body.username = $username }
        if ($PSBoundParameters.ContainsKey('groups')) { $Body.groups = @($groups) }
        if ($PSBoundParameters.ContainsKey('idaptiveRoles')) { $Body.idaptiveRoles = @($idaptiveRoles) }
        if ($PSBoundParameters.ContainsKey('comments')) { $Body.comments = $comments }
        if ($PSBoundParameters.ContainsKey('applications')) { $Body.applications = @($applications) }
        if ($PSBoundParameters.ContainsKey('pvwaApplications')) { $Body.pvwaApplications = [bool]$pvwaApplications }

        if ($PSCmdlet.ShouldProcess($(if ($vendorId) { $vendorId } else { $phoneNumber }), 'Update vendor')) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
