cask "synctray-beta@0.47.1-beta.35.1" do
  version "0.47.1-beta.35.1"
  sha256 "fffe2db34d8f04d06f74414c00d31cb1fc339d47ec5e1becd9d9871bff9b175e"

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
