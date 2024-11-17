@echo off

set password="<PLACE PASSWORD HERE>"
set backup_file_extension=".enc"
set compression=0

set input_file="%~1"
set input_file_extension="%~x1"

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

if %input_file_extension% == %backup_file_extension% (
	echo Decrypt
	openssl aes-256-cbc -d -nosalt -k %password% -in %input_file% -out "backup.zip"
	7z x -mx%compression% backup.zip
	del backup.zip
) else (
	echo Encrypt
	7z a -mx%compression% backup.zip %input_file%
	openssl aes-256-cbc -e -nosalt -k %password% -in "backup.zip" -out "backup %fullstamp%%backup_file_extension%"
	del backup.zip
)

echo Done
