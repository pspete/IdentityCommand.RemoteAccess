# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RATeamMember {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$teamId,

        #The unique ID of the user to remove.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams/$([uri]::EscapeDataString($teamId))/members/$([uri]::EscapeDataString($userId))"

        if ($PSCmdlet.ShouldProcess($teamId, "Remove member '$userId'")) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
