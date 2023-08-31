# Principles:
## general
- Compose service names will become the service's addressable hostname. They should be globally unique (see examples in docker-compose.yml files)
- A user-defined bridge network is used for container-to-container communication
- Traefik is used as a reverse proxy for host-to-container communication
- Traefik also configures the TLS layer and uses a `local.inseng.net` cert


## Web Compose services (i.e. `web`)
- Service name should be globally unique *and* end in `local.inseng.net`. See docker-compose.yml file examples
- Bind server to 0.0.0.0. This allows other containers to just make a request to the default host name for a service.
- Have the server listen on the container's port 80 for requests.

## What I did to setup
1. Create a loopback alias for your host and containers to access to avoid loopback confusion (`sudo ifconfig lo0 alias 192.168.42.42`)
2. Create an bridge network for all services to use (`docker network create test-net --gateway=172.26.0.1 --subnet=172.26.0.0/16`)
3. Specify the default network in all docker-compose.yml
4. Use a standardized compose service name ending in `local.inseng.net`
5. Use dnsmasq to point `*.local.inseng.net` to the loopback ip (`192.168.42.42`)
6. Generate certificates for `*.local.inseng.net` by using `traefik/scripts/generate_certs.sh`
