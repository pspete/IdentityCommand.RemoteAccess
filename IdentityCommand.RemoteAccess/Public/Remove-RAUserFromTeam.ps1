# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RAUserFromTeam {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$userId,

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$teamId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/users/$([uri]::EscapeDataString($userId))/teams/$([uri]::EscapeDataString($teamId))"

        if ($PSCmdlet.ShouldProcess($userId, "Remove vendor manager from team '$teamId'")) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
