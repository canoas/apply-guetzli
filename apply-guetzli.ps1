param (
    [string]$path = (split-path -parent $MyInvocation.MyCommand.Definition)
)
$cli = Join-Path $path "guetzli\guetzli_windows_x86.exe"
#$cli = Join-Path $path echoargs.exe

dir -Path $path -recurse -Include @("*.png","*.jpeg","*.jpg") | %{
    $in = $_.FullName 
    $out = $in.Replace($_.Extension, '.compressed.jpg')

    write-host "Processing $out" -ForegroundColor Green
    
    $arguments = @("-verbose",$in,$out)
    . $cli $arguments
} 
