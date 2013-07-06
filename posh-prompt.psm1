if (Get-Module posh-prompt) { return }

Push-Location $psScriptRoot
.\CheckVersion.ps1 > $null

. ./Settings.ps1
. ./Utils.ps1
. ./git/GitUtils.ps1
. ./git/GitPrompt.ps1
. ./git/GitTabExpansion.ps1
. ./git/TortoiseGit.ps1
. ./hg/HgUtils.ps1
. ./hg/HgPrompt.ps1
. ./hg/HgTabExpansion.ps1
Pop-Location

if (!$Env:HOME) { $Env:HOME = "$Env:HOMEDRIVE$Env:HOMEPATH" }
if (!$Env:HOME) { $Env:HOME = "$Env:USERPROFILE" }

Get-TempEnv 'SSH_AGENT_PID'
Get-TempEnv 'SSH_AUTH_SOCK'

Export-ModuleMember `
    -Alias @(
        '??') `
    -Function @(
        'Invoke-NullCoalescing',
        'Write-GitStatus',
        'Write-Prompt',
        'Get-GitStatus', 
        'Enable-GitColors', 
        'Get-GitDirectory',
        'TabExpansion',
        'Get-AliasPattern',
        'Get-SshAgent',
        'Start-SshAgent',
        'Stop-SshAgent',
        'Add-SshKey',
        'Get-SshPath',
        'Update-AllBranches',
        'tgit',
        'Get-TortoiseGitPath',
        'Write-HgStatus',
        'Get-HgStatus',
        'HgTabExpansion',
        'Get-MqPatches',
        'PopulateHgCommands',
        'IsHgOrGitDirectory')