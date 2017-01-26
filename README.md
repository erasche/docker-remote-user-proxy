# Remote User Proxy image

Testing `REMOTE_USER` services can sometimes be complex if you do not have
infrastructure set up for it.

This proxy provides a convenient way to statically add a remote user username
and proxy your request to a backend service.

## Testing

Simply run `test.sh`:

```console
$ bash test.sh
Pulling containers
Launching containers
Containers started, please check for REMOTE_USER in the following request
{
  "headers": {
    "Accept": "*/*",
    "Connection": "close",
    "Host": "target:8000",
    "Remote-User": "user@example.com",
    "User-Agent": "curl/7.47.0",
    "X-Forwarded-Host": "0.0.0.0",
    "X-Url-Scheme": "https"
  }
}
```

## LICENSE

AGPL-3.0
