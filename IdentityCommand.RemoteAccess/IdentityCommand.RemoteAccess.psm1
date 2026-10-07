#region Loader
<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE

.INPUTS

.OUTPUTS
#>
[CmdletBinding()]
param(

    [bool]$DotSourceModule = $false

)

#Get function files
Get-ChildItem $PSScriptRoot\ -Recurse -Include '*.ps1' -Exclude '*.ps1xml' |

    ForEach-Object {

        if ($DotSourceModule) {
            . $_.FullName
        } else {
            $ExecutionContext.InvokeCommand.InvokeScript(
                $false,
                (
                    [scriptblock]::Create(
                        [io.file]::ReadAllText(
                            $_.FullName,
                            [Text.Encoding]::UTF8
                        )
                    )
                ),
                $null,
                $null
            )

        }

    }

#endregion Loader

#Copy IdentityCommand's private helpers into this module: this module's functions call them, and
#the argument completer registrations below do so at import time.
#Each copy is created from the function definition, so it runs in this module's scope and uses this
#module's $ISPSSSession, whether IdentityCommand loaded from source or from its combined psm1.
#Resolve a single IdentityCommand module: with more than one version loaded, Get-Module returns
#an array.
$Module = Get-Module -Name IdentityCommand | Sort-Object Version -Descending | Select-Object -First 1

if ($null -eq $Module) {
    throw 'The IdentityCommand module is not loaded. Import IdentityCommand and try again.'
}

& $Module { Get-ChildItem -Path Function: } |

    Where-Object { $_.ModuleName -eq $Module.Name -and -not $Module.ExportedFunctions.ContainsKey($_.Name) } |

    ForEach-Object {

        . ([scriptblock]::Create("function $($_.Name) {$($_.Definition)}"))

    }

#region Registration

Register-ArgumentCompleter -ParameterName 'vendorId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAVendor' -ValueProperty 'id' -LabelProperty 'fullName'
) -CommandName @(
    'Get-RAVendor'
    'Set-RAVendor'
    'Remove-RAVendor'
    'Set-RAVendorStatus'
)

Register-ArgumentCompleter -ParameterName 'userId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAUser' -ValueProperty 'id' -LabelProperty 'username'
) -CommandName @(
    'Get-RAUser'
    'Remove-RAUser'
    'Set-RAUserStatus'
    'Set-RAUserRole'
    'Get-RAUserTeam'
    'Add-RAUserToTeam'
    'Remove-RAUserFromTeam'
    'Set-RAVendorManagerPermission'
    'Grant-RAVendorManagerPermission'
    'Add-RATeamMember'
    'Remove-RATeamMember'
)

Register-ArgumentCompleter -ParameterName 'groupId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAGroup' -ValueProperty 'id' -LabelProperty 'name'
) -CommandName @(
    'Get-RAGroup'
    'Set-RAGroup'
    'Remove-RAGroup'
)

Register-ArgumentCompleter -ParameterName 'teamId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RATeam' -ValueProperty 'id' -LabelProperty 'name'
) -CommandName @(
    'Get-RATeam'
    'Remove-RATeam'
    'Get-RATeamMember'
    'Add-RATeamMember'
    'Remove-RATeamMember'
    'Add-RAUserToTeam'
    'Remove-RAUserFromTeam'
)

Register-ArgumentCompleter -ParameterName 'siteId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RASite' -ValueProperty 'id' -LabelProperty 'displayName'
) -CommandName @(
    'Get-RAApplication'
    'Get-RAConnector'
)

Register-ArgumentCompleter -ParameterName 'invitationId' -ScriptBlock (
    Get-ArgumentCompleter -RetrievalCommand 'Get-RAVendorInvitation' -ValueProperty 'invitationId' -LabelProperty 'fullName'
) -CommandName @(
    'Get-RAVendorInvitation'
    'Remove-RAVendorInvitation'
)

#endregion

# Script scope session object for session data
$ISPSSSession = [ordered]@{
    tenant_url         = $null
    User               = $null
    TenantId           = $null
    SessionId          = $null
    WebSession         = $null
    StartTime          = $null
    ElapsedTime        = $null
    LastCommand        = $null
    LastCommandTime    = $null
    LastCommandResults = $null
    LastError          = $null
    LastErrorTime      = $null
} | Add-CustomType -Type IdCmd.Session

New-Variable -Name ISPSSSession -Value $ISPSSSession -Scope Script -Force