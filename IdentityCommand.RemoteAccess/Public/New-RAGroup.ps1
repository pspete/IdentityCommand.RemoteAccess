# .ExternalHelp IdentityCommand.RemoteAccess-help.xml
function New-RAGroup {

    [CmdletBinding(SupportsShouldProcess)]
    param(

        #The name of the VendorLDAP group to be added as a member to PAM Safes.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [String]$name,

        #The description of the VendorLDAP group.
        [parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [String]$description

    )

    begin { }#begin

    process {

        $URI = "$($ISPSSSession.tenant_url)/v2-edge/groups"

        $Body = [ordered]@{ name = $name }
        if ($PSBoundParameters.ContainsKey('description')) { $Body.description = $description }

        if ($PSCmdlet.ShouldProcess($name, 'Create group')) {

            Invoke-IDRestMethod -Uri $URI -Method POST -Body ($Body | ConvertTo-Json -Depth 8)

        }

    }#process

    end { }#end

}
