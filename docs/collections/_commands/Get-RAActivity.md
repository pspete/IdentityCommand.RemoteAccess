---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAActivity

## SYNOPSIS
Gets Remote Access activities

## SYNTAX

```
Get-RAActivity [-activityTypes] <String[]> [-WarningVariable <String>] [-ErrorVariable <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-OutVariable <String>] [-WarningAction <ActionPreference>] [-offset <Int32>] [-toTime <DateTime>] [-fromTime <DateTime>] [-limit <Int32>] [-ErrorAction <ActionPreference>] [-Debug] [-Verbose] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of activities that occurred within the specified time period, filtered by activity type.

## EXAMPLES

### Example 1
```
Get-RAActivity
```

Gets Remote Access activities

## PARAMETERS

### -activityTypes
The list of activity types to retrieve.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fromTime
The start of the time range filter.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -toTime
The end of the time range filter.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
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
Position: 3
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
Position: 4
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
