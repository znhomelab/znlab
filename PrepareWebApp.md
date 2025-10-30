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

## Install node + dependencies
```
choco install nodejs git nssm -y
choco install visualstudio2019buildtools -y
choco install python3 -y
exit
```
## Prepare environment,
> [!TIP]
> Open a new Powershell window!!!
```
New-Item -ItemType Directory -Force -Path C:\Apps
cd C:\Apps
git clone https://github.com/juice-shop/juice-shop.git --depth 1
cd juice-shop
$env:PYTHON = "C:\Python314\python.exe"
Remove-Item -Path node_modules -Recurse -Force -ErrorAction SilentlyContinue
npm install
npm run build
```
Check that the Web App works
```
$env:NODE_CONFIG="custom"
npm start
```
> [!IMPORTANT]
> Modify the custom.yml file with the following change:
> C:\Apps\juice-shop\config\custom.yml (en el servidor WINZNLABAPP)
Copy the config file
```
Copy-Item 'config\default.yml' 'config\custom.yml'
```
Edit the custom.yml file
```
notepad C:\Apps\juice-shop\config\custom.yml
```
Use this content:
```
server:
  port: 80
database:
  dialect: mysql
  host: WINZNLABSQL 
  port: 3306
  database: juiceshop
  username: juiceshop
  password: Ju1ce$hop!
  pool:
    max: 5
    min: 0
    acquire: 30000
    idle: 10000
```
Configure the service:
```
nssm install JuiceShop "C:\Program Files\nodejs\npm.cmd" start
nssm set JuiceShop AppDirectory "C:\Apps\juice-shop"
nssm set JuiceShop AppEnvironmentExtra NODE_CONFIG=custom
nssm set JuiceShop AppRestartDelay 2000
nssm set JuiceShop AppThrottle 15000
nssm set JuiceShop AppExit 0 Exit
```

If you need to remove the service:
```
nssm remove JuiceShop
```
```
nssm install JuiceShop "C:\Program Files\nodejs\node.exe" "server.js"
nssm set JuiceShop AppDirectory "C:\Apps\juice-shop"
nssm set JuiceShop AppEnvironmentExtra "PORT=80","NODE_ENV=production","DB_TYPE=mysql","DB_HOST=WINZNLABSQL","DB_PORT=3306","DB_NAME=juiceshop","DB_USER=juiceshop","DB_PASSWORD=Ju1ce$hop!"
nssm set JuiceShop Start SERVICE_AUTO_START
nssm start JuiceShop
```
Restart the service:
```
net stop JuiceShop
net start JuiceShop
```
Try the app:

http://WINZNLABAPP

> [!IMPORTANT]
> Review ends here!!!!
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
