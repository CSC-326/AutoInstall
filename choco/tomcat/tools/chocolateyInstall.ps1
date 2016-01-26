$packageName = 'tomcat'
$32BitUrl = 'http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30-windows-x86.zip'
$64BitUrl = 'http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30-windows-x64.zip'
$global:installLocation = Get-BinRoot
$checksum = '407388ece780cbc24389669330902488'
$checksumType = 'md5'
$checksum64 = 'e3bef82f712da7110aaeae5a64ebdb20'
$checksumType64 = 'md5'
$availablePort = '8080'
$majorVersion = "8.0.30"[0]
$serviceName = "tomcat${majorVersion}"
 
if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\OverwriteParameters.ps1"
. "$PSScriptRoot\Install-Service.ps1"
 
OverwriteParameters
 
Install-ChocolateyZipPackage "$packageName" "$32BitUrl" "$global:installLocation" "$64BitUrl" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"
 
$catalinaHome = "$global:installLocation\apache-tomcat-8.0.30"
$createServiceCommand = "${catalinaHome}\bin\service.bat install $serviceName"
 
Install-ChocolateyEnvironmentVariable 'CATALINA_HOME' "$catalinaHome"
 
Install-Service $packageName $serviceName $createServiceCommand $availablePort