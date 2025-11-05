import asyncdispatch, httpclient, json, strutils

const api = "https://edgeapi.astroapps.io/api"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "edgeapi.astroapps.io",  "Content-Type": "application/json",  "accept": "application/json, text/plain, */*", "user-agent":"Mozilla/5.0 (Android; Android 7.1.1; LG-H910 Build/NRD90M) AppleWebKit/536.38 (KHTML, like Gecko)  Chrome/55.0.1973.314 Mobile Safari/600.3"})

proc get_servers*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    headers["key"]="mZp_7KLWxvUeNaP5TCJrGtYQoi9fEbWDxHsVm63K"
    client.headers = headers
    let response = await client.get(api & "/getAllServersData")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()

proc my_ip*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/findMe")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()
