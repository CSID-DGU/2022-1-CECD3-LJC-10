#!/bin/bash
killall -9 miniupnpd &>/dev/null
rm -f /var/run/miniupnpd.pid &>/dev/null
ifconfig br0 down &>/dev/null
brctl delbr br0 &>/dev/null
killall -9 wpa_supplicant &>/dev/null
killall -9 hostapd &>/dev/null
killall -9 udhcpc &>/dev/null
killall -9 autopid &>/dev/null
killall -9 udhcpd &>/dev/null
killall -9 dnrd &>/dev/null
echo 0 >/proc/sys/net/ipv4/ip_forward
iptables -t nat -F &>/dev/null
iptables -D INPUT -j ipf_chain &>/dev/null
iptables -F ipf_chain &>/dev/null
iptables -X ipf_chain &>/dev/null
iptables -F INPUT &>/dev/null
iptables -t mangle -D OUTPUT -j qos_mangle_chain &>/dev/null
iptables -t mangle -F qos_mangle_chain &>/dev/null
iptables -t mangle -X qos_mangle_chain &>/dev/null
