# IdentityCommand.RemoteAccess

**IdentityCommand.RemoteAccess** is a PowerShell module that provides a set of easy-to-use commands, allowing you to interact with the **CyberArk Remote Access API** from within the PowerShell environment.

| Main Branch              | Latest Build             | CodeFactor                 | Coverage                     | PowerShell Gallery        | License                      |
| ------------------------ | ------------------------ | --------------------------- | ---------------------------- | -------------------------- | ---------------------------- |
| [![appveyor][]][av-site] | [![tests][]][tests-site] | [![codefactor][]][cf-site] | [![codecov][]][codecov-link] | [![psgallery][]][ps-site] | [![license][]][license-link] |

[appveyor]: https://ci.appveyor.com/api/projects/status/q2av77njofnsul92/branch/main?svg=true
[av-site]: https://ci.appveyor.com/project/pspete/IdentityCommand-RemoteAccess/branch/main
[psgallery]: https://img.shields.io/powershellgallery/v/IdentityCommand.RemoteAccess.svg
[ps-site]: https://www.powershellgallery.com/packages/IdentityCommand.RemoteAccess
[tests]: https://img.shields.io/appveyor/tests/pspete/IdentityCommand-RemoteAccess.svg
[tests-site]: https://ci.appveyor.com/project/pspete/IdentityCommand-RemoteAccess
[downloads]: https://img.shields.io/powershellgallery/dt/IdentityCommand.RemoteAccess.svg?color=blue
[cf-site]: https://www.codefactor.io/repository/github/pspete/IdentityCommand.RemoteAccess
[codefactor]: https://www.codefactor.io/repository/github/pspete/IdentityCommand.RemoteAccess/badge
[codecov]: https://codecov.io/gh/pspete/IdentityCommand.RemoteAccess/branch/main/graph/badge.svg
[codecov-link]: https://codecov.io/gh/pspete/IdentityCommand.RemoteAccess
[license]: https://img.shields.io/github/license/pspete/IdentityCommand.RemoteAccess.svg
[license-link]: https://github.com/pspete/IdentityCommand.RemoteAccess/blob/main/LICENSE

## Using the Module

`IdentityCommand.RemoteAccess` is a companion to (and hard dependency on) the `IdentityCommand` module, which provides the shared HTTP/helper plumbing every command uses - but not authentication itself. The `IdentityCommand` module must be installed and available in order to use `IdentityCommand.RemoteAccess`.

### Authentication

Unlike every other companion module, Remote Access does not authenticate via CyberArk Identity at all - it uses its own OAuth2 client-credentials flow, scoped to the datacenter that hosts the tenant (`alero.io`, `alero.eu`, `ca.alero.io`, etc), with a Remote Access service account.

```powershell
$Secret = Read-Host -AsSecureString -Prompt 'Client Secret'
Connect-RATenant -Datacenter 'alero.io' -ClientID '<tenant>.<client>' -ClientSecret $Secret
```

Or, from a downloaded service account JSON file:

```powershell
Connect-RATenant -Path .\service-account.json
```

`Connect-RATenant` exchanges the service account for a Bearer access token via `auth.<datacenter>`, and sets the tenant url to `api.<datacenter>` for every subsequent command.

### Vendors

```powershell
Get-RAVendor
Get-RAVendor -vendorId v123
Set-RAVendor -vendorId v123 -comments 'Renewed for Q3'
Set-RAVendorStatus -vendorId v123 -status Activated
Remove-RAVendor -vendorId v123
```

### Users and Vendor Manager Teams

```powershell
Get-RAUser
Set-RAUserRole -userId u123 -role VendorManager
Get-RAUserTeam -userId u123
Add-RAUserToTeam -userId u123 -teamId t456
Grant-RAVendorManagerPermission -userId u123 -accessPeriodStartDate (Get-Date) -accessPeriodEndDate (Get-Date).AddMonths(6) -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true
```

### Groups

```powershell
Get-RAGroup
New-RAGroup -name 'contractors' -description 'External contractor VendorLDAP group'
Set-RAGroup -groupId g123 -description 'Updated description'
Remove-RAGroup -groupId g123
```

### Vendor Manager Teams

```powershell
Get-RATeam
New-RATeam -name 'EMEA Vendor Managers' -accessPeriodStartDate (Get-Date) -accessPeriodEndDate (Get-Date).AddYears(1) -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true
Get-RATeamMember -teamId t456
Add-RATeamMember -teamId t456 -userId u123
Remove-RATeamMember -teamId t456 -userId u123
Remove-RATeam -teamId t456
```

### Self-Service Requests

```powershell
Get-RASelfServiceRequest
Approve-RASelfServiceRequest -id r789 -initialStatus Activated -accessStartDate (Get-Date) -accessEndDate (Get-Date).AddMonths(3) -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' })
Deny-RASelfServiceRequest -id r789
```

### Invitations

```powershell
New-RAVendorInvitation -companyName Acme -emailAddress vendor@acme.com -firstName Jane -lastName Doe -phoneNumber '+15551234567' -initialStatus Activated -accessStartDate (Get-Date) -accessEndDate (Get-Date).AddMonths(3) -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' })
New-RAUserInvitation -usersToInvite @(@{ name = 'John Smith'; emailAddress = 'john@acme.com' }) -invitationExpirationTime (Get-Date).AddDays(7)
Get-RAVendorInvitation
Remove-RAVendorInvitation -invitationId i123
```

### Sites, Applications and Connectors

```powershell
Get-RASite
Get-RAApplication -siteId s1
Get-RAConnector -siteId s1
```

### Activities

```powershell
Get-RAActivity -activityTypes SiteCreated, ApplicationCreated -fromTime (Get-Date).AddDays(-7)
```

## Full list of Commands

| Command                            | Description                                           |
| ----------------------------------- | ------------------------------------------------------ |
| `Connect-RATenant`                 | Authenticate a Remote Access service account          |
| `Get-RAModuleData`                 | Get the module version & session configuration data   |
| `Get-RAVendor`                     | Get vendors                                            |
| `Set-RAVendor`                     | Update a vendor                                        |
| `Remove-RAVendor`                  | Delete a vendor                                        |
| `Set-RAVendorStatus`               | Update a vendor's status                               |
| `Get-RAUser`                       | Get users                                              |
| `Remove-RAUser`                    | Delete a user                                          |
| `Set-RAUserStatus`                 | Update a user's status                                 |
| `Set-RAUserRole`                   | Update a user's role                                   |
| `Get-RAUserTeam`                   | Get a user's Vendor Manager teams                      |
| `Add-RAUserToTeam`                 | Add a user to a Vendor Manager team                    |
| `Remove-RAUserFromTeam`            | Remove a user from a Vendor Manager team               |
| `Set-RAVendorManagerPermission`    | Update internal vendor manager permissions             |
| `Grant-RAVendorManagerPermission`  | Delegate internal vendor manager permissions           |
| `Get-RAGroup`                      | Get groups                                             |
| `New-RAGroup`                      | Create a group                                         |
| `Set-RAGroup`                      | Update a group                                         |
| `Remove-RAGroup`                   | Delete a group                                         |
| `Get-RATeam`                       | Get Vendor Manager teams                               |
| `New-RATeam`                       | Create a Vendor Manager team                           |
| `Remove-RATeam`                    | Delete a Vendor Manager team                           |
| `Get-RATeamMember`                 | Get Vendor Manager team members                        |
| `Add-RATeamMember`                 | Add a member to a Vendor Manager team                  |
| `Remove-RATeamMember`              | Remove a member from a Vendor Manager team             |
| `Get-RASelfServiceRequest`         | Get self-service invitation requests                   |
| `Approve-RASelfServiceRequest`     | Approve a self-service invitation request              |
| `Deny-RASelfServiceRequest`        | Reject a self-service invitation request               |
| `New-RAVendorInvitation`           | Create a vendor invitation                             |
| `New-RAUserInvitation`             | Create a user invitation                               |
| `Get-RAVendorInvitation`           | Get vendor invitations                                 |
| `Remove-RAVendorInvitation`        | Delete a vendor invitation                              |
| `Get-RASite`                       | Get sites                                              |
| `Get-RAApplication`                | Get a site's applications                              |
| `Get-RAConnector`                  | Get a site's connectors                                |
| `Get-RAActivity`                   | Get activities                                         |

## Installation

### Prerequisites

- Requires Powershell Core (recommended), or Windows PowerShell (version 5.1)
- A CyberArk Remote Access tenant
- A Remote Access service account (Client ID/Secret, or a service account JSON file) - see [Authentication](#authentication) above

### Install Options

Users can install IdentityCommand.RemoteAccess from GitHub or the PowerShell Gallery.

#### PowerShell Gallery

```powershell
Install-Module -Name IdentityCommand.RemoteAccess
```

#### GitHub

Download the latest release from the [Releases](https://github.com/pspete/IdentityCommand.RemoteAccess/releases) page and extract it to a folder in your PowerShell module path.

## Contributing

See the [Contribution Guidelines](CONTRIBUTING.md) for further details.

## License

Copyright (c) Pete Maan 2026. Licensed under the MIT License.

See [LICENSE.md](LICENSE.md).
