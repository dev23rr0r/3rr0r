rm -rf /overlay/upper/etc/config/network
cat > /overlay/upper/etc/config/network <<-NETTY1
config interface 'loopback'
        option ifname 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd0d:1c3a:2ae7::/48'

config interface 'lan'
        option type 'bridge'
        option ifname 'eth0 eth1 eth2 eth3 eth4'
        option proto 'static'
        option ipaddr '192.168.1.1'
        option netmask '255.255.255.0'
        option dns '1.1.1.1 2606:4700:4700::1111'
        option multicast_querier '0'
        option igmp_snooping '0'
        option ip6assign '60'
        option force_link '1'

config interface 'wan'
        option ifname 'wwan0_1'
        option proto 'dhcp'
        option metric '1'

config interface 'wan6'
        option ifname 'wwan0_1'
        option proto 'dhcpv6'

config interface 'wan1'
        option proto 'mbim'
        option device '/dev/cdc-wdm0'
        option metric '10'
        option currmodem '1'

config interface 'wgdigicf'
        option proto 'wireguard'
        option private_key 'yPBtsGVvgTYe5Gm+8KtsJFXE++PfVv+NhtJKbsvTE1A='
        list addresses '172.16.0.2/32'
        option mtu '1420'

config wireguard_wgdigicf
        option public_key 'bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo='
        list allowed_ips '0.0.0.0/0'
        list allowed_ips '::/0'
        option route_allowed_ips '1'
        option endpoint_host 'engage.cloudflareclient.com'
        option endpoint_port '2408'
        option persistent_keepalive '0'
NETTY1

cat > /etc/config/network <<-NETTY
config interface 'loopback'
        option ifname 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd0d:1c3a:2ae7::/48'

config interface 'lan'
        option type 'bridge'
        option ifname 'eth0 eth1 eth2 eth3 eth4'
        option proto 'static'
        option ipaddr '192.168.1.1'
        option netmask '255.255.255.0'
        option dns '1.1.1.1 2606:4700:4700::1111'
        option multicast_querier '0'
        option igmp_snooping '0'
        option ip6assign '60'
        option force_link '1'

config interface 'wan'
        option ifname 'wwan0_1'
        option proto 'dhcp'
        option metric '1'

config interface 'wan6'
        option ifname 'wwan0_1'
        option proto 'dhcpv6'

config interface 'wan1'
        option proto 'mbim'
        option device '/dev/cdc-wdm0'
        option metric '10'
        option currmodem '1'

config interface 'wgdigicf'
        option proto 'wireguard'
        option private_key 'yPBtsGVvgTYe5Gm+8KtsJFXE++PfVv+NhtJKbsvTE1A='
        list addresses '172.16.0.2/32'
        option mtu '1420'

config wireguard_wgdigicf
        option public_key 'bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo='
        list allowed_ips '0.0.0.0/0'
        list allowed_ips '::/0'
        option route_allowed_ips '1'
        option endpoint_host 'engage.cloudflareclient.com'
        option endpoint_port '2408'
        option persistent_keepalive '0'
NETTY

rm -rf /root/*
