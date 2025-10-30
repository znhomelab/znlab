Install the following packages:
```
choco install apache-httpd php php-extensions mysql-odbc git unzip -y
```

Edit
C:\tools\Apache24\conf\httpd.conf

```
LoadModule php_module "C:/tools/php/php8apache2_4.dll"
AddHandler application/x-httpd-php .php
PHPIniDir "C:/tools/php"
DirectoryIndex index.php index.html
```
