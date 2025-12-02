FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    libgl1 \
    libglib2.0-0 \
    libgomp1 \
    gcc \
    g++ \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir xformers torchvision torchaudio

COPY entrypoint.sh /entrypoint.sh
COPY provisioning.sh /provisioning.sh
RUN chmod +x /entrypoint.sh /provisioning.sh

EXPOSE 7860

ENTRYPOINT ["/entrypoint.sh"]
