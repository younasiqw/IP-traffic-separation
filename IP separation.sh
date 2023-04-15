#!/bin/bash

# 提示使用者輸入入口和出口網路介面
read -p "請輸入入口網路介面名稱：" IN_IFACE
read -p "請輸入入口網路介面的 IP 位址：" IN_IP
read -p "請輸入出口網路介面名稱：" OUT_IFACE
read -p "請輸入出口網路介面的 IP 位址：" OUT_IP

# 啟用 IP 轉發功能
echo "1" > /proc/sys/net/ipv4/ip_forward

# 配置 iptables 規則
iptables -F
iptables -t nat -F
iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A FORWARD -i $IN_IFACE -o $OUT_IFACE -j ACCEPT
iptables -A FORWARD -i $OUT_IFACE -o $IN_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o $OUT_IFACE -j MASQUERADE

# 顯示完成資訊
echo "NAT 已成功配置，入口介面 $IN_IFACE 的 IP 位址為 $IN_IP，出口介面 $OUT_IFACE 的 IP 位址為 $OUT_IP"
