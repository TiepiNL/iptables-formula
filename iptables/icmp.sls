# -*- coding: utf-8 -*-
# vim: ft=yaml
---

{%- from "iptables/map.jinja" import firewall with context %}

{%- if firewall.get('allow_icmp_in', False) %}
# allow all ICMP ipv4 traffic in
iptables-allow-all-icmp-in:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - comment
    - comment: "Allow inbound PING"
    - proto: icmp
    - save: True

{%-   if firewall.get('ipv6', False) %}
# allow all ICMP ipv6 traffic in
iptables-allow-all-icmp-in-ipv6:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - comment
    - comment: "Allow inbound PING"
    - proto: icmpv6
    - family: ipv6
    - save: True
{%-   endif %}
{%- endif %}
