# Change Log

All notable changes to this project will be documented in this file.

## Unreleased

### Added

- Initial release of `IdentityCommand.RemoteAccess`, wrapping the CyberArk Remote Access API.
- `Connect-RATenant`: authenticate a Remote Access service account (Client ID/Secret, or a service
  account JSON file) via its own OAuth2 client-credentials flow against `auth.<datacenter>` -
  unlike every other companion module, Remote Access does not authenticate via CyberArk Identity.
- Vendors: `Get-`, `Set-`, `Remove-RAVendor` and `Set-RAVendorStatus`.
- Users: `Get-`, `Remove-RAUser`, `Set-RAUserStatus`, `Set-RAUserRole`, `Get-RAUserTeam`,
  `Add-RAUserToTeam`, `Remove-RAUserFromTeam`, `Set-RAVendorManagerPermission` and
  `Grant-RAVendorManagerPermission`.
- Groups: `Get-`, `New-`, `Set-`, `Remove-RAGroup`.
- Vendor Manager teams: `Get-`, `New-`, `Remove-RATeam`, `Get-RATeamMember`, `Add-RATeamMember`,
  `Remove-RATeamMember`.
- Self-service requests: `Get-RASelfServiceRequest`, `Approve-RASelfServiceRequest`,
  `Deny-RASelfServiceRequest`.
- Invitations: `New-RAVendorInvitation`, `New-RAUserInvitation`, `Get-RAVendorInvitation`,
  `Remove-RAVendorInvitation`.
- `Get-RASite`, `Get-RAApplication`, `Get-RAConnector`, `Get-RAActivity`.
- `Get-RAModuleData`: get the module version and session configuration data.
