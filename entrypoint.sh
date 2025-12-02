#!/bin/bash
set -e

echo "=== Running provisioning ==="
/provisioning.sh

if [ $? -ne 0 ]; then
    echo "ERROR: Provisioning failed!"
    exit 1
fi

echo "=== Provisioning complete! ==="
echo "=== Starting ComfyUI ==="

TARGET_PORT=${PORT:-7860}

python3 main.py --listen :: --port ${TARGET_PORT}
