---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RASelfServiceRequest

## SYNOPSIS
Gets self-service invitation requests

## SYNTAX

```
Get-RASelfServiceRequest [-ErrorVariable <String>] [-WarningVariable <String>] [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-InformationVariable <String>] [-OutVariable <String>] [-ErrorAction <ActionPreference>] [-fromTime <DateTime>] [-toTime <DateTime>] [-searchString <String>] [-searchIn <String>] [-Verbose] [-Debug] [-offset <Int32>] [-limit <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of pending self-service invitation requests.

## EXAMPLES

### Example 1
```
Get-RASelfServiceRequest
```

Gets self-service invitation requests

## PARAMETERS

### -searchString
The string to use in the search.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -searchIn
The field in which to perform the search.

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

### -fromTime
The start of the time range filter.

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

### -toTime
The end of the time range filter.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
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
Position: 4
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
