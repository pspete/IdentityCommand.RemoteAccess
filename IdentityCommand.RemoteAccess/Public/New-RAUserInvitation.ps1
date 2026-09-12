# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function New-RAUserInvitation {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The users to invite, as objects with name/emailAddress properties.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Object[]]$usersToInvite,

        #The date and time when the invitation expires. After this time, invited users can no longer accept it.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [datetime]$invitationExpirationTime,

        #The initial activation status for users created from the invitation. The only supported value is Deactivated.
        [parameter(Mandatory = $false)]
        [ValidateSet('Deactivated', 'Activated')]
        [String]$initialStatus

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/invitations/user-invitations"

        $Body = $PSBoundParameters | Get-Parameter
        $Body.invitationExpirationTime = $invitationExpirationTime | ConvertTo-RAEpochMillisecond

        if ($PSCmdlet.ShouldProcess(($usersToInvite | ForEach-Object { $_.emailAddress }) -join ', ', 'Create user invitation')) {

            Invoke-IDRestMethod -Uri $URI -Method POST -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
