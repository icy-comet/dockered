> Quickly setup a PiHole instance along with Wireguard for easy-toggle access to adblocking.

> This `docker-compose` file exposes PiHole ports directly on the host as well. Don't use it as-is-is if you are looking to expose PiHole over the internet.

## What is this project?
I currently have my old laptop as my home server which I do not leave running 24\*7. I also many times shutdown my main VM when testing something.

Since changing DNS resolver on my router or each client every time PiHole is down or blocking something in the middle of a urgent meeting is not feasible, I use Wireguard as a 1-Click toggle.

### Change DNS for Docker's (Ubuntu) host
If you are planning on exposing the ports directly on a Ubuntu host,

Follow the steps mentioned `docker-pihole`'s [docs](https://github.com/pi-hole/docker-pi-hole#installing-on-ubuntu).

### Private variables
Set these variables in the `.env` as required:
```
SERVER_URL=<server-url>
PIHOLE_PASSWD=<password>
```

### Find peer/client configs
`./config/peer<num>/peer<num>.conf`

### Disable split tunneling
Currently, Wireguard is configured to only allow traffic to the PiHole Instance and drop the rest of the packets. This way, if the DNS resolver is manually changed on a peer, it still works. To disable it, just set `AllowedIPs` to `0.0.0.0/0, ::0/0`

### Change Nuber of Peers
Just change the `PEERS` env variable in the `docker-compose` file and restart the stack with `docker-compose up`.

### Display a peer's QR Code in the terminal
Run:
``bash
docker-compose exec wireguard /app/show-peer 1 4 5
```
Here, `1` `4` and `5` are peer numbers.