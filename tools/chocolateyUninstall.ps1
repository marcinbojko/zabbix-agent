$id         = 'zabbix-agent'
$title      = 'Zabbix Agent'
$process    = 'zabbix_agentd'
$installDir = Join-Path $env:PROGRAMFILES $title
$configDir  = Join-Path $env:PROGRAMDATA 'zabbix'

try
{
  $service = Get-WmiObject -Class Win32_Service -Filter "Name=`'$title`'"

  if ($service) {
    $service.StopService()
    $service.Delete()
  }

  # Just in case something went wrong
  Stop-Process -processname $process -force -ErrorAction SilentlyContinue
  Start-Sleep -s 5
  # Remove configurations
  Remove-Item $installDir -Recurse -Force -ErrorAction SilentlyContinue
  Remove-Item $configDir -Recurse -Force -ErrorAction SilentlyContinue

}
catch
{

  throw
}
