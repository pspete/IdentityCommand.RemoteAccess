# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Remove-RATeam {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the team.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$teamId

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/teams/$([uri]::EscapeDataString($teamId))"

        if ($PSCmdlet.ShouldProcess($teamId, 'Delete team')) {

            Invoke-IDRestMethod -Uri $URI -Method DELETE

        }

    }#process

    end { }#end

}
