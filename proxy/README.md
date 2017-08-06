# proxy
A [Dockerfile](http://docs.docker.com/engine/reference/builder/) to serve 
a caching ([Squid](http://www.squid-cache.org/)), spam blocking 
([Privoxy](http://www.privoxy.org/)) and anonymous ([Tor](https://www.torproject.org/)) 
HTTP proxy.

# Run
## Using public image from Docker registry
Download and execute:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/proxy/proxy > /usr/bin/proxy && sudo chmod +x /usr/bin/proxy
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build proxy`.
- `dockerside/proxy/proxy`.

# Usage
- Run (binds to [default route](https://en.wikipedia.org/wiki/Default_gateway) on port `3128`).
- configure your browser to use a `HTTP proxy` from `localhost` at port `3128` for `all protocols`
- visit a page that displays your IP to make sure the proxy is set up properly. See [Google Search](https://www.google.de/#newwindow=1&q=my+wan+ip).   

Tip: Disable browser plugins like Flash to avoid tracking of your real ip is still possible. See [http://ip-check.info](http://ip-check.info).

## Options
See the run script:
You might want to skip countries as being involved for proxying to circumnavigate censorships of any kind. To do so you might want to provide environment variable ***TOR_EXCLUDE_EXIT_NODES*** which follows the restrictions of TOR parameter *ExcludeExitNodes* (see [TOR manual](https://www.torproject.org/docs/tor-manual.html.en)). E.g. to skip GERMANY as an exit node start the proxy like:  
`docker run -d -p 0.0.0.0:3128:3128 -e TOR_EXCLUDE_EXIT_NODES="{de}" suckowbiz/proxy`
