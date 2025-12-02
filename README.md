# ComfyUI for SaladCloud

ComfyUI Docker image configured for SaladCloud with IPv6 support.

## Build

```bash
make build-local
```

## Test Locally

```bash
make test
```

## Push to Registry

```bash
make push
```

## SaladCloud Deployment

The container will:
- Listen on IPv6 `[::]` for SaladCloud compatibility
- Use port from `$PORT` environment variable (default: 7860)
- Run provisioning script on startup to download models

## Environment Variables

- `PORT` - Port to bind to (default: 7860)
- `HF_TOKEN` - HuggingFace API token for model downloads
