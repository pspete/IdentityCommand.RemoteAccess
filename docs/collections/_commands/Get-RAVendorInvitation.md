---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Get-RAVendorInvitation

## SYNOPSIS
Gets vendor invitations

## SYNTAX

### List (Default)
```
Get-RAVendorInvitation [-ErrorVariable <String>] [-WarningVariable <String>] [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-InformationVariable <String>] [-OutVariable <String>] [-searchIn <String>] [-offset <Int32>] [-createdBy <String>] [-searchString <String>] [-Debug] [-ErrorAction <ActionPreference>] [-limit <Int32>] [-Verbose] [<CommonParameters>]
```

### ById
```
Get-RAVendorInvitation [-invitationId] <String> [-InformationVariable <String>] [-WarningVariable <String>] [-OutVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-ErrorVariable <String>] [-Debug] [-Verbose] [-ErrorAction <ActionPreference>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of vendor invitations, or a specific vendor invitation by ID.

## EXAMPLES

### Example 1
```
Get-RAVendorInvitation
```

Gets vendor invitations

## PARAMETERS

### -invitationId
The unique ID of the vendor invitation.

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

### -createdBy
The ID of the Remote Access user who created the invitation.

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

### -searchString
The string to use in the search.

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

### -searchIn
The field in which to perform the search.

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
