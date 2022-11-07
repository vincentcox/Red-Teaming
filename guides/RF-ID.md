# RF-ID

## In the field cloning
With the flipper zero you can quickly clone NFC cards. However you cannot write to cards because it only supports LF (low frequency) writing.

With the pm3 it is possible to write to a card with the collected information. The file on the flipper zero is a '.nfc' file. This can be opened in a text editor and the information can be read.

### Reading card
```
pm3-> hf search
```

Useful mifare classic 1k read commands:
hf search
hf 14a reader -> reads basic info like uid
hf 14a info -> same as reader but more info is given
hf mf cgetblk --blk 0 -> reads raw hex from block 0, which is the manufacturing block. Contains UID followed by the BCC which needs to be correct!

### Writing UID to card
Below is an example to write to a mifare classic 1k card (gen 1a):
```
hf mf csetuid -w -u <UID> --atqa 0004 --sak 08
```


## Usefull links
- https://www.reddit.com/r/proxmark3/comments/mqnike/writing_to_a_card/



handy site for bcc calaculation: https://bcc.beyerleinf.de/
useful mifare classic 1k read commands:
hf search
hf 14a reader -> reads basic info like uid
hf 14a info -> same as reader but more info is given
hf mf cgetblk --blk 0 -> reads raw hex from block 0, which is the manufacturing block. Contains UID followed by the BCC which needs to be correct!
