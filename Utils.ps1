# General Utility Functions

# Check current folder type
#  0: Not a repository
#  1: Git repository
#  2: Mercurial repository
#
# Note: Treats Mercurial repositories with in-tree git directory 
#       as normal Mercurial repositories
function IsHgOrGitDirectory {
  if(test-path ".hg") {
    return 2;
  }
  
  if(test-path ".git") {
    return 1;
  }
  
  # Test within parent dirs
  $checkIn = (Get-Item .).parent
  while ($checkIn -ne $NULL) {
      $hgPathToTest = $checkIn.fullname + '/.hg'
      $gitPathToTest = $checkIn.fullname + '/.git'
      if ((Test-Path $hgPathToTest) -eq $TRUE) {
          return 2;
      } elseif ((Test-Path $gitPathToTest) -eq $TRUE) {
          return 1;
      } else {
          $checkIn = $checkIn.parent
      }
    }
    
    return 0;
}

function Invoke-NullCoalescing {
    $result = $null
    foreach($arg in $args) {
        if ($arg -is [ScriptBlock]) {
            $result = & $arg
        } else {
            $result = $arg
        }
        if ($result) { break }
    }
    $result
}

Set-Alias ?? Invoke-NullCoalescing -Force

function Get-LocalOrParentPath($path) {
    $checkIn = Get-Item -Force .
    while ($checkIn -ne $NULL) {
        $pathToTest = [System.IO.Path]::Combine($checkIn.fullname, $path)
        if (Test-Path $pathToTest) {
            return $pathToTest
        } else {
            $checkIn = $checkIn.parent
        }
    }
    return $null
}

function dbg ($Message, [Diagnostics.Stopwatch]$Stopwatch) {
    if($Stopwatch) {
        Write-Verbose ('{0:00000}:{1}' -f $Stopwatch.ElapsedMilliseconds,$Message) -Verbose # -ForegroundColor Yellow
    }
}
