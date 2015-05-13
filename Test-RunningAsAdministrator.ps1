function Test-RunningAsAdministrator
{
    <#
        .SYNOPSIS 
        Determines whether the script is running with Administrator privileges

        .INPUTS
        None

        .OUTPUTS
        System.Boolean Returns a boolean value indicating whether the script is
        running with Administrator privileges.

        .EXAMPLE
        C:\PS> $IsAdmin = Test-RunningAsAdministrator
    #>

    $Principal = New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent())

    $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}