---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# Set-RAVendor

## SYNOPSIS
Updates a Remote Access vendor

## SYNTAX

### ById
```
Set-RAVendor [-vendorId] <String> [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-Verbose] [-Debug] [-ErrorVariable <String>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-OutVariable <String>] [-WarningVariable <String>] [-InformationVariable <String>] [-pvwaApplications] [-invitedVendorsInitialStatus <String>] [-maxNumInvitedVendors <Int32>] [-canInvite] [-accessStartDate <DateTime>] [-accessEndDate <DateTime>] [-provisioningType <String>] [-comments <String>] [-applications <Object[]>] [-idaptiveRoles <String[]>] [-username <String>] [-groups <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByPhone
```
Set-RAVendor [-phoneNumber] <String> [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-Verbose] [-Debug] [-ErrorVariable <String>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-OutVariable <String>] [-WarningVariable <String>] [-InformationVariable <String>] [-pvwaApplications] [-invitedVendorsInitialStatus <String>] [-maxNumInvitedVendors <Int32>] [-canInvite] [-accessStartDate <DateTime>] [-accessEndDate <DateTime>] [-provisioningType <String>] [-comments <String>] [-applications <Object[]>] [-idaptiveRoles <String[]>] [-username <String>] [-groups <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates the properties of the specified vendor, identified by ID or phone number.

## EXAMPLES

### Example 1
```
Set-RAVendor
```

Updates a Remote Access vendor

## PARAMETERS

### -vendorId
The unique ID of the vendor.

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

### -phoneNumber
The phone number that the vendor set when they registered for Remote Access, in international format.

```yaml
Type: String
Parameter Sets: ByPhone
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -accessStartDate
The date when the vendor's access to Remote Access begins.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -accessEndDate
The date when the vendor's access to Remote Access ends.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canInvite
Indicates whether the vendor can invite other vendors.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -invitedVendorsInitialStatus
Indicates whether additional vendors invited by the vendor are activated automatically or manually.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -maxNumInvitedVendors
The number of subvendors that the vendor can invite.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -provisioningType
The provisioning type of the invitee.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -username
The Vault user in the Idira PAM environment for the vendor.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -groups
The groups that the vendor belongs to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -comments
Comments about the vendor, including the purpose of the invitation.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -applications
The applications and sites, as objects with siteId/applicationId properties.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -pvwaApplications
Indicates whether the vendor can access web applications.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
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
