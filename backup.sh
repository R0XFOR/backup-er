#!/bin/bash

password="<PLACE PASSWORD HERE>"
backup_file_extension="enc"
compression=0


filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

timestamp=$(date +%d-%m-%Y_%H-%M-%S)

if [ $extension = $backup_file_extension ]
then
	echo "Decrypt"
        openssl aes-256-cbc -d -nosalt -k "$password" -in "$1" -out "backup.zip"
        7z x -mx$compression backup.zip
        rm backup.zip
else
	echo "Encrypt"
        7z a -mx$compression backup.zip "$1"
        openssl aes-256-cbc -e -nosalt -k "$password" -in "backup.zip" -out "backup $timestamp.$backup_file_extension"
        rm backup.zip
fi

echo "Done!"
