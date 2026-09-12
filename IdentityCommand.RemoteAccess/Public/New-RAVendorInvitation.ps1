# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function New-RAVendorInvitation {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The name of the company that the user represents as a Remote Access user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$companyName,

        #The user's email address in the company they represent.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$emailAddress,

        #The vendor's first name.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$firstName,

        #The vendor's last name.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$lastName,

        #The phone number that the user set when they registered for Remote Access, in international format.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$phoneNumber,

        #Indicates whether the vendor's account is activated automatically or manually.
        [parameter(Mandatory = $true)]
        [ValidateSet('Activated', 'RequiresAdminConfirmation')]
        [String]$initialStatus,

        #The date when the vendor's access to Remote Access begins.
        [parameter(Mandatory = $true)]
        [datetime]$accessStartDate,

        #The date when the vendor's access to Remote Access ends.
        [parameter(Mandatory = $true)]
        [datetime]$accessEndDate,

        #Indicates whether the vendor can invite other vendors.
        [parameter(Mandatory = $true)]
        [bool]$canInvite,

        #The applications that the vendor can access through Remote Access, as objects with siteId/applicationId properties.
        [parameter(Mandatory = $true)]
        [Object[]]$applications,

        #Time-based access restrictions, as an object with timeZone/allowedDays/allDay/workingHoursStartSeconds/workingHoursEndSeconds properties.
        [parameter(Mandatory = $false)]
        [Object]$accessTimeDetails,

        #Comments about the vendor, including the purpose of the invitation.
        [parameter(Mandatory = $false)]
        [String]$comments,

        #The provisioning type of the invitee.
        [parameter(Mandatory = $false)]
        [ValidateSet('ProvisionedByAlero', 'ManagedByAdmin', 'None')]
        [String]$provisioningType,

        #The Vault user in the Idira PAM environment to be created for the vendor.
        [parameter(Mandatory = $false)]
        [String]$provisioningUsername,

        #The groups that the vendor is added to.
        [parameter(Mandatory = $false)]
        [String[]]$provisioningGroups,

        #The identity roles that the vendor is added to.
        [parameter(Mandatory = $false)]
        [String[]]$idaptiveRoles,

        #The name of a predefined invitation template added to the vendor invitation.
        [parameter(Mandatory = $false)]
        [String]$customText,

        #The number of subvendors that the vendor can invite. 0 for unlimited.
        [parameter(Mandatory = $false)]
        [int]$maxNumOfInvitedVendors,

        #Indicates whether the vendor authenticates with an SMS code or phone call plus an emailed token, instead of scanning a QR code.
        [parameter(Mandatory = $false)]
        [bool]$phoneAndEmailAuth,

        #Indicates whether additional vendors invited by the vendor are activated automatically or manually.
        [parameter(Mandatory = $false)]
        [ValidateSet('Activated', 'RequiresAdminConfirmation')]
        [String]$invitedVendorsInitialStatus,

        #Indicates whether the vendor can access web applications.
        [parameter(Mandatory = $false)]
        [bool]$enableWebAppsAccess

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/invitations/vendor-invitations"

        $Body = $PSBoundParameters | Get-Parameter

        switch ($PSBoundParameters.Keys) {
            'accessStartDate' { $Body.accessStartDate = $accessStartDate | ConvertTo-RAEpochMillisecond }
            'accessEndDate' { $Body.accessEndDate = $accessEndDate | ConvertTo-RAEpochMillisecond }
        }

        if ($PSCmdlet.ShouldProcess($emailAddress, 'Create vendor invitation')) {

            Invoke-IDRestMethod -Uri $URI -Method POST -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
