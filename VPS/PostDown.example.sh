# Replace all values surrounded by <> with your own. (remove the <>!)
# Set Network Interface Name (command line> ip a , look for device that has your public ip)
ni=<ens192>

iptables -D FORWARD -j ACCEPT
ip6tables -D FORWARD -j ACCEPT

# SET FORWARDED PORTS (values inside "", separated by spaces)
TCP_PORTS="25 80 443 2222"

for p in $TCP_PORTS
do
    iptables -t nat -D PREROUTING -i $ni -p tcp --dport $p -j DNAT --to-destination 10.7.0.2:$p
    ip6tables -t nat -D PREROUTING -i $ni -p tcp --dport $p -j DNAT --to-destination fd07:dead:feed::2:$p  
done

iptables -t nat -D POSTROUTING -o $ni -j SNAT --to-source <1.2.3.4 - VPS Public IPv4>
ip6tables -t nat -D POSTROUTING -o $ni -j SNAT --to-source <2700::1234 - VPS Public IPv6>