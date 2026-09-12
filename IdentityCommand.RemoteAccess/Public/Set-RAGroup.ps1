# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function Set-RAGroup {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The unique ID of the VendorLDAP group.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$groupId,

        #The description of the VendorLDAP group.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$description

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/groups/$([uri]::EscapeDataString($groupId))"

        if ($PSCmdlet.ShouldProcess($groupId, 'Update group')) {

            Invoke-IDRestMethod -Uri $URI -Method PUT -Body ($description | ConvertTo-Json)

        }

    }#process

    end { }#end

}
