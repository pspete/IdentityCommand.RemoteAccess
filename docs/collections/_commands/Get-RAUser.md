---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAUser

## SYNOPSIS
Gets Remote Access users

## SYNTAX

### List (Default)
```
Get-RAUser [-WarningVariable <String>] [-ErrorVariable <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-OutVariable <String>] [-limit <Int32>] [-offset <Int32>] [-name <String>] [-Verbose] [-WarningAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-Debug] [<CommonParameters>]
```

### ById
```
Get-RAUser [-userId] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of users according to a query, or a specific user by ID.

## EXAMPLES

### Example 1
```
Get-RAUser
```

Gets Remote Access users

## PARAMETERS

### -userId
The unique ID of the user.

```yaml
Type: String
Parameter Sets: ById
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -name
The name of the resource.

```yaml
Type: String
Parameter Sets: List
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -offset
The number of entries to skip.

```yaml
Type: Int32
Parameter Sets: List
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -limit
The maximum number of entries to return.

```yaml
Type: Int32
Parameter Sets: List
Aliases: 

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
