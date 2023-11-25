Get-ChildItem -Directory
| Where-Object -Property Name -Match "-"
| ForEach-Object {
    $Name = $_.Name;
    $DirectoryName = $_.FullName;
    $IndexFileName = Join-Path $DirectoryName "index.html";
    $Source = Get-Content $IndexFileName;
    $TitleElement = $Source | Select-String "og:title";

    $Title = [System.Text.RegularExpressions.Regex]::Match($TitleElement, 'content="(.*)"').Groups[1].Value;

    "<li><a href='$Name'>$Title</a></li>"
}
