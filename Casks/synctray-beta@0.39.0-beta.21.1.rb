cask "synctray-beta@0.39.0-beta.21.1" do
  version "0.39.0-beta.21.1"
  sha256 "ea704fb544d3a31b59ade3c73a96746b613a4902a00e807c70feff8851fd4bf1"

  url "https://github.com/mthines/sync-tray/releases/download/v#{version}/SyncTray-v#{version}-macOS.zip"
  name "SyncTray"
  desc "Menu bar app for automatic two-way folder sync with 70+ cloud providers via rclone"
  homepage "https://github.com/mthines/sync-tray"

  depends_on macos: :ventura

  # Remove quarantine attribute (app is not notarized yet)
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/SyncTray.app"]
  end

  app "SyncTray.app"

  zap trash: [
    "~/.config/synctray",
    "~/.local/log/synctray-*",
    "~/Library/LaunchAgents/com.synctray.sync.*.plist",
  ]

  caveats <<~EOS
    SyncTray provides Google Drive-style automatic folder sync using rclone.
    Works with Dropbox, OneDrive, S3, SFTP, NAS, and 70+ other providers.

    Prerequisites:
      1. Install rclone:  brew install rclone
      2. Configure a remote:  rclone config

    Then launch SyncTray and create a sync profile in Settings.
  EOS
end
