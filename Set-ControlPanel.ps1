function Set-ControlPanel
{
    param
    (
        [Parameter(Mandatory=$false)]
        [ValidateSet("Category", "SmallIcon", "LargeIcon")]
        [string]$ViewMode
    )

    $RegKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel'

    switch ($ViewMode)
    {
        "Category"
        {
            # Set the startup page to 'category' view (as opposed to 'icon' view)
            Set-ItemProperty $RegKey -Name StartupPage -Value 0 -Type DWord
        }

        "SmallIcon"
        {
            # Set the startup page to 'icon' view (as opposed to 'category' view)
            Set-ItemProperty $RegKey -Name StartupPage -Value 1 -Type DWord
            # Set the mode of the icon view to small icons
            Set-ItemProperty $RegKey -Name AllItemsIconView -Value 1 -Type DWord
        }

        "LargeIcon"
        {
            # Set the startup page to 'icon' view (as opposed to 'category' view)
            Set-ItemProperty $RegKey -Name StartupPage -Value 1 -Type DWord
            # Set the mode of the icon view to large icons
            Set-ItemProperty $RegKey -Name AllItemsIconView -Value 0 -Type DWord
        }
    }
}