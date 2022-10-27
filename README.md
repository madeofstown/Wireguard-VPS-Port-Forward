# Wireguard-VPS-Port-Forward
***This project is for*** anybody who would like to host from home but either:
- Don't have a static IP address or behind CGNAT
- ISP blocks outbound or inbound connections on certain ports

***This project contains*** instructions (wiki) and example configuration files and scripts with the purpose of helping you forward/route internet traffic from a rented VPS to a server on your local network via a WireGuard tunnel. The connection through the tunnel maintains the source IP information so your local server will see the real IPs of the clients connecting to it (unlike the majority of other methods you will find guides for - which rely on NAT to ensure traffic flows over the tunnel). The way this is achieved is by only NATing traffic that passes in and out of the VPS WAN connection and then by employing routing rules on the local server to ensure that traffic exiting will go through the WireGuard tunnel

![NetDiagram drawio](https://raw.githubusercontent.com/randommouse/Wireguard-VPS-Port-Forward/main/img/NetDiagram.drawio.png)
