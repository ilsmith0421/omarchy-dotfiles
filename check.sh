#!/usr/bin/env bash
set -euo pipefail
for c in git code python python3 gcc g++ cmake steam discord blender ffmpeg obs ssh git-lfs nvidia-smi; do
  if command -v "$c" >/dev/null 2>&1; then printf 'OK      %s\n' "$c"; else printf 'OPTIONAL/MISSING %s\n' "$c"; fi
done
echo 'Zen and Unity may use application launchers rather than commands.'
echo 'For NVIDIA: lspci | grep -i nvidia; nvidia-smi (if NVIDIA GPU and driver are present).'
echo 'SSH server alias: configure ~/.ssh/config using config/ssh-config.example'
