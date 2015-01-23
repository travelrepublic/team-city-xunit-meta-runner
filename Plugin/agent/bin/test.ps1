$match = $args[0]
$category = $args[1]
$delimiter = " "
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
[string]$files = $nothing ; ls . -filter *.dll -recurse | Where-Object {$_.FullName -match $match} | resolve-path -relative | % { $files += '"' + $_ + '"' + $delimiter  } ; 
$command = $scriptPath + "\xunit.console.exe " + $files + "-teamcity -parallel all -trait category=""" + $category + """"
invoke-expression $command