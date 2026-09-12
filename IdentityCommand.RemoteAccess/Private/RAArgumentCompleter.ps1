#The completer helper functions this file used to define now live in IdentityCommand's
#Private folder, which the psm1 loads into this module's scope.

#region Registration

Register-ArgumentCompleter -ParameterName 'vendorId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAVendor' -ValueProperty 'id' -LabelProperty 'fullName'
) -CommandName @(
    'Get-RAVendor'
    'Set-RAVendor'
    'Remove-RAVendor'
    'Set-RAVendorStatus'
)

Register-ArgumentCompleter -ParameterName 'userId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAUser' -ValueProperty 'id' -LabelProperty 'username'
) -CommandName @(
    'Get-RAUser'
    'Remove-RAUser'
    'Set-RAUserStatus'
    'Set-RAUserRole'
    'Get-RAUserTeam'
    'Add-RAUserToTeam'
    'Remove-RAUserFromTeam'
    'Set-RAVendorManagerPermission'
    'Grant-RAVendorManagerPermission'
    'Add-RATeamMember'
    'Remove-RATeamMember'
)

Register-ArgumentCompleter -ParameterName 'groupId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAGroup' -ValueProperty 'id' -LabelProperty 'name'
) -CommandName @(
    'Get-RAGroup'
    'Set-RAGroup'
    'Remove-RAGroup'
)

Register-ArgumentCompleter -ParameterName 'teamId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RATeam' -ValueProperty 'id' -LabelProperty 'name'
) -CommandName @(
    'Get-RATeam'
    'Remove-RATeam'
    'Get-RATeamMember'
    'Add-RATeamMember'
    'Remove-RATeamMember'
    'Add-RAUserToTeam'
    'Remove-RAUserFromTeam'
)

Register-ArgumentCompleter -ParameterName 'siteId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RASite' -ValueProperty 'id' -LabelProperty 'displayName'
) -CommandName @(
    'Get-RAApplication'
    'Get-RAConnector'
)

Register-ArgumentCompleter -ParameterName 'invitationId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAVendorInvitation' -ValueProperty 'invitationId' -LabelProperty 'fullName'
) -CommandName @(
    'Get-RAVendorInvitation'
    'Remove-RAVendorInvitation'
)

#endregion
