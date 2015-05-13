function Set-MicrosoftUpdate
{
    <#
        .SYNOPSIS 
        Controls Microsoft Update settings

        .PARAMETER Enabled
        Enable or disable Microsoft Update

        .INPUTS
        None

        .OUTPUTS
        None

        .EXAMPLE
        C:\PS> Set-MicrosoftUpdate -Enabled $true
    #>

    param([bool]$Enabled)

    $ServiceManager = New-Object -ComObject Microsoft.Update.ServiceManager
    $ServiceManager.ClientApplicationID = 'Set-MicrosoftUpdate'

    if ($Enabled)
    {
        # Add the Microsoft Update service GUID 
        $ServiceManager.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
    }
    else
    {
        # Remove the Microsoft Update service GUID 
        $ServiceManager.RemoveService("7971f918-a847-4430-9279-4a52d1efe18d")
    }
}