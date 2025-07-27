#!/bin/bash

sudo sysctl -w net.ipv4.ip_default_ttl=65
sudo sysctl -w net.ipv6.conf.all.hop_limit=65
