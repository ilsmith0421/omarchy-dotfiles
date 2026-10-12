# Omarchy Dotfiles

Personal Omarchy workstation setup for **VS Code, Zen Browser, ChatGPT, Steam, Discord, Blender, Unity Hub**, development, media, and server access.

This repository is **public**. No passwords, API keys, SSH private keys, usernames for servers, or real private host addresses belong in it. Keep those in your own machine's private configuration files.

## Before replacing Windows

Back up school files, source code, media, game saves, browser data, recovery keys, and SSH keys to external storage. Verify your backup. Test Unity and any Windows-only engineering software or games with anticheat before deleting Windows.

## Install on Omarchy

```bash
git clone https://github.com/ilsmith0421/omarchy-dotfiles.git ~/dotfiles/omarchy-dotfiles
cd ~/dotfiles/omarchy-dotfiles
bash install.sh
bash apps.sh
bash check.sh
```

Open a new terminal to activate aliases. Keep the cloned folder in place since launchers and shell configuration reference it.

`install.sh` creates project folders, safely backs up replaced launchers or shell configuration, and links the commands in `bin/` into `~/.local/bin`. It does **not** run sudo, install packages, configure a network service, or change your bootloader.

`apps.sh` presents **optional** packages. Use Omarchy's built-in installer for Steam and Zen. Unity Hub installation follows the official Linux guidance and may require extra work because Arch is not an officially supported Unity distribution. Fusion 360 is intentionally excluded.

## Shortcuts

* `chatgpt`: opens ChatGPT in the default browser (set Zen as default using Omarchy)
* `projects`, `goodcircledev`, `emb`, `school`, `unityprojects`, `mediafiles`: open project directories
* `project-open MyApp`: create and open a project with VS Code
* `gs`, `gl`: short Git status and recent commit log
* `updatepc`: Omarchy update
* `ian-backup`: archive selected desktop preferences only
* `goodcircle`: SSH using a local SSH alias you configure
* `server-ping`: ping the hostname in your local `GOODCIRCLE_SERVER_HOST` setting

To configure server access, copy the sample in `config/ssh-config.example` to your private `~/.ssh/config` and replace placeholders. Use `chmod 600 ~/.ssh/config`. Never publish the filled-in file. Set `GOODCIRCLE_SERVER_HOST` in your own shell environment, not in this repository.

## Desktop and NVIDIA

Use Omarchy's built-in dark themes and retain its default Hyprland bindings initially; see `docs/shortcuts.md`.

On an NVIDIA system, verify hardware and existing installed drivers with:

```bash
lspci | grep -i nvidia
nvidia-smi
```

Do not force-install additional graphics drivers until you identify your GPU model and see what Omarchy already configured.

## Remote access and backup

Remote desktop is **not enabled automatically**. Configure an authenticated private VPN and remote desktop service only when needed. Do not expose unauthenticated VNC to the public internet.

`ian-backup` only saves a few settings. It does not include project files, saved games, credentials, or a full system image.

To update your files in future:

```bash
cd ~/dotfiles/omarchy-dotfiles
git pull
```

Inspect changes before running any revised scripts.
