# External Perimeter / Recon

## amass

Make sure that amass.ini contains several API keys for better results. 

```
amass enum -active -d "$domainname" -v -config /Users/vincentcox/Documents/Tools/amass.ini -src -ip -brute -max-depth 5 -alts -dir ~/Downloads/amass/"$domainname" -o ~/Downloads/amass/"$domainname"/amass_output.txt
```

Extract domain list:

```
cat amass.json | jq -r '.name' > to_witness.txt
```

Feed into eyewitness:

```
eyewitness -f to_witness.txt -d results --timeout 30 --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' --threads 6 --delay 10
```

Go through interesting websites and perform dirsearch/dir (go) 
