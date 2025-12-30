#!/bin/bash

# Extended Smart Device Detection with Port Scanning
# Includes ping sweep results and service detection

echo "=== Extended Smart Device Detection Report ==="
echo "Timestamp: $(date)"
echo "Network: 192.168.1.0/24"
echo

# Function to lookup MAC vendor (extended)
lookup_mac_vendor() {
    local mac=$1
    local oui=$(echo "$mac" | tr -d ':' | cut -c1-6 | tr '[:lower:]' '[:upper:]')

    case "$oui" in
        "D8B370") echo "ASUS/TP-Link Router" ;;
        "A4CF99") echo "Amazon/Echo/Kindle" ;;
        "446132") echo "Netgear/Smart device" ;;
        "A8BB50") echo "Ubiquiti/UniFi" ;;
        "D83ADD") echo "Raspberry Pi/IoT" ;;
        "E0BB9E") echo "Raspberry Pi/IoT" ;;
        "808AF7") echo "Apple/iPhone/iPad" ;;
        "885721") echo "Apple/iPhone/iPad" ;;
        "9ABD48") echo "Apple/iPhone/iPad" ;;
        "8C26AA") echo "Cisco/Linksys" ;;
        "808ABD") echo "Samsung/Smart TV" ;;
        "B4FA48") echo "Apple/iPhone/iPad" ;;
        "805B65") echo "Apple/iPhone/iPad" ;;
        "48A6B8") echo "Netatmo/Weather" ;;
        "9E9B54") echo "Google/Nest" ;;
        "DA91D1") echo "Xiaomi/Smart home" ;;
        "017888") echo "Netgear/Router" ;;
        "5478C9") echo "Espressif/ESP32" ;;
        "48CA43") echo "Netatmo/Weather" ;;
        "8060B7") echo "Apple/iPhone/iPad" ;;
        "6C4A85") echo "LG/Samsung/TV" ;;
        "46D09A") echo "Amazon/Echo" ;;
        "30EDA0") echo "Raspberry Pi/ESP" ;;
        "765F83") echo "Apple/iPhone/iPad" ;;
        "000678") echo "Unknown/IoT device" ;;
        *) echo "Unknown vendor (OUI: $oui)" ;;
    esac
}

# Function to identify device type
identify_device_type() {
    local ip=$1
    local mac=$2
    local vendor=$3

    if [[ "$ip" == "192.168.1.1" ]]; then
        echo "Gateway/Router"
        return
    fi

    if [[ "$ip" == "192.168.1.96" ]]; then
        echo "Your Mac (host)"
        return
    fi

    case "$vendor" in
        *"Amazon"*) echo "Smart speaker/Echo" ;;
        *"Apple"*) echo "iPhone/iPad/Mac" ;;
        *"Samsung"*) echo "Smartphone/Smart TV" ;;
        *"Xiaomi"*) echo "Smart home/Phone" ;;
        *"Google/Nest"*) echo "Nest thermostat/Camera" ;;
        *"Netatmo"*) echo "Weather station" ;;
        *"Raspberry Pi"*) echo "IoT hub/Single-board" ;;
        *"Espressif"*) echo "ESP32/IoT device" ;;
        *"Netgear"*) echo "Router/Network device" ;;
        *"Ubiquiti"*) echo "Access point/Network" ;;
        *"LG"*) echo "Smart TV/Device" ;;
        *"Cisco"*) echo "Network switch/Router" ;;
        *"Unknown/IoT"*) echo "IoT device/Unknown" ;;
        *) echo "Unknown device" ;;
    esac
}

# Function to check common IoT ports
check_iot_ports() {
    local ip=$1
    local ports=(80 443 8080 8443 1883 502 5683 8081 8883 8123)
    local open_ports=()

    for port in "${ports[@]}"; do
        if timeout 2 bash -c "</dev/tcp/$ip/$port" 2>/dev/null; then
            open_ports+=("$port")
        fi
    done

    echo "${open_ports[@]}"
}

echo "=== Complete Device Inventory ==="
echo "IP        MAC                 Vendor                 Type                    Open Ports"
echo "--------  ------------------  ---------------------  ----------------------  ----------"

# Get all devices from ARP cache
arp -a | grep -E "192\.168\.1\." | sort -t . -k4 -n | while read -r line; do
    ip=$(echo "$line" | grep -oE "192\.168\.1\.[0-9]+")
    mac=$(echo "$line" | grep -oE "([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}" | head -1)

    if [[ -n "$ip" && -n "$mac" ]]; then
        vendor=$(lookup_mac_vendor "$mac")
        device_type=$(identify_device_type "$ip" "$mac" "$vendor")

        # Check for open ports (only for non-Apple devices to avoid privacy issues)
        if [[ "$vendor" != *"Apple"* && "$ip" != "192.168.1.96" ]]; then
            open_ports=$(check_iot_ports "$ip")
        else
            open_ports="N/A"
        fi

        printf "%-8s  %-18s  %-21s  %-22s  %s\n" "$ip" "$mac" "$vendor" "$device_type" "$open_ports"
    fi
done

echo
echo "=== Smart Device Summary ==="
echo "Total devices discovered: $(arp -a | grep -cE "192\.168\.1\.[0-9]+")"

echo
echo "=== Identified Smart Devices ==="
echo "Smart devices found:"
arp -a | grep -E "192\.168\.1\." | while read -r line; do
    ip=$(echo "$line" | grep -oE "192\.168\.1\.[0-9]+")
    mac=$(echo "$line" | grep -oE "([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}" | head -1)

    if [[ -n "$ip" && -n "$mac" ]]; then
        vendor=$(lookup_mac_vendor "$mac")
        device_type=$(identify_device_type "$ip" "$mac" "$vendor")

        # Flag smart devices
        case "$device_type" in
            *"Smart"*|*"IoT"*|*"Nest"*|*"Echo"*|*"Weather"*|*"ESP32"*|*"Raspberry"*)
                echo "  • $ip - $device_type ($vendor)"
                ;;
        esac
    fi
done

echo
echo "=== Network Security Recommendations ==="
echo "1. Change default passwords on IoT devices"
echo "2. Isolate smart devices on separate VLAN if possible"
echo "3. Keep firmware updated on all smart devices"
echo "4. Monitor network traffic for unusual patterns"
echo "5. Disable unused services and ports on IoT devices"

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
