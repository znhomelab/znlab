## Fix DNS pointing to WINZNLABDC

Check actual configuration:
```
sudo resolvectl dns
```
Configure on the right link:

```
sudo resolvectl dns ens160 10.160.55.217

```

znlab.loc
## Create traffic generator application

sudo apt install git docker-compose

git clone https://github.com/znhomelab/znlab.git

cd $HOME/znlab/wptraffic

Some useful commands:
sudo docker-compose up --build
sudo docker-compose up -d
sudo docker-compose down
sudo docker image prune -af


