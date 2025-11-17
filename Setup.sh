#!/bin/bash
# setup.sh - VS Code setup script for repo

echo "Starting VS Code setup..."

# Check if 'code' CLI is available
if ! command -v code &> /dev/null
then
    echo "VS Code CLI ('code') not found. Please install it and make sure it's in your PATH."
    exit 1
fi

# Install extensions
echo "Installing VSCodeVim..."
code --install-extension vscodevim.vim

echo "Installing Dark Magic theme..."
code --install-extension DavidMorais.dark-magic-themes

# Copy settings.json from repo directory to VS Code config
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETTINGS_FILE="$REPO_DIR/settings.json"
VSCODE_CONFIG_DIR="$HOME/.config/Code/User"

echo "Copying settings.json to VS Code config..."
mkdir -p "$VSCODE_CONFIG_DIR"
cp "$SETTINGS_FILE" "$VSCODE_CONFIG_DIR/settings.json"

echo "Setup complete!"
