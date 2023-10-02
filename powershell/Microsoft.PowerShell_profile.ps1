$(/opt/homebrew/bin/brew shellenv) | Invoke-Expression

oh-my-posh init pwsh --config '~/.config/oh-my-posh/catppuccin_mocha.omp.json' | Invoke-Expression

New-Alias -Name powershell -Value pwsh
New-Alias -Name vim -Value nvim
New-Alias -Name g -Value git

function ll()
{
    ls -l
}

function lla()
{
    ll -a
}
