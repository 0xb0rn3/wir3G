# wir3G

<div align="center">

**VPN Connection Manager for OpenVPN & WireGuard**

*Fast • Lightweight • Feature-Rich*

[![Version](https://img.shields.io/badge/version-0.1-blue.svg)](https://github.com/0xb0rn3/wir3G)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

</div>

---

## 📋 Overview

wir3G is a terminal-based VPN management tool that simplifies connecting to OpenVPN and WireGuard servers. It features automatic credential management, session persistence, and integration with VPNGate's free VPN network.

## ✨ Features

### Core Functionality
- **Dual Protocol Support**: OpenVPN and WireGuard
- **Smart Authentication**: Auto-detects when credentials are needed
- **Session Persistence**: Saves credentials and reconnects automatically
- **VPNGate Integration**: Access 6000+ free VPN servers worldwide
- **Config Builder**: Create VPN configs interactively
- **System Installation**: Install as a global command

### Advanced Features
- Real-time connection monitoring
- Automatic dependency installation
- Session history with timestamps
- Public IP display
- Beautiful terminal UI with color-coded outputs

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/0xb0rn3/wir3G.git
cd wir3G

# Make executable
chmod +x run

# Run (requires sudo)
sudo ./run
```

### System-Wide Installation

```bash
# Install to /usr/local/bin
sudo ./run
# Select option 7 from menu

# Now run from anywhere
sudo wir3G
```

## 📖 Usage

### Basic Usage

```bash
sudo ./run
```

### Menu Options

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃            wir3G v0.1              ┃
┃        oxbv1 | 0xb0rn3             ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  1) OpenVPN Connection
  2) WireGuard Connection
  3) VPNGate (Free Servers)
  4) Disconnect VPN
  5) Connection Status
  6) Build Config
  7) Install System-Wide
  8) Exit
```

### Connecting to VPN

#### OpenVPN
1. Select option `1`
2. Enter path to your `.ovpn` config file
3. If authentication is required, enter username/password
4. Credentials are automatically saved for next time

#### WireGuard
1. Select option `2`
2. Enter path to your `.conf` config file
3. Connection is established automatically

#### VPNGate (Free Servers)
1. Select option `3`
2. Browse list of 20 fastest servers
3. Select server by number
4. Config is downloaded and connection established

### Session Management

wir3G automatically:
- Saves your last connection
- Detects active VPN sessions on startup
- Offers to reconnect to previous session within 24 hours
- Stores credentials securely in `/etc/wir3G/config.json`

### Example Session

```bash
$ sudo ./run

[◆] Checking dependencies...
[✓] All dependencies present

┌─────────────────────────────────────┐
│  Active VPN Session Detected        │
└─────────────────────────────────────┘
  ● OpenVPN: Running
  ◆ Public IP: 123.45.67.89

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃            wir3G v0.1              ┃
┃        oxbv1 | 0xb0rn3             ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

## 🔧 Configuration

### Config File Location
```
/etc/wir3G/config.json
```

### Config Structure
```json
{
  "sessions": [
    {
      "type": "openvpn",
      "config": "/path/to/config.ovpn",
      "username": "user",
      "password": "pass",
      "timestamp": 1234567890
    }
  ]
}
```

## 🌐 VPNGate Integration

VPNGate is an academic research project from the University of Tsukuba, Japan, providing free VPN relay servers.

### How It Works
1. wir3G fetches the live server list from VPNGate's API
2. Displays top 20 servers sorted by speed
3. Downloads and decodes OpenVPN config automatically
4. Establishes connection with one click

### API Endpoint
```
https://www.vpngate.net/api/iphone/
```

### Server Information Displayed
- **Country**: Server location
- **IP Address**: Server IP
- **Speed**: Connection speed in Mbps
- **Sessions**: Current active users

## 📦 Dependencies

wir3G automatically installs missing dependencies:

- `openvpn` - OpenVPN client
- `wireguard-tools` - WireGuard utilities
- `openresolv` - DNS management
- `curl` - HTTP requests
- `base64` - Config decoding

### Supported Package Managers
- APT (Debian/Ubuntu)
- DNF (Fedora/RHEL)
- Pacman (Arch Linux)

## 🛠️ Config Builder

Create VPN configs interactively:

### WireGuard Config Builder
```bash
Select option 6 → 1 (WireGuard Config)

Enter:
- Private Key
- Address (e.g., 10.0.0.2/24)
- DNS servers
- Peer Public Key
- Endpoint (server:port)
- Allowed IPs
```

### OpenVPN Config Builder
```bash
Select option 6 → 2 (OpenVPN Config)

Enter:
- Remote server
- Port (default: 1194)
- Protocol (UDP/TCP)

Note: Certificates must be added manually
```

## 🔒 Security

- Credentials stored with `600` permissions
- Temporary auth files securely deleted
- No plaintext passwords in logs
- Session data encrypted at rest

## 🐛 Troubleshooting

### Connection Fails
```bash
# Check logs
cat /tmp/ovpn_*.log

# Verify config
openvpn --config /path/to/config.ovpn
```

### Permission Denied
```bash
# Always run with sudo
sudo ./run
```

### Dependencies Not Installing
```bash
# Manual installation
sudo apt install openvpn wireguard-tools openresolv  # Debian/Ubuntu
sudo dnf install openvpn wireguard-tools openresolv  # Fedora
sudo pacman -S openvpn wireguard-tools openresolv    # Arch
```

### VPNGate Server List Empty
```bash
# Check internet connection
curl https://www.vpngate.net/api/iphone/

# Try different server
# VPNGate list updates frequently
```

## 📊 Status Indicators

- `[◆]` - Information
- `[✓]` - Success
- `[!]` - Warning/Error
- `●` - Active
- `○` - Inactive

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

### Development
```bash
# Clone repo
git clone https://github.com/0xb0rn3/wir3G.git

# Make changes
vim run

# Test
sudo ./run
```

## 📝 License

MIT License - see LICENSE file for details

## 👤 Author

**oxbv1 | 0xb0rn3**

- GitHub: [@0xb0rn3](https://github.com/0xb0rn3)
- Repository: [wir3G](https://github.com/0xb0rn3/wir3G)

## 🙏 Acknowledgments

- [VPNGate Project](https://www.vpngate.net) - University of Tsukuba
- [OpenVPN](https://openvpn.net/)
- [WireGuard](https://www.wireguard.com/)

## 📌 Version History

### v0.1 (Current)
- Initial release
- OpenVPN & WireGuard support
- VPNGate integration
- Session persistence
- Auto credential management
- Config builder
- System-wide installation

---

<div align="center">

**Made with ❤️ for the cybersecurity community**

[Report Bug](https://github.com/0xb0rn3/wir3G/issues) · [Request Feature](https://github.com/0xb0rn3/wir3G/issues)

</div>
