## Setup the database on WINZNLABSQL

## Install XAMPP (Apache+PHP)

https://www.apachefriends.org/index.html

https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.2.12/xampp-windows-x64-8.2.12-0-VS16-installer.exe/download

Other apps that can be installed:

- [ ] MySQL
- [ ] FileZilla FTP
- [ ] Mercury Mail Server
- [ ] Tomcat
- [ ] Perl

## Install Wordpress on WINZNLABAPP

### Rename htdocs folder
If necessary, stop Apache from XAMPP Control Panel

### Download Wordpress

https://wordpress.org/latest.zip

```
New-Item -Path C:\temp -ItemType Directory -Force
Invoke-WebRequest -Uri https://wordpress.org/latest.zip -OutFile C:\temp\latest.zip -UseBasicParsing
Rename-Item -Path C:\xampp\htdocs -NewName htdocs.DIST
Expand-Archive -LiteralPath C:\temp\latest.zip -DestinationPath C:\xampp\htdocs
```

### Download and copy wp-config.php
```
Invoke-WebRequest -Uri https://github.com/znhomelab/znlab/blob/main/wp-config.php -OutFile C:\xampp\htdocs\wp-config.php.zip -UseBasicParsing
```
### Start Apache from XAMPP Control Panel

### Access and configure Wordpress
