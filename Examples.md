# wir3G Usage Examples

## Quick Start Examples

### 1. Connect to OpenVPN Server

```bash
$ sudo ./run

# Select option 1 (OpenVPN Connection)
# Enter config path: /home/user/my-vpn.ovpn
# If prompted, enter username and password
# Connection established!
```

### 2. Connect to WireGuard

```bash
$ sudo ./run

# Select option 2 (WireGuard Connection)
# Enter config path: /home/user/wg0.conf
# Connection established!
```

### 3. Use VPNGate Free Servers

```bash
$ sudo ./run

# Select option 3 (VPNGate)
# Browse list:
  1) Japan              219.100.37.49   JP  157 Mbps  Sessions: 9
  2) United States      128.211.249.220 US   48 Mbps  Sessions: 15
  3) Germany            78.47.150.42    DE   92 Mbps  Sessions: 23
  ...

# Select server: 1
# Config downloaded and connection established!
```

## Advanced Examples

### Building a WireGuard Config

```bash
$ sudo ./run

# Select option 6 (Build Config)
# Select option 1 (WireGuard Config)

WireGuard Config Builder:
Private Key: <your-private-key>
Address (e.g., 10.0.0.2/24): 10.8.0.2/24
DNS (e.g., 1.1.1.1): 1.1.1.1
Peer Public Key: <peer-public-key>
Endpoint (e.g., vpn.server.com:51820): vpn.example.com:51820
Allowed IPs (default: 0.0.0.0/0): 0.0.0.0/0

Config saved: /tmp/wir3g_1234567890.conf
Connect now? [y/N]: y
```

### Building an OpenVPN Config

```bash
$ sudo ./run

# Select option 6 (Build Config)
# Select option 2 (OpenVPN Config)

OpenVPN Config Builder:
Remote server (e.g., vpn.server.com): vpn.example.com
Port (default: 1194): 1194
Protocol [udp/tcp] (default: udp): udp

Config saved: /tmp/wir3g_1234567890.ovpn
Note: You'll need to add CA cert and keys manually
```

### Checking Connection Status

```bash
$ sudo ./run

# Select option 5 (Connection Status)

┌─────────────────────────────────────┐
│         VPN Status Check            │
└─────────────────────────────────────┘

  ● OpenVPN: Running
  ○ WireGuard: Not running

  ◆ Public IP: 147.135.15.16
```

### Disconnecting VPN

```bash
$ sudo ./run

# Select option 4 (Disconnect VPN)

[◆] Disconnecting VPN...
  ● OpenVPN stopped

[✓] All VPN connections closed
```

## Session Persistence Examples

### Auto-Reconnect Scenario

```bash
$ sudo ./run

[◆] Checking dependencies...
[✓] All dependencies present
[?] Last session: openvpn (2 hours ago)
Reconnect? [y/N]: y

[◆] Reconnecting via OpenVPN...
[◆] Using saved credentials for: vpnbook
[◆] Waiting for connection...
[✓] Connected
[✓] Public IP: 147.135.15.16
```

### Active Session Detection

```bash
$ sudo ./run

[◆] Checking dependencies...
[✓] All dependencies present

┌─────────────────────────────────────┐
│  Active VPN Session Detected        │
└─────────────────────────────────────┘
  ● OpenVPN: Running
  ◆ Public IP: 147.135.15.16

# Menu appears normally
# No reconnect prompt needed
```

## Installation Examples

### System-Wide Installation

```bash
$ sudo ./run

# Select option 7 (Install System-Wide)

┌─────────────────────────────────────┐
│      System Installation            │
└─────────────────────────────────────┘

[!] This will install wir3G to /usr/local/bin/
Continue? [y/N]: y

[✓] Installed to /usr/local/bin/wir3G
[✓] You can now run: sudo wir3G

# Now use from anywhere:
$ sudo wir3G
```

### Quick Install Script

```bash
# Using the installer
$ sudo ./install.sh

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃        wir3G Installer             ┃
┃        oxbv1 | 0xb0rn3             ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

[◆] Installing wir3G to /usr/local/bin...
[✓] Installation complete!

Usage: sudo wir3G
```

## VPNGate Server Selection Tips

### Fastest Servers
Servers are sorted by speed. Pick from the top of the list for best performance.

### Low Latency
Choose servers geographically closer to you for lower ping times.

### Privacy Considerations
- VPNGate is free but community-run
- Review the logging policy
- Academic use - not for high-security scenarios

### Example Server List

```
Available VPNGate Servers

  1) Japan              219.100.37.112  JP  772 Mbps  Sessions: 73
  2) United States      128.211.249.220 US  157 Mbps  Sessions: 4
  3) Korea Republic of  121.162.146.73  KR  142 Mbps  Sessions: 12
  4) Germany            78.47.150.42    DE  128 Mbps  Sessions: 23
  5) Thailand           1.10.187.208    TH  115 Mbps  Sessions: 8
  ...

Select server (1-20) or 0 to cancel: 1
```

## Troubleshooting Examples

### Connection Timeout

```bash
[◆] Connecting via OpenVPN...
[◆] Waiting for connection...
[!] Connection timeout
[!] Check: cat /tmp/ovpn_12345.log

# Check the log
$ cat /tmp/ovpn_12345.log
# Look for errors
```

### Authentication Failed

```bash
[◆] Connecting via OpenVPN...
Username: wronguser
Password: 
[◆] Waiting for connection...
[!] Authentication failed

# Solution: Re-run and enter correct credentials
# wir3G will save them after successful connection
```

### Config File Not Found

```bash
Select: 1
Config path: /nonexistent/file.ovpn
[!] Config file not found

# Solution: Provide correct absolute path
# Example: /home/user/Downloads/vpn.ovpn
```

## Credential Management

### First Connection (Saves Credentials)

```bash
Config path: /home/user/vpn.ovpn
[◆] Waiting for connection...

Username: myuser
Password: ********
[◆] Waiting for connection...
[✓] Connected
[✓] Public IP: 123.45.67.89

# Credentials saved to /etc/wir3G/config.json
```

### Second Connection (Uses Saved Credentials)

```bash
Config path: /home/user/vpn.ovpn
[◆] Using saved credentials for: myuser
[◆] Connecting via OpenVPN...
[✓] Connected
[✓] Public IP: 123.45.67.89

# No manual entry needed!
```

## Multiple Server Management

### Switching Between Servers

```bash
# Connect to Server A
$ sudo ./run
Select: 1
Config path: /home/user/server-a.ovpn
[✓] Connected

# Later, switch to Server B
$ sudo ./run
Select: 1  # Will auto-disconnect Server A
Config path: /home/user/server-b.ovpn
[✓] Connected
```

### Using Different Protocols

```bash
# Morning: Use OpenVPN for work
$ sudo ./run
Select: 1
Config path: /home/user/work-vpn.ovpn
[✓] Connected

# Evening: Switch to WireGuard for gaming
$ sudo ./run
Select: 4  # Disconnect
Select: 2  # WireGuard
Config path: /home/user/gaming-wg.conf
[✓] Connected
```

## Automation Examples

### Cron Job for Auto-Connect

```bash
# Not recommended for security, but possible
# Better: use systemd service

# Create a wrapper script
$ cat > /usr/local/bin/vpn-autoconnect.sh << 'EOF'
#!/bin/bash
echo "y" | sudo wir3G  # Auto-reconnect
EOF

$ chmod +x /usr/local/bin/vpn-autoconnect.sh
```

### Check Status from Other Scripts

```bash
#!/bin/bash

# Check if VPN is active
if pgrep -x openvpn > /dev/null; then
    echo "VPN Active"
    # Do something
else
    echo "VPN Inactive"
    # Maybe reconnect
fi
```

---

For more information, see the [README.md](README.md)
