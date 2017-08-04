$packageName = 'VeeamAgentforWindows'
$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
$installerDir = Join-Path $toolsDir 'installerDir'
$downloadURL = 'https://download2.veeam.com/VeeamAgentWindows_2.0.0.700.zip'
$installer = 'VeeamAgentWindows_2.0.0.700.exe'


Install-ChocolateyZipPackage $packageName -url $downloadURL -UnzipLocation $installerDir

$packageArgs = @{
	packageName   = $installer 
	fileType      = 'exe'
	file          = "$installerDir\$installer"
	silentArgs    = '/silent /accepteula'
  ValidExitCodes = @(0,1000,1101)
}

Install-ChocolateyInstallPackage @packageArgs 