![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) [![Docker Repository on Quay](https://quay.io/repository/suckowbiz/tor/status "Docker Repository on Quay")](https://quay.io/repository/suckowbiz/tor)

# tor

([Tor](https://www.torproject.org/)) Socks 5 Proxy.

## Getting Started

Download run script to have `tor` command available:

```bash
sudo curl --fail --location --show-error https://raw.githubusercontent.com/suckowbiz/dockerside/master/tor/tor -o /usr/local/bin/tor && sudo chmod +x /usr/local/bin/tor
```

## Usage Example

1. ```tor```
1. Configure your browser to use a `Socks Proxy` from `localhost` at port `9050`
1. Visit a page that displays your IP to make sure the proxy is set up properly. See [Google Search](https://www.google.de/#newwindow=1&q=my+wan+ip).

Tip: Disable browser plugins like Flash to avoid tracking of your real ip is still possible. See [http://ip-check.info](http://ip-check.info).

## Options

See the run script at `/usr/local/bin/tor`!

You might want to skip countries as being involved for proxying to circumnavigate censorships. To do so adopt ***ExcludeExitNodes*** located in the run script, e.g. to skip GERMANY as an exit node (default).
