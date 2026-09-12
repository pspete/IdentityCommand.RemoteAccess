# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Add-RAUserToTeam {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the user. Will become a vendor manager when added to the team.
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

        if ($PSCmdlet.ShouldProcess($userId, "Add to team '$teamId' as vendor manager")) {

            Invoke-IDRestMethod -Uri $URI -Method POST

        }

    }#process

    end { }#end

}
