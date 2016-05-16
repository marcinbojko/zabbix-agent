param(
[string]$serveractive,
[string]$serverpassive
)

$version      = '3.0.0'
$id           = 'zabbix-agent'
$title        = 'Zabbix Agent'
$url          = "http://www.zabbix.com/downloads/$version/zabbix_agents_$version.win.zip"
$url64        = $url

$configDir    = Join-Path $env:PROGRAMDATA 'zabbix'
$zabbixConf   = Join-Path $configDir 'zabbix_agentd.conf'

$installDir   = Join-Path $env:PROGRAMFILES $title
$zabbixAgentd = Join-Path $installDir 'zabbix_agentd.exe'

$tempDir      = Join-Path $env:TEMP 'chocolatey\zabbix'

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

  Get-ChocolateyWebFile "$id" "$zipFile" "$url" "$url64"
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

  Write-ChocolateySuccess "$id"

} catch {
  Write-ChocolateyFailure "$id" "$($_.Exception.Message)"
  throw
}
