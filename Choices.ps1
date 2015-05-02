
function Read-Choice
{
    param
    (
        [string]$Title, 
        [string]$Message,
        [System.Management.Automation.Host.ChoiceDescription[]]$Choices,
        [int]$DefaultChoice = 0
    )

    $Host.UI.PromptForChoice($Title, $Message, $Choices, $DefaultChoice)
}

function Read-ChoiceYesNo
{
    param
    (
        [string]$Title, 
        [string]$Message, 
        [string]$YesDesc, 
        [string]$NoDesc,
        [bool]$DefaultChoice = $true
    )

    $Choices = [System.Management.Automation.Host.ChoiceDescription[]](
        (New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", $YesDesc),
        (New-Object System.Management.Automation.Host.ChoiceDescription "&No", $NoDesc))

    switch (Read-Choice -Title $Title -Message $Message -Choices $Choices -DefaultChoice $DefaultChoice?0:1)
    {
        0 { $true }
        1 { $false }
    }
}