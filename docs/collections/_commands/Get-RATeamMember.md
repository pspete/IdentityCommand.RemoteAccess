---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RATeamMember

## SYNOPSIS
Gets Vendor Manager team members

## SYNTAX

```
Get-RATeamMember [-teamId] <String> [-ErrorVariable <String>] [-WarningVariable <String>] [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-InformationVariable <String>] [-OutVariable <String>] [-limit <Int32>] [-sortBy <String>] [-searchString <String>] [-offset <Int32>] [-Debug] [-ErrorAction <ActionPreference>] [-sortDirection <String>] [-Verbose] [<CommonParameters>]
```

## DESCRIPTION
Retrieves membership information for the specified Vendor Manager team.

## EXAMPLES

### Example 1
```
Get-RATeamMember
```

Gets Vendor Manager team members

## PARAMETERS

### -teamId
The unique ID of the team.

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

### -searchString
The string to use in the search.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -offset
The number of entries to skip.

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

### -limit
The maximum number of entries to return.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sortBy
Field to sort by.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sortDirection
Sort direction.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
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
