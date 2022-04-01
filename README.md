# Server Status
A BASH Script to check server and services status on a LAMP enviroment with DEBIAN 11

This script display the below data listed

- **SO:** version, System memory status
- **APACHE:** version, service status
- **MYSQL:** version, service status
- **PHP:** version
- **APACHE LOGS:** errors and access logs (last 100 entries)

**To run the script corectly need to be root**

```
sudo ./serverstatus.sh 
```
**OR**
```
sudo bash serverstatus.sh
```

alternatively an alias can be added to run the command from anywhere and persist it between different shell sessions

1- Open $HOME/.bashrc with your favorite text editor and add the alias to the bottom of file.
```
alias serverstatus="sudo bash $HOME/serverstatus.sh"
```
2- run 
```
source $HOME/.bashrc
```
