# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Approve-RASelfServiceRequest {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the request.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$id,

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
        [switch]$canInvite,

        #The applications that the vendor can access through Remote Access, as objects with siteId/applicationId properties.
        [parameter(Mandatory = $true)]
        [Object[]]$applications,

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

        #The name of a predefined invitation template added to the vendor invitation.
        [parameter(Mandatory = $false)]
        [String]$customText,

        #The number of subvendors that the vendor can invite. 0 for unlimited.
        [parameter(Mandatory = $false)]
        [int]$maxNumOfInvitedVendors,

        #Indicates whether the vendor authenticates with an SMS code or phone call plus an emailed token, instead of scanning a QR code.
        [parameter(Mandatory = $false)]
        [switch]$phoneAndEmailAuth,

        #Indicates whether additional vendors invited by the vendor are activated automatically or manually.
        [parameter(Mandatory = $false)]
        [ValidateSet('Activated', 'RequiresAdminConfirmation')]
        [String]$invitedVendorsInitialStatus

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/selfServiceRequests/$([uri]::EscapeDataString($id))"

        $Body = [ordered]@{
            initialStatus   = $initialStatus
            accessStartDate = $accessStartDate | ConvertTo-RAEpochMillisecond
            accessEndDate   = $accessEndDate | ConvertTo-RAEpochMillisecond
            canInvite       = [bool]$canInvite
            applications    = @($applications)
        }

        if ($PSBoundParameters.ContainsKey('comments')) { $Body.comments = $comments }
        if ($PSBoundParameters.ContainsKey('provisioningType')) { $Body.provisioningType = $provisioningType }
        if ($PSBoundParameters.ContainsKey('provisioningUsername')) { $Body.provisioningUsername = $provisioningUsername }
        if ($PSBoundParameters.ContainsKey('provisioningGroups')) { $Body.provisioningGroups = @($provisioningGroups) }
        if ($PSBoundParameters.ContainsKey('customText')) { $Body.customText = $customText }
        if ($PSBoundParameters.ContainsKey('maxNumOfInvitedVendors')) { $Body.maxNumOfInvitedVendors = $maxNumOfInvitedVendors }
        if ($PSBoundParameters.ContainsKey('phoneAndEmailAuth')) { $Body.phoneAndEmailAuth = [bool]$phoneAndEmailAuth }
        if ($PSBoundParameters.ContainsKey('invitedVendorsInitialStatus')) { $Body.invitedVendorsInitialStatus = $invitedVendorsInitialStatus }

        if ($PSCmdlet.ShouldProcess($id, 'Approve self-service request')) {

            Invoke-IDRestMethod -Uri $URI -Method POST -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
