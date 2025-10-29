w32tm /config /manualpeerlist:time.windows.com /syncfromflags:MANUAL
w32tm /config /update
w32tm /query /source [to check if config is ok]
w32tm /resync

w32tm /config /manualpeerlist:WINZNLABDC.ZNLAB.LOC /syncfromflags:MANUAL
w32tm /config /update
w32tm /query /source
w32tm /resync
Set-TimeZone "Romance Standard Time"
