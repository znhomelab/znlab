## Deploy 2 servers: WINZNLABSQL and WINZNLABAPP

- Use template "Windows Server 2022 Standard"
- Change computer name (use CLAB script option 6)
- Add to domain (use CLAB script option 3)
  ZNLAB.LOC\Administrator
- Edit Domain
- Edit Use

CLAB Script:
``
iex (iwr "https://raw.githubusercontent.com/NEXTGEN-CyberLAB/WIN-CyberLAB-Tools/main/CyberLAB-quickstart.ps1" -UseBasicParsing).Content
``
## Prepare both servers:

Chocolatey Install:
``
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
``

