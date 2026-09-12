---
external help file: IdentityCommand.RemoteAccess-help.xml
Module Name: IdentityCommand.RemoteAccess
online version:
schema: 2.0.0
---

# New-RAVendorInvitation

## SYNOPSIS
Creates a vendor invitation

## SYNTAX

```
New-RAVendorInvitation [-accessStartDate] <DateTime> [-initialStatus] <String> [-accessEndDate] <DateTime> [-applications] <Object[]> [-canInvite] <Boolean> [-emailAddress] <String> [-companyName] <String> [-firstName] <String> [-phoneNumber] <String> [-lastName] <String> [-WarningAction <ActionPreference>] [-InformationAction <ActionPreference>] [-ErrorAction <ActionPreference>] [-Verbose] [-Debug] [-ErrorVariable <String>] [-OutBuffer <Int32>] [-PipelineVariable <String>] [-OutVariable <String>] [-WarningVariable <String>] [-InformationVariable <String>] [-provisioningUsername <String>] [-provisioningGroups <String[]>] [-provisioningType <String>] [-accessTimeDetails <Object>] [-comments <String>] [-idaptiveRoles <String[]>] [-invitedVendorsInitialStatus <String>] [-enableWebAppsAccess <Boolean>] [-phoneAndEmailAuth <Boolean>] [-customText <String>] [-maxNumOfInvitedVendors <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates a vendor invitation.

## EXAMPLES

### Example 1
```
New-RAVendorInvitation
```

Creates a vendor invitation

## PARAMETERS

### -companyName
The name of the company that the user represents as a Remote Access user.

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

### -emailAddress
The user's email address in the company they represent.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -firstName
The vendor's first name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -lastName
The vendor's last name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -phoneNumber
The phone number that the vendor set when they registered for Remote Access, in international format.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
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

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -accessStartDate
The date when the vendor's access to Remote Access begins.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: True
Position: 6
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

Required: True
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -canInvite
Indicates whether the vendor can invite other vendors.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: True
Position: 8
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

Required: True
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -accessTimeDetails
Time-based access restrictions, as an object with timeZone/allowedDays/allDay/workingHoursStartSeconds/workingHoursEndSeconds properties.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 10
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
Position: 11
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
Position: 12
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
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -provisioningGroups
The groups that the vendor is added to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 14
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
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -customText
The name of a predefined invitation template added to the invitation.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -maxNumOfInvitedVendors
The number of subvendors that the vendor can invite. 0 for unlimited.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -phoneAndEmailAuth
Indicates whether the vendor authenticates with an SMS code or phone call plus an emailed token, instead of scanning a QR code.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: False
Position: 18
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
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -enableWebAppsAccess
Indicates whether the vendor can access web applications.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: False
Position: 20
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
