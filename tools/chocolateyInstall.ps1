param(
[string]$serveractive,
[string]$serverpassive
)

$version      = '4.0.0'
$id           = 'zabbix-agent'
$title        = 'Zabbix Agent'
$scriptPath   = $PSScriptRoot
$url          = Join-Path $scriptPath "zabbix\zabbix_agents_$version.win.zip"
$checksum     = '36560559f15f712f5b297c6abfec16922215690aff87ec9a5f3d96397a46efdd'
$url64        = $url
$checksum64   = $checksum

$configDir    = Join-Path $env:PROGRAMDATA 'zabbix'
$zabbixConf   = Join-Path $configDir 'zabbix_agentd.conf'

$installDir   = Join-Path $env:PROGRAMFILES $title
$zabbixAgentd = Join-Path $installDir 'zabbix_agentd.exe'

$tempDir      = Join-Path $env:TEMP 'zabbix'

$zipFile      = Join-Path $tempDir "zabbix_agents_$version.win.zip"
$sampleConfig = Join-Path $tempDir 'conf\zabbix_agentd.win.conf'
$binFiles     = @('zabbix_agentd.exe', 'zabbix_get.exe', 'zabbix_sender.exe')


$is64bit = (Get-WmiObject -Class Win32_OperatingSystem | Select-Object OSArchitecture) -match '64'

$service = Get-WmiObject -Class Win32_Service -Filter "Name=`'$title`'"

try {
  if ($service) {
    $service.StopService()
  }

  if (!(Test-Path $configDir)) {
    New-Item $configDir -type directory
  }

  if (!(Test-Path $installDir)) {
    New-Item $installDir -type directory
  }

  if (!(Test-Path $tempDir)) {
    New-Item $tempDir -type directory
  }

$packageArgs = @{
  packageName    = $id
  fileFullPath   = $zipFile
  url            = $url
  url64bit       = $url64
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

 Get-ChocolateyWebFile @packageArgs

  Get-ChocolateyUnzip "$zipFile" "$tempDir"

  if ($is64bit) {
    $binDir = Join-Path $tempDir 'bin\win64'
  } else {
    $binDir = Join-Path $tempDir 'bin\win32'
  }

  foreach ($executable in $binFiles ) {
    $file = Join-Path $binDir $executable
    Move-Item $file $installDir -Force
  }

  if (Test-Path "$installDir\zabbix_agentd.conf") {
    if ($service) {
      $service.Delete()
      Clear-Variable -Name $service
    }

    Move-Item "$installDir\zabbix_agentd.conf" "$configDir\zabbix_agentd.conf" -Force

  } elseif (Test-Path "$configDir\zabbix_agentd.conf") {
    $configFile = "$configDir\zabbix_agentd-$version.conf"
    Move-Item $sampleConfig $configFile -Force

  } else {
    $configFile = "$configDir\zabbix_agentd.conf"
    Move-Item $sampleConfig $configFile

  }

  if (!($service)) {
    Start-ChocolateyProcessAsAdmin "--config `"$zabbixConf`" --install" "$zabbixAgentd"
  }

  Start-Service -Name $title

  Install-ChocolateyPath $installDir 'Machine'


} catch {

  throw
}
