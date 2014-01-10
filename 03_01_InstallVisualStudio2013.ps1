# by Sven Knispel under ter terms of the Ms-PL license (see license.txt)
#
# Installs Visual Studio 2013 ultimate (the product must later be activated with a proper key
#
# History
# 1.0 	2014-01-03 	Initial version 
########################################################################
# Make changes in this section if required

# basic path and ISO info
$developerFolderPath = "e:\automation"
$softwareSetupPath = "e:\software"
$setupPath = [STRING]::Concat($softwareSetupPath, "\en_visual_studio_ultimate_2013_x86_dvd_3175319\vs_ultimate.exe")


# changes end here
########################################################################

Write-Host "(VM) $(Get-Date): Start to install Visual Studio 2013."


if (-Not(Test-Path $setupPath))
{
    Write-Host "(VM) $(Get-Date): $setupPath does not exist"
    exit 1
}
$psExecPath = Join-Path -Path $developerFolderPath "tools\PsExec.exe"
$psExecLogPath = Join-Path -Path $developerFolderPath "tools\PsExecLog.txt"

$configFile = $psExecLogPath = Join-Path -Path $softwareSetupPath "VisualStudioConfig.xml"
    
$arguments = " /AdminFile $configFile"

$arguments = $setupPath + $arguments

Write-Host "(VM) $(Get-Date): Executing $arguments"
pause

$process = Start-Process -NoNewWindow -FilePath $psExecPath -ArgumentList $arguments -Wait -PassThru


return 0
