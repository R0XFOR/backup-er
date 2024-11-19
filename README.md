# backup-er
Simple backup bat script for Windows/Linux

### Requirements:
#### Windows:
**[7zip](https://www.7-zip.org/)**
**[openssl](https://slproweb.com/products/Win32OpenSSL.html)**

#### Linux:
###### Debian for example
```
apt install 7zip
apt install openssl
```

### Usage:
#### Windows:
```
backup <PATH TO FILE>
```
or just drag file to .bat file
#### Linux:
###### Debian for example
```
sudo chmod +x backup.sh
./backup.sh <PATH TO FILE>
```