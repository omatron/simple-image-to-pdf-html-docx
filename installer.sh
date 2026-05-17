#!/bin/bash
cd "$(dirname "$0")"

echo ""
echo "==============================="
echo "  Image Organizer — Installer  "
echo "==============================="
echo ""

# Check Python 3
if ! command -v python3 &>/dev/null; then
    echo "❌ Python 3 not found."
    echo "   Install it from https://www.python.org/downloads/ and re-run this installer."
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
echo "✅ Python $PYTHON_VERSION found"

# Create virtual environment
echo "→  Creating virtual environment..."
python3 -m venv .venv

# Install dependencies
echo "→  Installing dependencies (this may take a minute)..."
.venv/bin/pip install -q --upgrade pip
.venv/bin/pip install -q -r requirements.txt

# Make the launcher executable
chmod +x run.command

# Create Desktop shortcut
SHORTCUT="$HOME/Desktop/Image Organizer.command"
ln -sf "$(pwd)/run.command" "$SHORTCUT"
chmod +x "$SHORTCUT"

echo ""
echo "==============================="
echo "  ✅ Installation complete!"
echo ""
echo "  A shortcut was added to your Desktop."
echo "  Double-click 'Image Organizer' to launch."
echo "==============================="
echo ""
