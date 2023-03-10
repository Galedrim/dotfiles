# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$ENV:STARSHIP_CONFIG = "$HOME\.config\powershell\pastel-powerline.toml"
Invoke-Expression (& starship init powershell)

Import-Module -Name Terminal-Icons
Import-Module devtoolbox

# PSReadLine\
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function update {
  iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
}

function profilePS1 {
  code "$HOME\.config\powershell\user_profile.ps1"
}

function starshipTOML {
  code "$HOME\.config\powershell\pastel-powerline.toml"
}