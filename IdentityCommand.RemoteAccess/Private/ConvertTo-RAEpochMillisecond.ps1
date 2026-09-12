function ConvertTo-RAEpochMillisecond {
    <#
    .SYNOPSIS
    Converts a [datetime] to milliseconds since the Unix epoch.

    .DESCRIPTION
    Every Remote Access timestamp (accessStartDate, fromTime, invitationExpirationTime, etc) is
    documented as an int64 count of milliseconds since Epoch, not an ISO 8601 string. Commands accept
    a native [datetime] parameter and convert it to this shape at the API boundary via this helper.

    .PARAMETER DateTime
    The date/time to convert.

    .EXAMPLE
    ConvertTo-RAEpochMillisecond -DateTime (Get-Date)
    #>
    [CmdletBinding()]
    [OutputType([long])]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [datetime]$DateTime
    )

    process {

        [long][System.DateTimeOffset]::new($DateTime.ToUniversalTime()).ToUnixTimeMilliseconds()

    }

}
