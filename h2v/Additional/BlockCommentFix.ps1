# Powershell Script used to add ';| ' to the inside lines of any block comments that use ';*' and '*;'
# This block comment is not standard LISP apparently, so this is a workaround to make syntax highlighting look nice, by commenting all of the lines individually

# Un-comment out this next line, and point it to a directory, containing directories, that containt .lisp files with un-fixed ';*' '*;' block comments
# $rootFolder = Get-ChildItem "\GitHub\BlamScript-Research\h2v" -Recurse -Directory

$rootFolder | ForEach-Object{
    $currentFolder = $_
    $currentFolder.EnumerateFiles() | Where-Object{$_.Extension -eq '.lisp'} | 
        ForEach-Object{
            $file = $_
            $newFile = @()
            $commentBlock = $false
            (Get-Content $file.FullName) | ForEach-Object{
                $line = $_
                $newLine = $_
                If($_.Contains("*;")){$commentBlock = $false;$newLine = $newLine.Replace("*;",";*;")}
                If($commentBlock){$newLine = $_.Insert(0,";|")}
                If($_.Contains(";*")){$commentBlock = $true}
                $newFile += $newLine
            }
            $newFile | Out-File $file.FullName
        }
}          