# edgevpn
api for edgevpn android vpn service 
# Example
```nim
import asyncdispatch, edgevpn, json

let data = waitFor get_servers()
for server in data["data"]:
  try:
    echo server["ipaddress"].getStr() & ":" & $server["port"]
    echo server["country_name"].getStr() & ": " & server["city_name"].getStr()
    echo server["protocol"].getStr()
    echo server["password"].getStr()
  except Exception as e:
    discard
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
