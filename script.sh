#!/bin/sh
export DOMAIN="$(uapi DomainInfo domains_data | grep -w "domain")"
export DOMAIN="${DOMAIN#*: }"
