---
title: "IdentityCommand.RemoteAccess Release 0.1"
date: 2026-10-16 00:00:00
version: 0.1.1
tags:
  - Release Notes
  - Connect-RATenant
  - Remove-RAVendor
  - Set-RAVendorStatus
  - Remove-RAUser
  - Set-RAUserStatus
  - Set-RAUserRole
  - Get-RAUserTeam
  - Add-RAUserToTeam
  - Remove-RAUserFromTeam
  - Set-RAVendorManagerPermission
  - Grant-RAVendorManagerPermission
  - Remove-RAGroup
  - Remove-RATeam
  - Get-RATeamMember
  - Add-RATeamMember
  - Remove-RATeamMember
  - Get-RASelfServiceRequest
  - Approve-RASelfServiceRequest
  - Deny-RASelfServiceRequest
  - New-RAVendorInvitation
  - New-RAUserInvitation
  - Get-RAVendorInvitation
  - Remove-RAVendorInvitation
  - Get-RASite
  - Get-RAApplication
  - Get-RAConnector
  - Get-RAActivity
  - Get-RAModuleData
  - Get-RAGroup
  - Get-RATeam
  - Get-RAUser
  - Get-RAVendor
---

## [0.1.1]

### Changed

- CI caches the PowerShell modules it installs, so dependency installs skip the PowerShell Gallery on a cache hit.

### Removed

- `-offset` from `Get-RAActivity`, `Get-RAApplication`, `Get-RAGroup`, `Get-RASelfServiceRequest`, `Get-RASite`, `Get-RATeam`, `Get-RATeamMember`, `Get-RAUser`, `Get-RAVendor` and `Get-RAVendorInvitation`. Every page is retrieved automatically, and a starting offset returned duplicated and missing items.

## [0.1.0]

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
