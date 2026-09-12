# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Add-RATeamMember {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$teamId,

        #The unique ID of the user to add to the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams/$([uri]::EscapeDataString($teamId))/members"

        $Body = $PSBoundParameters | Get-Parameter -ParametersToRemove teamId

        if ($PSCmdlet.ShouldProcess($teamId, "Add member '$userId'")) {

            Invoke-IDRestMethod -Uri $URI -Method POST -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
