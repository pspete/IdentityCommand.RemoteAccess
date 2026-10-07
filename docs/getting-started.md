---
title: Getting Started
subtitle: Install IdentityCommand.RemoteAccess and connect to Remote Access
---

## Prerequisites

- Requires Powershell Core (recommended), or Windows PowerShell (version 5.1)
- An Idira Remote Access tenant
- A Remote Access service account (Client ID/Secret, or a service account JSON file) - see [Authentication](#authentication) below
- The `IdentityCommand` module.

## Install Options

Install from the PowerShell Gallery:

```powershell
Install-Module -Name IdentityCommand.RemoteAccess -Scope CurrentUser
```

Or download the [latest release](https://github.com/pspete/IdentityCommand.RemoteAccess/releases), unblock and extract the archive, and copy the `IdentityCommand.RemoteAccess` folder into a path listed in `$env:PSModulePath`.

## Authentication

`IdentityCommand.RemoteAccess` is a companion to (and hard dependency on) the `IdentityCommand` module, which provides the shared HTTP/helper plumbing every command uses - but not authentication itself. The `IdentityCommand` module must be installed and available in order to use `IdentityCommand.RemoteAccess`.

Unlike every other companion module, Remote Access does not authenticate via Idira Identity at all - it uses its own OAuth2 client-credentials flow, scoped to the datacenter that hosts the tenant (`alero.io`, `alero.eu`, `ca.alero.io`, etc), with a Remote Access service account.

```powershell
$Secret = Read-Host -AsSecureString -Prompt 'Client Secret'
Connect-RATenant -Datacenter 'alero.io' -ClientID '<tenant>.<client>' -ClientSecret $Secret
```

Or, from a downloaded service account JSON file:

```powershell
Connect-RATenant -Path .\service-account.json
```

`Connect-RATenant` exchanges the service account for a Bearer access token via `auth.<datacenter>`, and sets the tenant url to `api.<datacenter>` for every subsequent command.
