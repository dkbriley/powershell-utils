
function Connect-ExchangeOnline
{
    $Credentials = Get-Credential -Message 'Enter your Exchange Online credentials'

    $Session = New-PSSession -ConfigurationName Microsoft.Exchange `
        -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
        -Credential $Credentials -Authentication Basic -AllowRedirection

    Import-PSSession $Session
}