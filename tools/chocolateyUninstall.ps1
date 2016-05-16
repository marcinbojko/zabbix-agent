$id         = 'zabbix-agent'
$title      = 'Zabbix Agent'
$installDir = Join-Path $env:PROGRAMFILES $title
$configDir  = Join-Path $env:PROGRAMDATA 'zabbix'

try
{
  $service = Get-WmiObject -Class Win32_Service -Filter "Name=`'$title`'"

  if ($service) {
    $service.StopService()
    $service.Delete()
  }

  Remove-Item $installDir -Recurse
  Remove-Item $configDir -Recurse

  Write-ChocolateySuccess $id
}
catch
{
  Write-ChocolateyFailure $id "$($_.Exception.Message)"
  throw
}
