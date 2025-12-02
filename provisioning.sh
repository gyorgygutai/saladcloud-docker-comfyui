#!/bin/bash
set -e

echo "=== Starting provisioning ==="

echo "Installing ComfyUI Manager..."
mkdir -p /app/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git /app/custom_nodes/ComfyUI-Manager

echo "Downloading models..."
mkdir -p /app/models/checkpoints

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/checkpoints" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_fp8_e4m3fn.safetensors
https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors
"

echo "Downloading text encoders..."
mkdir -p /app/models/clip

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/clip" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
"

echo "Downloading LoRAs..."
mkdir -p /app/models/loras

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/loras" <<< "
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V2.0.safetensors
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-8steps-V1.0.safetensors
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-8steps-V1.0-bf16.safetensors
"

echo "Downloading VAE..."
mkdir -p /app/models/vae

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/vae" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"

echo "=== Provisioning complete ==="
