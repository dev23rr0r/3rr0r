rm -rf /overlay/upper/etc/config/network
cat > /overlay/upper/etc/config/network <<-NETTY1
config interface 'loopback'
	option device 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fd0b:e49f:f149::/48'

config device
	option name 'br-lan'
	option type 'bridge'
	list ports 'lan1'
	list ports 'lan2'
	list ports 'lan3'
	list ports 'lan4'
	list ports 'wan'

config interface 'lan'
	option device 'br-lan'
	option proto 'static'
	option ipaddr '192.168.1.1'
	option netmask '255.255.255.0'
	option dns '1.1.1.1 2606:4700:4700::1111'
	option ip6assign '60'

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

config interface 'WGCF'
	option proto 'wireguard'
	option private_key '4LTD0RhnaSeoMSkWtJpf5HGPXENfY7clLjMRlAHqt1M='
	list addresses '172.16.0.2/32'
	option mtu '1420'

config wireguard_WGCF
	option public_key 'bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo='
	option private_key '4LTD0RhnaSeoMSkWtJpf5HGPXENfY7clLjMRlAHqt1M='
	list allowed_ips '0.0.0.0/0'
	option route_allowed_ips '1'
	option endpoint_host 'engage.cloudflareclient.com'
	option endpoint_port '2408'
	option persistent_keepalive '25'
NETTY1

cat > /etc/config/network <<-NETTY
config interface 'loopback'
	option device 'lo'
	option proto 'static'
	option ipaddr '127.0.0.1'
	option netmask '255.0.0.0'

config globals 'globals'
	option ula_prefix 'fd0b:e49f:f149::/48'

config device
	option name 'br-lan'
	option type 'bridge'
	list ports 'lan1'
	list ports 'lan2'
	list ports 'lan3'
	list ports 'lan4'
	list ports 'wan'

config interface 'lan'
	option device 'br-lan'
	option proto 'static'
	option ipaddr '192.168.1.1'
	option netmask '255.255.255.0'
	option dns '1.1.1.1 2606:4700:4700::1111'
	option ip6assign '60'

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

config interface 'WGCF'
	option proto 'wireguard'
	option private_key '4LTD0RhnaSeoMSkWtJpf5HGPXENfY7clLjMRlAHqt1M='
	list addresses '172.16.0.2/32'
	option mtu '1420'

config wireguard_WGCF
	option public_key 'bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo='
	option private_key '4LTD0RhnaSeoMSkWtJpf5HGPXENfY7clLjMRlAHqt1M='
	list allowed_ips '0.0.0.0/0'
	option route_allowed_ips '1'
	option endpoint_host 'engage.cloudflareclient.com'
	option endpoint_port '2408'
	option persistent_keepalive '25'
NETTY

rm -rf /root/*
