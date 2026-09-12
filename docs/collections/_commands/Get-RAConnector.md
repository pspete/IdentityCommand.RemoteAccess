---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAConnector

## SYNOPSIS
Gets a site's connectors

## SYNTAX

```
Get-RAConnector [-siteId] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of tenant connectors for the specified site.

## EXAMPLES

### Example 1
```
Get-RAConnector
```

Gets a site's connectors

## PARAMETERS

### -siteId
The unique ID of the site.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
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
