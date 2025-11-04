## Prepare WINZNLABSQL
### Chocolatey Install:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
### MySQL-cli Install
```
choco install mysql-cli -Y
```

### MySQL-server Install

Download installer:
https://dev.mysql.com/downloads/installer/
Run installer and select MySQL Server and MySQL Workbench

## Configure database user for the webapp (use the root password defined before)
```
mysql -h WINZNLABSQL -u root -p
```

## Configure database for the webapp
```
CREATE DATABASE juiceshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'juiceshop'@'%' IDENTIFIED BY 'Ju1ce$hop!';
GRANT ALL PRIVILEGES ON juiceshop.* TO 'juiceshop'@'%';
FLUSH PRIVILEGES;
```
