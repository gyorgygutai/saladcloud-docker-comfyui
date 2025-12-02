#!/bin/bash
set -e

echo "=== Starting provisioning ==="

echo "Installing ComfyUI Manager..."
mkdir -p /app/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git /app/custom_nodes/ComfyUI-Manager

echo "Downloading models..."
mkdir -p /app/models/diffusion_models

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/diffusion_models" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_fp8_e4m3fn.safetensors
https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors
"

echo "Downloading text encoders..."
mkdir -p /app/models/clip

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/clip" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors
"

echo "Downloading LoRAs..."
mkdir -p /app/models/loras

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/loras" <<< "
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V2.0.safetensors
https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors
https://huggingface.co/Daverrrr75/Qwen-Lora-Lenovo-Ultrareal/resolve/main/lenovo.safetensors
https://huggingface.co/Instara/1girl-qwen-image/resolve/main/1GIRL_QWEN_V2.safetensors
https://huggingface.co/starsfriday/Qwen-Image-NSFW/resolve/main/qwen_image_nsfw.safetensors
"

echo "Downloading VAE..."
mkdir -p /app/models/vae

xargs -n 1 -P 3 wget --content-disposition --trust-server-names --no-verbose --header="Authorization: Bearer ${TOKEN_HUGGINGFACE_API}" -P "/app/models/vae" <<< "
https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors
"

echo "=== Provisioning complete ==="
