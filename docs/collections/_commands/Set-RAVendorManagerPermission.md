---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Set-RAVendorManagerPermission

## SYNOPSIS
Updates internal vendor manager permissions

## SYNTAX

```
Set-RAVendorManagerPermission [-canDelegatePermissionsToExternalVendorManagers] [-canInviteToWebApps] [-canCreateGroups] [-canInviteToAllApps] [-canInviteToAllGroups] [-accessPeriodStartDate] <DateTime> [-userId] <String> [-accessPeriodEndDate] <DateTime> [-userProvisioning] <String> [-accountActivation] <String> [-ErrorVariable <String>] [-WarningVariable <String>] [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-InformationVariable <String>] [-OutVariable <String>] [-ErrorAction <ActionPreference>] [-userGroups <String[]>] [-idaptiveRoles <String[]>] [-allowedApps <Object[]>] [-maxInvitedVendors <Int32>] [-Verbose] [-Debug] [-provisioningUsername <String>] [-allowedEmailDomains <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates vendor manager permissions for a user.

## EXAMPLES

### Example 1
```
Set-RAVendorManagerPermission
```

Updates internal vendor manager permissions

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

### -accessPeriodStartDate
The date when the vendor's access to Remote Access begins.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -accessPeriodEndDate
The date when the vendor's access to Remote Access ends.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -accountActivation
The account activation type.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -userProvisioning
A Vault user must be created to represent invited vendors in the Idira PAM environment.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canInviteToWebApps
Indicates whether the vendor manager can invite vendors to web applications.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canDelegatePermissionsToExternalVendorManagers
Indicates whether the vendor manager can delegate permissions to other external vendor managers.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canCreateGroups
Indicates whether the vendor manager can create groups.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canInviteToAllGroups
Indicates whether the vendor manager can invite vendors to all groups.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canInviteToAllApps
Indicates whether the vendor manager can invite vendors to all applications.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -allowedApps
The applications that the vendor can access through Remote Access, as objects with id/siteId properties.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -maxInvitedVendors
The number of vendors that the vendor manager can invite. 0 for unlimited.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -userGroups
The groups that invited vendors should belong to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -idaptiveRoles
The identity roles that the vendor/invitee is added to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -provisioningUsername
The Vault user in the Idira PAM environment to be created for the vendor.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -allowedEmailDomains
Allowed email domains for invited vendors.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 10
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
