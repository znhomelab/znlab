## Deploy 2 servers: WINZNLABSQL and WINZNLABAPP

- Use template "Windows Server 2022 Standard"
- Change computer name (use CLAB script option 6)
- Add to domain (use CLAB script option 3)
  ZNLAB.LOC\Administrator
- Edit Domain
- Edit Use

CLAB Script:
```
iex (iwr "https://raw.githubusercontent.com/NEXTGEN-CyberLAB/WIN-CyberLAB-Tools/main/CyberLAB-quickstart.ps1" -UseBasicParsing).Content

```
## Prepare both servers:

### Chocolatey Install:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### MySQL-cli Install
```
choco install mysql-cli
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
CREATE USER 'juiceshop'@'WINZNLABAPP' IDENTIFIED BY 'Ju1ce$hop!';
GRANT ALL PRIVILEGES ON juiceshop.* TO 'juiceshop'@'WINZNLABAPP';
FLUSH PRIVILEGES;
```

