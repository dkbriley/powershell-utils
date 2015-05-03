function Test-RunningAsAdministrator
{
    $Principal = New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent())

    $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

