#!/usr/bin/env bash
# Azure CLI Setup Script
# Installs Azure CLI (az) and verifies the installation
# Usage: bash setup-azure-cli.sh

set -e

echo "=== Azure CLI Installation Script ==="
echo ""

# Check if already installed
if command -v az &>/dev/null; then
    echo "Azure CLI is already installed:"
    az --version | head -3
    exit 0
fi

echo "Installing Azure CLI via pip..."
pip install azure-cli --ignore-installed argcomplete

echo ""
echo "=== Verifying Installation ==="
az --version | head -3

echo ""
echo "Azure CLI installed successfully!"
echo ""
echo "Next steps:"
echo "  az login                         # Interactive browser login"
echo "  az login --use-device-code       # Device code login (for headless environments)"
echo "  az account list                  # List subscriptions"
echo "  az account set --subscription <id>  # Set active subscription"
