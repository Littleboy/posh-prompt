Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-prompt module from current directory
Import-Module .\posh-prompt

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-prompt


# Set up a simple prompt, adding the hg/git prompt parts inside hg/git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    $s = $global:PoshPromptSettings
    
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $s.DefaultForegroundColor
    
    # Show location
    if ($s.ShowUserLocationAsPrompt) {
        $path = ""
        $pathbits = ([string]$pwd).split("\", [System.StringSplitOptions]::RemoveEmptyEntries)
        if($pathbits.length -eq 1) {
            $path = $pathbits[0] + "\"
        } else {
            $path = $pathbits[$pathbits.length - 1]
        }
        
        $userLocation = '@ ' + $path
        
        if ($s.ShowUserLocationAsTitle) {
            $Host.UI.RawUi.WindowTitle = $userLocation
        }
        
        Write-Host($userLocation) -nonewline -foregroundcolor Green
    } else {
        Write-Host($pwd) -nonewline
    }
    
    # Check current folder type
    #  0: Not a repository
    #  1: Git repository
    #  2: Mercurial repository
    $folderType = IsHgOrGitDirectory

    switch ($folderType) {
    default {}
    
    # Git prompt
    1 {
        Write-VcsStatus
        Enable-GitColors
        Pop-Location
        #Start-SshAgent -Quiet
      }
    
    # Mercurial Prompt
    2 {
        $Global:HgStatus = Get-HgStatus
        Write-HgStatus $HgStatus
      }
    }

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

$PowerTab_RegisterTabExpansion = Get-Command Register-TabExpansion -Module powertab -ErrorAction SilentlyContinue
if ($PowerTab_RegisterTabExpansion)
{
    & $PowerTab_RegisterTabExpansion "git.exe" -Type Command {
        param($Context, [ref]$TabExpansionHasOutput, [ref]$QuoteSpaces)  # 1:

        $line = $Context.Line
        $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
        $TabExpansionHasOutput.Value = $true
        GitTabExpansion $lastBlock
    }
    return
}

if (Test-Path Function:\TabExpansion) {
    Rename-Item Function:\TabExpansion TabExpansionBackup
}

function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()

    switch -regex ($lastBlock) {
        # Execute Mercurial and TortoiseHG tab expansion
        '(hg|thg) (.*)' { HgTabExpansion($lastBlock) }
            
        # Execute git tab completion for all git-related commands
        "^$(Get-AliasPattern git) (.*)" { GitTabExpansion $lastBlock }
        "^$(Get-AliasPattern tgit) (.*)" { GitTabExpansion $lastBlock }

        # Fall back on existing tab expansion
        default { if (Test-Path Function:\TabExpansionBackup) { TabExpansionBackup $line $lastWord } }
    }
}

Pop-Location
