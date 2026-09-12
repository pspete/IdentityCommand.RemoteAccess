---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# New-RAUserInvitation

## SYNOPSIS
Creates a user invitation

## SYNTAX

```
New-RAUserInvitation [-invitationExpirationTime] <DateTime> [-usersToInvite] <Object[]> [-InformationVariable <String>] [-WarningVariable <String>] [-ErrorVariable <String>] [-PipelineVariable <String>] [-OutBuffer <Int32>] [-OutVariable <String>] [-Debug] [-Verbose] [-initialStatus <String>] [-InformationAction <ActionPreference>] [-WarningAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates a user invitation for one or more users.

## EXAMPLES

### Example 1
```
New-RAUserInvitation
```

Creates a user invitation

## PARAMETERS

### -usersToInvite
The users to invite, as objects with name/emailAddress properties.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -invitationExpirationTime
The date and time when the invitation expires. After this time, invited users can no longer accept it.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -initialStatus
Indicates whether the account is activated automatically or manually by the administrator after registration.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
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
