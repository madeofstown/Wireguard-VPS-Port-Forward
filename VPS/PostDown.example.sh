# Replace all values surrounded by <> with your own. (remove the <>!)
# Set Network Interface Name (command line> ip a , look for device that has your public ip)
ni=<ens192>

iptables -D FORWARD -j ACCEPT
ip6tables -D FORWARD -j ACCEPT

# SET FORWARDED PORTS (values inside "", separated by spaces)
TCP_PORTS="25 80 443 2222"

for p in $TCP_PORTS
do
    iptables -t nat -D PREROUTING -i $ni -p tcp --dport $p -j DNAT --to-destination 10.27.27.2:$p
    ip6tables -t nat -D PREROUTING -i $ni -p tcp --dport $p -j DNAT --to-destination fd07:dead:feed::2:$p
done

UDP_PORTS="19132"

for p in $UDP_PORTS
do
    iptables -t nat -D PREROUTING -i $ni -p udp --dport $p -j DNAT --to-destination 10.27.27.2:$p
    ip6tables -t nat -D PREROUTING -i $ni -p udp --dport $p -j DNAT --to-destination fd07:dead:feed::2:$p
done

ICMP_FORWARD="false"

if [ $ICMP_FORWARD = "true" ]; then
    iptables -t nat -D PREROUTING -i $ni -p icmp -j DNAT --to-destination 10.27.27.2:$p
    ip6tables -t nat -D PREROUTING -i $ni -p icmp -j DNAT --to-destination fd07:dead:feed::2:$p
fi

iptables -t nat -D POSTROUTING -o $ni -j MASQUERADE
ip6tables -t nat -D POSTROUTING -o $ni -j MASQUERADE
