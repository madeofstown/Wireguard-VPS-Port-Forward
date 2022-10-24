# Replace all values surrounded by <> with your own. (remove the <>!)
# Set Network Interface Name (command line> ip a , look for device that has your local ip)
ni=<ens18>

ip route del default
ip route add default dev wg0
ip route add <1.2.3.4 - VPS Public IPv4>/32 via <Router Local IPv4> dev $ni
ip route add <10.1.0.0/24 - Local IPv4 Subnet> via <10.1.0.1 - Router Local IPv4> dev $ni
ip -6 route add <fd10::/64 - Local IPv6 Subnet> via <fd10::1 - Router Local IPv6> dev $ni