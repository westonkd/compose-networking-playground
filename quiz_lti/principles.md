# Principles:
## general
- Prefix service names with the repo name (i.e. `quiz_lti.web`)
- Use Traefik to direct requests from the host client (like a browser) to container
- Use an user-defined Docker bridge network for container-to-container communication.
- Both the routing rule used in Traefik and the docker compose service names should match!

## web
1. Bind server to 0.0.0.0. This allows other containers to just make a request to the default host name for a service.
2. Have the server listen on the container's port 80 for requests. This lets us make a request to `quiz_lti` from `api` like this:  http://quiz_lti.

## What I did
1. Create a loopback alias for your host and containers to access to avoid loopback confusion
2. Create an bridge network for all services to use
3. Specify the default network in docker-compose.yml
4. Make the container name <repo>.<service>
5. Clone my traefik config and change the default route naming to use the service name. Having the same thing here is key
6. docker compose build
7. docker compose up