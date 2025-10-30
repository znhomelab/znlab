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
---
## Prepare WINZNLABAPP
### Chocolatey Install:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
### MySQL-cli Install
```
choco install mysql-cli -Y
```
> [!IMPORTANT]
> Review from here!!!!
choco install nodejs git nssm -Y


## Install node + dependencies
```
choco install nodejs git nssm -y
```
## Prepare environment,
> [!TIPS] Open a new Powershell window
```
New-Item -ItemType Directory -Force -Path C:\Apps
cd C:\Apps
git clone https://github.com/juice-shop/juice-shop.git --depth 1
cd juice-shop
npm install
npm install mysql2
```
> [!IMPORTANT]
> Review to here!!!!
## Configure environment variables

```
setx PORT 80
setx NODE_ENV production
setx DB_TYPE mysql
setx DB_HOST WINZNLABSQL
setx DB_PORT 3306
setx DB_NAME juiceshop
setx DB_USER juiceshop
setx DB_PASSWORD Ju1ce$hop!
```
## Start node
```
npm start
```
Now you can access to the webapp

http://winznlab


## Install nssm
```
choco install nssm -y
```
## Execute as a Service with nssm

```
nssm install JuiceShop "C:\Program Files\nodejs\node.exe" "server.js"
nssm set JuiceShop AppDirectory "C:\Apps\juice-shop"
nssm set JuiceShop AppEnvironmentExtra "PORT=80","NODE_ENV=production","DB_TYPE=mysql","DB_HOST=WINZNLABSQL","DB_PORT=3306","DB_NAME=juiceshop","DB_USER=juiceshop","DB_PASSWORD=Ju1ce$hop!"
nssm set JuiceShop Start SERVICE_AUTO_START
nssm start JuiceShop
```
![](https://myoctocat.com/assets/images/base-octocat.svg)
