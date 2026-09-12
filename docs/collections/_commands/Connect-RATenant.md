---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Connect-RATenant

## SYNOPSIS
Connects to a Remote Access tenant

## SYNTAX

### ClientCredentials (Default)
```
Connect-RATenant [-ClientSecret] <SecureString> [-ClientID] <String> [-Datacenter] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ServiceAccountFile
```
Connect-RATenant [-Path] <FileInfo> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Authenticates a Remote Access service account using the OAuth2 client-credentials flow against the tenant's datacenter (auth.<datacenter>) and sets the resulting Bearer access token for use by every IdentityCommand.RemoteAccess command. Unlike every other companion module, Remote Access does not authenticate via CyberArk Identity - provide either -Datacenter/-ClientID/-ClientSecret directly, or a service account JSON file via -Path.

## EXAMPLES

### Example 1
```
Connect-RATenant
```

Connects to a Remote Access tenant

## PARAMETERS

### -Datacenter
The Remote Access datacenter hosting the tenant (alero.io, alero.eu, ca.alero.io, etc).

```yaml
Type: String
Parameter Sets: ClientCredentials
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ClientID
The service account Client ID.

```yaml
Type: String
Parameter Sets: ClientCredentials
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ClientSecret
The service account Client Secret.

```yaml
Type: SecureString
Parameter Sets: ClientCredentials
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to a Remote Access service account JSON file (ClientID, ClientSecret, discoveryURI).

```yaml
Type: FileInfo
Parameter Sets: ServiceAccountFile
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
