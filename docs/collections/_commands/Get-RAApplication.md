---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAApplication

## SYNOPSIS
Gets a site's applications

## SYNTAX

```
Get-RAApplication [-siteId] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-ErrorVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-OutVariable <String>] [-InformationAction <ActionPreference>] [-Verbose] [-limit <Int32>] [-offset <Int32>] [-WarningAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-Debug] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of applications for the specified site.

## EXAMPLES

### Example 1
```
Get-RAApplication
```

Gets a site's applications

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

### -offset
The number of entries to skip.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -limit
The maximum number of entries to return.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
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
