#!/bin/sh

sed -i "s/PANEL_URL/$PANEL_URL/" /etc/XrayR/config.yml
sed -i "s/PANEL_SECRET/$PANEL_SECRET/" /etc/XrayR/config.yml
sed -i "s/NODE_ID/$NODE_ID/" /etc/XrayR/config.yml
sed -i "s/ENABLE_VLESS/$ENABLE_VLESS/" /etc/XrayR/config.yml

sed -i "s/OUTBOUND_ADDRESS/$OUTBOUND_ADDRESS/" /etc/XrayR/custom_outbound.json
sed -i "s/OUTBOUND_PORT/$OUTBOUND_PORT/" /etc/XrayR/custom_outbound.json
sed -i "s/OUTBOUND_ID/$OUTBOUND_ID/" /etc/XrayR/custom_outbound.json
sed -i "s/OUTBOUND_HOST/$OUTBOUND_HOST/" /etc/XrayR/custom_outbound.json
sed -i "s/OUTBOUND_PATH/$OUTBOUND_PATH/" /etc/XrayR/custom_outbound.json
cd /etc/XrayR/
XrayR --config /etc/XrayR/config.yml