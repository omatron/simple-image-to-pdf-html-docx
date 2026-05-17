#!/bin/bash
cd "$(dirname "$0")"

if [ ! -d ".venv" ]; then
    echo "❌ Not installed yet. Run installer.sh first."
    exit 1
fi

.venv/bin/streamlit run app.py
