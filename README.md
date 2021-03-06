# **Zabbix-agent3 for chocolatey**

## Description

This package installs the Zabbix agent using the pre-compiled files from [Zabbix SIA](zabbix.com).
Executables are placed in `$env:ProgramFiles\Zabbix Agent` which is generally
`C:\Program Files\Zabbix Agent`. The `zabbix_agentd.conf` file is stored in `$env:ProgramData\zabbix`.
On Windows 7 and up this is generally `C:\ProgramData\zabbix`. When new versions are installed the config
is not overwritten but rather the version number of the new file is appended to the name. For example,
if version 2.2.1 is installed and then upgraded to version 2.4.4 you will find the sample 2.4.4 config
files saved as `zabbix_agentd-2.4.4.conf.`

Repository

* [https://github.com/marcinbojko/zabbix-agent](https://github.com/marcinbojko/zabbix-agent)

## Release Notes

### 2018-12-15 Release 4.0.0

* updated binary to version 4.0.0
* VirusTotal - [https://www.virustotal.com/#/file/36560559f15f712f5b297c6abfec16922215690aff87ec9a5f3d96397a46efdd/detection](https://www.virustotal.com/#/file/36560559f15f712f5b297c6abfec16922215690aff87ec9a5f3d96397a46efdd/detection)

### 2018-07-03 Release 3.4.9

* updated binary to version 3.4.9
* VirusTotal - [https://www.virustotal.com/#/file/a13ebddefb7c13b777fa169a264d39cae6072d484fc13eafb887843d8fce4aa3/detection](https://www.virustotal.com/#/file/a13ebddefb7c13b777fa169a264d39cae6072d484fc13eafb887843d8fce4aa3/detection)

### 2018-02-05 Release 3.4.6

* updated binary to version 3.4.6

### 2017-10-25 Release 3.4.0

* updated binary to version 3.4.0
* added Virus Total check link - [https://www.virustotal.com/#/file/be9dddb75005907b26c2159c3eeeb7f88abd007d3b220ce79d9df2f2da10be4c/detection](https://www.virustotal.com/#/file/be9dddb75005907b26c2159c3eeeb7f88abd007d3b220ce79d9df2f2da10be4c/detection)

### 2017-09-02 Release 3.2.7

* updated binary to version 3.2.7
* switch to host binaries (zip) inside chocolatey package (due to Dropbox public links change)
* added Virus Total check link - [https://www.virustotal.com/pl/file/7a8060ef278a59c248244a6657ee96a9226c0f003b2cfe70aedadecddb05f086/analysis/1504375667/](https://www.virustotal.com/pl/file/7a8060ef278a59c248244a6657ee96a9226c0f003b2cfe70aedadecddb05f086/analysis/1504375667/)

### 2016-12-30 Release 3.2.3

* updated binary to version 3.2.3
* added Virus Total check link - 124177e00ce3fb09e1b9f9f2ece259035be3c2d66755b960f1993d932043a410 - [https://www.virustotal.com/en/file/124177e00ce3fb09e1b9f9f2ece259035be3c2d66755b960f1993d932043a410/analysis/1483079799/](https://www.virustotal.com/en/file/124177e00ce3fb09e1b9f9f2ece259035be3c2d66755b960f1993d932043a410/analysis/1483079799/)

### 2016-10-01 Release 3.2.0 rev.b

* updated README.MD
* added Virus Total check link - [https://www.virustotal.com/en/file/c34d824cb26af1a22cc5423fa748c398c1241282ab3fd4b9c6b898ff8ae2fd0b/analysis/1475138389/](https://www.virustotal.com/en/file/c34d824cb26af1a22cc5423fa748c398c1241282ab3fd4b9c6b898ff8ae2fd0b/analysis/1475138389/)

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

## ToDo

* add OpenSSL supported versions
* remove 32bit version
* package name change to mirror major version

## Original release

The source for this Chocolatey package can be found on [GitHub](https://github.com/genebean/zabbix-agent-chocolatey).
Please also file any issues you find using the project's [Issue tracker](https://github.com/genebean/zabbix-agent-chocolatey/issues).