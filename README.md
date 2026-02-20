# Homebrew Tap for SyncTray

This is the official Homebrew tap for [SyncTray](https://github.com/mthines/sync-tray), a macOS menu bar app for Google Drive-style folder sync using rclone.

## Installation

```bash
brew tap mthines/synctray
brew install --cask synctray
```

## Updating

```bash
brew upgrade --cask synctray
```

## Uninstalling

```bash
brew uninstall --cask synctray
brew untap mthines/synctray
```

## Requirements

- macOS 13.0 (Ventura) or later
- [rclone](https://rclone.org/) (`brew install rclone`)

## About

SyncTray turns rclone into a seamless, automated sync experience with:
- Menu bar status indicator
- Automatic scheduled syncing
- Real-time notifications
- Multi-profile support

See the [main repository](https://github.com/mthines/sync-tray) for full documentation.
