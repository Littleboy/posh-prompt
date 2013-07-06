$global:PoshPromptSettings = New-Object PSObject -Property @{
    # Defaults
    DefaultForegroundColor     = $Host.UI.RawUI.ForegroundColor

    # Global settings
    ShowUserLocationAsPrompt   = $true
    ShowUserLocationAsTitle    = $false
    ShowStatusWhenZero         = $false
    EnablePromptStatus         = !$Global:GitMissing
    EnableFileStatus           = $true
    AutoRefreshIndex           = $true
    RepositoriesInWhichToDisableFileStatus = @( ) # Array of repository paths
    EnableWindowTitle         = 'posh~prompt ~ '

    # Tortoise
    TortoiseGitPath = ${env:ProgramFiles} + "\TortoiseGit\bin\TortoiseProc.exe"

    # Debug
    Debug                      = $false

    # Tab expansion
    AllCommands                = $false

    # Before prompt
    BeforeText                 = ' ['
    BeforeForegroundColor      = [ConsoleColor]::Yellow
    BeforeBackgroundColor      = $Host.UI.RawUI.BackgroundColor

    # Delim
    DelimText                  = ' |'
    DelimForegroundColor       = [ConsoleColor]::Yellow
    DelimBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # After prompt
    AfterText                  = ']'
    AfterForegroundColor       = [ConsoleColor]::Yellow
    AfterBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # Current branch
    BranchForegroundColor      = [ConsoleColor]::Cyan
    BranchBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    # Current branch when not updated
    BranchAheadForegroundColor  = [ConsoleColor]::Green
    BranchAheadBackgroundColor  = $Host.UI.RawUI.BackgroundColor
    BranchBehindForegroundColor = [ConsoleColor]::Red
    BranchBehindBackgroundColor = $Host.UI.RawUI.BackgroundColor
    BranchBehindAndAheadForegroundColor = [ConsoleColor]::Yellow
    BranchBehindAndAheadBackgroundColor = $Host.UI.RawUI.BackgroundColor
    
    # Index
    BeforeIndexText            = ""
    BeforeIndexForegroundColor = [ConsoleColor]::Blue
    BeforeIndexBackgroundColor = $Host.UI.RawUI.BackgroundColor
    
    IndexForegroundColor       = [ConsoleColor]::Blue
    IndexBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    
    # Working directory status
    WorkingForegroundColor     = [ConsoleColor]::Yellow
    WorkingBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    
    # Untracked
    UntrackedText              = ' !'
    UntrackedForegroundColor   = [ConsoleColor]::Yellow
    UntrackedBackgroundColor   = $Host.UI.RawUI.BackgroundColor
    
    AddedBackgroundColor       = $Host.UI.RawUI.BackgroundColor
    ModifiedBackgroundColor    = $Host.UI.RawUI.BackgroundColor
    DeletedBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    MissingBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    RenamedBackgroundColor     = $Host.UI.RawUI.BackgroundColor
    
    #Tag list
    ShowTags                   = $false
    BeforeTagText              = ' '
    TagForegroundColor         = [ConsoleColor]::DarkGray
    TagBackgroundColor         = $Host.UI.RawUI.BackgroundColor
    TagSeparator               = ", "
    TagSeparatorColor          = [ConsoleColor]::White
    
    #Status
    StatusAddedText            = 'A'
    StatusModifiedText         = 'M'
    StatusDeletedText          = 'D'
    StatusUntrackedText        = '?'
    StatusMissingText          = '!'
    StatusRenamedText          = 'R'
    
    StatusAdded                = [ConsoleColor]::Green
    StatusModified             = [ConsoleColor]::Yellow
    StatusDeleted              = [ConsoleColor]::Cyan
    StatusUntracked            = [ConsoleColor]::Red
    StatusMissing              = [ConsoleColor]::Magenta
    StatusRenamed              = [ConsoleColor]::White
    
    # MQ Integration
    ShowPatches                   = $false
    BeforePatchText               = ' patches: '
    UnappliedPatchForegroundColor = [ConsoleColor]::DarkGray
    UnappliedPatchBackgroundColor = $Host.UI.RawUI.BackgroundColor
    AppliedPatchForegroundColor   = [ConsoleColor]::DarkYellow
    AppliedPatchBackgroundColor   = $Host.UI.RawUI.BackgroundColor
    PatchSeparator                = ' › '
    PatchSeparatorColor           = [ConsoleColor]::White
}