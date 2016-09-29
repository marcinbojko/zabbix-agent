# zabbix-agent-chocolatey

This package installs the Zabbix agent using the pre-compiled files from [Zabbix SIA](zabbix.com).
Executables are placed in `$env:ProgramFiles\Zabbix Agent` which is generally
`C:\Program Files\Zabbix Agent`. The `zabbix_agentd.conf` file is stored in `$env:ProgramData\zabbix`.
On Windows 7 and up this is generally `C:\ProgramData\zabbix`. When new versions are installed the config
is not overwritten but rather the version number of the new file is appended to the name. For example,
if version 2.2.1 is installed and then upgraded to version 2.4.4 you will find the sample 2.4.4 config
files saved as `zabbix_agentd-2.4.4.conf.`

The source for this Chocolatey package can be found on [GitHub](https://github.com/genebean/zabbix-agent-chocolatey).
Please also file any issues you find using the project's [Issue tracker](https://github.com/genebean/zabbix-agent-chocolatey/issues).


## Release Notes

### 2016-09-29 Release 3.2.0

* version change
* added checksum options
* added Virus Total check link - [https://www.virustotal.com/en/file/c34d824cb26af1a22cc5423fa748c398c1241282ab3fd4b9c6b898ff8ae2fd0b/analysis/1475138389/](https://www.virustotal.com/en/file/c34d824cb26af1a22cc5423fa748c398c1241282ab3fd4b9c6b898ff8ae2fd0b/analysis/1475138389/)

### 2016-09-06 Release 3.0.4.0

* version change

### 2016-07-26 Release 3.0.3.1

* switched to binary from [http://www.suiviperf.com/zabbix/](http://www.suiviperf.com/zabbix/)
* repacked from source to *.zip

### 2016-05-12 Release 3.0.0 /Marcin Bojko/

* Switch to 3.0.0 branch

### 2015-03-22 Release 2.4.4

* Moved config file from `$env:ProgramFiles\Zabbix Agent` to `$env:ProgramData\zabbix`
* Reworked `.nuspec` file to adhere to Chocolatey standards
* Reworked scripts so that all variables are at the top and so that they are less likely to throw
  errors or fail
* Made syntax more consistent throughout scripts. For example, changed to use `Join-Path` everywhere
  instead of just in some place.
