# RF-ID

## In the field cloning
With the flipper zero you can quickly clone NFC cards. However you cannot write to cards because it only supports LF (low frequency) writing.

With the pm3 it is possible to write to a card with the collected information. The file on the flipper zero is a '.nfc' file. This can be opened in a text editor and the information can be read.

### Reading card
```
pm3-> hf search
```

### Writing UID to card
Below is an example to write to a mifare classic 1k card (gen 1a):
```
hf mf csetuid -w -u <UID> --atqa 0004 --sak 08
```


## Usefull links
- https://www.reddit.com/r/proxmark3/comments/mqnike/writing_to_a_card/
