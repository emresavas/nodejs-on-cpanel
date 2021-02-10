#!/bin/sh
export DOMAIN="$(uapi DomainInfo domains_data | grep -w "domain")"
export DOMAIN="${DOMAIN#*: }"
echo $DOMAIN
uapi PassengerApps register_application name="nodejsapp" path="/nodejsapp" domain="$DOMAIN" deployment_mode="production" base_uri="/nodejsapp" enabled="1"
uapi PassengerApps ensure_deps type="npm" app_path="nodejsapp"
