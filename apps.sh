#!/usr/bin/env bash
set -euo pipefail
command -v pacman >/dev/null || { echo 'Requires Omarchy/Arch'; exit 1; }
install_pkg() { sudo pacman -S --needed -- "$@"; }
while true; do
cat <<'MENU'
Optional application setup
1 Development tools
2 Visual Studio Code (AUR)
3 Discord
4 Blender, OBS, FFmpeg, Krita, GIMP
5 Steam instructions
6 Zen Browser instructions
7 Unity Hub instructions
8 Private remote access guidance
9 Terminal utilities
0 Exit
MENU
read -rp 'Choice: ' choice
case "$choice" in
1) install_pkg git python python-pip gcc cmake make nodejs npm git-lfs openssh ;;
2) if command -v yay >/dev/null; then yay -S --needed visual-studio-code-bin; else echo 'Use the Omarchy installer or review and install VS Code AUR packaging'; fi ;;
3) install_pkg discord ;;
4) install_pkg obs-studio ffmpeg krita gimp blender ;;
5) echo 'Use the Omarchy Install > Gaming > Steam menu for gaming dependencies.' ;;
6) echo 'Use the Omarchy Install > Browser > Zen menu; then set Zen as default browser.' ;;
7) echo 'Get official Unity Hub Linux AppImage: https://docs.unity.com/en-us/hub/install-hub-linux'; echo 'Arch is not officially supported by Unity.' ;;
8) echo 'Use an authenticated private VPN and explicitly configured remote desktop. Never expose unauthenticated VNC to the internet.' ;;
9) install_pkg bluetui wiremix btop ripgrep fd ;;
0) exit 0 ;;
*) echo 'Invalid choice' ;;
esac
done
