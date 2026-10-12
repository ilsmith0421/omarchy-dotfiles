#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.local/share/ian-omarchy-backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP" "$HOME/.local/bin" "$HOME/Projects"/{GoodCircle,Embedded,School,Unity,Web,Media} "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
for f in "$ROOT"/bin/*; do
  dest="$HOME/.local/bin/$(basename "$f")"
  [[ -L "$dest" && "$(readlink "$dest")" == "$f" ]] && continue
  if [[ -e "$dest" || -L "$dest" ]]; then mv "$dest" "$BACKUP/$(basename "$f")"; fi
  chmod +x "$f"
  ln -s "$f" "$dest"
done
for shellfile in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [[ -f "$shellfile" ]] && ! grep -Fq '# Ian Omarchy v2' "$shellfile"; then
    cp -a "$shellfile" "$BACKUP/$(basename "$shellfile")"
    printf '\n# Ian Omarchy v2\nsource "%s/config/aliases.sh"\n' "$ROOT" >> "$shellfile"
  fi
done
echo "Done. Open a new terminal, then run: bash apps.sh and bash check.sh"
echo "Prior settings backups, if any: $BACKUP"
