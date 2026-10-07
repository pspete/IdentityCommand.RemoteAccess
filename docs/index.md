---
title: IdentityCommand.RemoteAccess
subtitle: PowerShell for Idira Remote Access
hide_hero: true
---

<div class="has-text-centered mb-6">
  <img src="{{ '/RemoteAccess/media/images/IdentityCommand.RemoteAccess.png' | relative_url }}" alt="IdentityCommand.RemoteAccess" width="471">
</div>

**IdentityCommand.RemoteAccess** is a PowerShell module that provides a set of easy-to-use commands, allowing you to interact with the **Idira Remote Access API** from within the PowerShell environment.

It builds on [IdentityCommand]({{ '/' | relative_url }}) for its shared plumbing - see [Getting Started]({{ '/RemoteAccess/getting-started/' | relative_url }}) to install and connect, and the [command reference]({{ '/RemoteAccess/commands/' | relative_url }}) for every command.

## Vendors

```powershell
Get-RAVendor
Get-RAVendor -vendorId v123
Set-RAVendor -vendorId v123 -comments 'Renewed for Q3'
Set-RAVendorStatus -vendorId v123 -status Activated
Remove-RAVendor -vendorId v123
```

## Users and Vendor Manager Teams

```powershell
Get-RAUser
Set-RAUserRole -userId u123 -role VendorManager
Get-RAUserTeam -userId u123
Add-RAUserToTeam -userId u123 -teamId t456
Grant-RAVendorManagerPermission -userId u123 -accessPeriodStartDate (Get-Date) -accessPeriodEndDate (Get-Date).AddMonths(6) -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true
```

## Groups

```powershell
Get-RAGroup
New-RAGroup -name 'contractors' -description 'External contractor VendorLDAP group'
Set-RAGroup -groupId g123 -description 'Updated description'
Remove-RAGroup -groupId g123
```

## Vendor Manager Teams

```powershell
Get-RATeam
New-RATeam -name 'EMEA Vendor Managers' -accessPeriodStartDate (Get-Date) -accessPeriodEndDate (Get-Date).AddYears(1) -accountActivation AUTOMATIC -userProvisioning None -canInviteToWebApps $true -canDelegatePermissionsToExternalVendorManagers $true -canCreateGroups $true -canInviteToAllGroups $true -canInviteToAllApps $true
Get-RATeamMember -teamId t456
Add-RATeamMember -teamId t456 -userId u123
Remove-RATeamMember -teamId t456 -userId u123
Remove-RATeam -teamId t456
```

## Self-Service Requests

```powershell
Get-RASelfServiceRequest
Approve-RASelfServiceRequest -id r789 -initialStatus Activated -accessStartDate (Get-Date) -accessEndDate (Get-Date).AddMonths(3) -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' })
Deny-RASelfServiceRequest -id r789
```

## Invitations

```powershell
New-RAVendorInvitation -companyName Acme -emailAddress vendor@acme.com -firstName Jane -lastName Doe -phoneNumber '+15551234567' -initialStatus Activated -accessStartDate (Get-Date) -accessEndDate (Get-Date).AddMonths(3) -canInvite $true -applications @(@{ siteId = 's1'; applicationId = 'a1' })
New-RAUserInvitation -usersToInvite @(@{ name = 'John Smith'; emailAddress = 'john@acme.com' }) -invitationExpirationTime (Get-Date).AddDays(7)
Get-RAVendorInvitation
Remove-RAVendorInvitation -invitationId i123
```

## Sites, Applications and Connectors

```powershell
Get-RASite
Get-RAApplication -siteId s1
Get-RAConnector -siteId s1
```

## Activities

```powershell
Get-RAActivity -activityTypes SiteCreated, ApplicationCreated -fromTime (Get-Date).AddDays(-7)
```
