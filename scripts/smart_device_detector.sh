#!/bin/bash

# Smart Device Detection Script
# Analyzes ARP cache and performs network discovery

echo "=== Smart Device Detection on 192.168.1.0/24 ==="
echo "Timestamp: $(date)"
echo

# Function to lookup MAC vendor
lookup_mac_vendor() {
    local mac=$1
    local oui=$(echo "$mac" | tr -d ':' | cut -c1-6 | tr '[:lower:]' '[:upper:]')

    # Known IoT/smart device MAC prefixes
    case "$oui" in
        "D8B370") echo "Router/Gateway (likely ASUS/TP-Link)" ;;
        "A4CF99") echo "Amazon/Kindle/Echo device" ;;
        "446132") echo "Netgear device" ;;
        "A8BB50") echo "Ubiquiti/UniFi device" ;;
        "D83ADD") echo "Raspberry Pi/Single-board computer" ;;
        "885721") echo "Apple device (iPhone/iPad/Mac)" ;;
        "9ABD48") echo "Apple device (iPhone/iPad/Mac)" ;;
        "8C26AA") echo "Cisco/Linksys device" ;;
        "808ABD") echo "Samsung device" ;;
        "B4FA48") echo "Apple device" ;;
        "805B65") echo "Apple device" ;;
        "48A6B8") echo "Netatmo/Smart home device" ;;
        "9E9B54") echo "Google/Nest device" ;;
        "DA91D1") echo "Xiaomi/Smart home device" ;;
        "017888") echo "Netgear device" ;;
        "5478C9") echo "Espressif/ESP32 device" ;;
        "48CA43") echo "Netatmo/Weather station" ;;
        "8060B7") echo "Apple device" ;;
        "6C4A85") echo "LG/Samsung device" ;;
        "46D09A") echo "Amazon device" ;;
        "30EDA0") echo "Raspberry Pi/ESP device" ;;
        "765F83") echo "Apple device" ;;
        *) echo "Unknown vendor (OUI: $oui)" ;;
    esac
}

# Function to identify device type based on IP and MAC
identify_device_type() {
    local ip=$1
    local mac=$2
    local vendor=$3

    # Gateway identification
    if [[ "$ip" == "192.168.1.1" ]]; then
        echo "Gateway/Router"
        return
    fi

    # Your device
    if [[ "$ip" == "192.168.1.96" ]]; then
        echo "Your Mac (host)"
        return
    fi

    # Smart device identification based on vendor
    case "$vendor" in
        *"Amazon"*) echo "Smart speaker/Echo/Kindle" ;;
        *"Apple"*) echo "iPhone/iPad/Mac computer" ;;
        *"Samsung"*) echo "Smartphone/TV/Tablet" ;;
        *"Xiaomi"*) echo "Smart home device/Phone" ;;
        *"Google/Nest"*) echo "Nest thermostat/Camera/Hub" ;;
        *"Netatmo"*) echo "Weather station/Smart home" ;;
        *"Raspberry Pi"*) echo "Single-board computer/IoT hub" ;;
        *"Espressif"*) echo "ESP32/Arduino/IoT device" ;;
        *"Netgear"*) echo "Router/Network switch" ;;
        *"Ubiquiti"*) echo "Access point/Network device" ;;
        *"LG"*) echo "Smart TV/Device" ;;
        *) echo "Unknown device" ;;
    esac
}

echo "=== Current ARP Cache Analysis ==="
echo "IP Address        MAC Address         Vendor                    Device Type"
echo "----------------  ------------------  ------------------------  ------------------"

# Parse ARP cache and identify devices
arp -a | grep -E "192\.168\.1\." | while read -r line; do
    ip=$(echo "$line" | grep -oE "192\.168\.1\.[0-9]+")
    mac=$(echo "$line" | grep -oE "([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}" | head -1)

    if [[ -n "$ip" && -n "$mac" ]]; then
        vendor=$(lookup_mac_vendor "$mac")
        device_type=$(identify_device_type "$ip" "$mac" "$vendor")

        printf "%-16s  %-18s  %-24s  %s\n" "$ip" "$mac" "$vendor" "$device_type"
    fi
done

echo
echo "=== Summary ==="
total_devices=$(arp -a | grep -cE "192\.168\.1\.[0-9]+")
echo "Total devices discovered: $total_devices"

# Count device types
echo
echo "=== Device Categories ==="
arp -a | grep -E "192\.168\.1\." | while read -r line; do
    ip=$(echo "$line" | grep -oE "192\.168\.1\.[0-9]+")
    mac=$(echo "$line" | grep -oE "([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}" | head -1)

    if [[ -n "$ip" && -n "$mac" ]]; then
        vendor=$(lookup_mac_vendor "$mac")
        device_type=$(identify_device_type "$ip" "$mac" "$vendor")
        echo "$device_type"
    fi
done | sort | uniq -c | sort -nr

echo
echo "=== Next Steps ==="
echo "1. Run ping sweep to discover additional devices"
echo "2. Scan common IoT ports (8080, 8443, 1883, 502, 5683)"
echo "3. Check for mDNS/Bonjour services"
echo "4. Analyze traffic patterns for device identification"
