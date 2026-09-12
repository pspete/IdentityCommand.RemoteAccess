# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Get-RAActivity {

    [CmdletBinding()]
    param(

        #The list of activity types to retrieve.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet(
            'ApplicationCreated', 'ApplicationDeleted', 'ApplicationUpdated', 'ApplicationEnabled',
            'ApplicationDisabled', 'ApplicationUserLogin', 'ConnectorCreated', 'ConnectorDeleted',
            'ConnectorInitializationExtended', 'ConnectorInitialized', 'ConnectorUpdated',
            'ConnectorLdapUpdated', 'ConnectorLdapInitialized', 'ConnectorLdapStopped',
            'GroupsCreated', 'GroupsDeleted', 'GroupsUpdated', 'SettingsUpdated', 'SiteCreated',
            'SiteDeleted', 'SiteUpdated', 'TenantAliasUpdated', 'TenantCreated', 'TenantLogin',
            'UserActivated', 'UserDeactivated', 'VendorActivated', 'VendorDeactivated',
            'VendorUpdated', 'UserDeleteFromTenant', 'VendorDeleteFromTenant', 'UserJoinTenant',
            'VendorJoinTenant', 'UserCreated', 'UserUpdated', 'UserRoleChanged',
            'ApplicationVendorLogin', 'AppCertificateCreated', 'AppCertificateDeleted',
            'AppCertificateUpdated', 'CompanyUserInvitationCreate', 'VendorInvitationCreate',
            'ServiceAccountCreated', 'ServiceAccountDeleted', 'ServiceAccountActivated',
            'ServiceAccountDeactivated', 'ApplicationLoginBlocked', 'DirectAccessUserResponse',
            'DirectAccessConnectionDenied', 'OfflineAccessUserViewedPassword', 'IdaptiveVendorSync',
            'IdaptiveRoleSync', 'CompanyInviterUpdated'
        )]
        [String[]]$activityTypes,

        #The start of the time range filter.
        [parameter(Mandatory = $false)]
        [datetime]$fromTime,

        #The end of the time range filter.
        [parameter(Mandatory = $false)]
        [datetime]$toTime,

        #The number of entries to skip.
        [parameter(Mandatory = $false)]
        [int]$offset,

        #The maximum number of entries to return.
        [parameter(Mandatory = $false)]
        [int]$limit

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/activities"

        $boundparameters = $PSBoundParameters | Get-Parameter

        if ($PSBoundParameters.ContainsKey('fromTime')) { $boundparameters.fromTime = $fromTime | ConvertTo-RAEpochMillisecond }
        if ($PSBoundParameters.ContainsKey('toTime')) { $boundparameters.toTime = $toTime | ConvertTo-RAEpochMillisecond }

        $URI = Add-QueryString -URI $URI -Parameter $boundparameters
        $result = Invoke-IDRestMethod -Uri $URI -Method GET

        if ($null -ne $result) {
            Get-PagedResult -InitialResult $result -URI $URI -Style Offset -ResultProperty 'activities'
        }

    }#process

    end { }#end

}
