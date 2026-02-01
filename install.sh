#!/usr/bin/env bash

# wir3G Quick Installer
# https://github.com/0xb0rn3/wir3G

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃                                    ┃"
echo "┃        wir3G Installer             ┃"
echo "┃        oxbv1 | 0xb0rn3             ┃"
echo "┃                                    ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo ""

# Check root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}[!]${NC} Run with sudo: sudo ./install.sh"
    exit 1
fi

echo -e "${CYAN}[◆]${NC} Installing wir3G to /usr/local/bin..."

# Check if run script exists
if [[ ! -f "./run" ]]; then
    echo -e "${RED}[!]${NC} run script not found in current directory"
    exit 1
fi

# Copy to system
cp ./run /usr/local/bin/wir3G
chmod +x /usr/local/bin/wir3G

echo -e "${GREEN}[✓]${NC} Installation complete!"
echo ""
echo -e "Usage: ${CYAN}sudo wir3G${NC}"
echo ""
