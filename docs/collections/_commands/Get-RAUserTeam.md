---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAUserTeam

## SYNOPSIS
Gets a user's Vendor Manager teams

## SYNTAX

```
Get-RAUserTeam [-userId] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves all Vendor Manager teams that the specified user belongs to.

## EXAMPLES

### Example 1
```
Get-RAUserTeam
```

Gets a user's Vendor Manager teams

## PARAMETERS

### -userId
The unique ID of the user.

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
