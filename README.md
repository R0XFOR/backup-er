# backup-er
Simple backup bat script for Windows/Linux

### Requirements:
#### Windows:
**[7zip](https://www.7-zip.org/)**
**[openssl](https://slproweb.com/products/Win32OpenSSL.html)**
> [!IMPORTANT]
> Make sure that the paths to the 7-Zip and OpenSSL executable files are included in the Windows **PATH** environment variable.

#### Linux:
###### Debian for example
```
sudo apt install 7zip
sudo apt install openssl
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
