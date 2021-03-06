cask "tuntap" do
  name "TunTap"
  desc "happyn.cn tuntap for macos "
  version "20150118"
  homepage "happyn.cn"
  url "https://download.happyn.vip/macos/happynet-tuntap.tar.gz"
  sha256 "2f31ffece5ad349aaae0516c08e2f6bd569d61ba2ec54b27909ba71537e7b4ff"

  pkg "tuntap_#{version}.pkg"

  uninstall pkgutil:   "tuntap.startup_item.tap|tuntap.startup_item.tun|tuntap.tap|tuntap.tun",
            launchctl: [
              "net.sf.tuntaposx.tun.plist",
              "net.sf.tuntaposx.tap.plist",
            ],
            kext:      [
              "net.sf.tuntaposx.tap",
              "net.sf.tuntaposx.tun",
            ],
            delete:    [
              "/Library/LaunchDaemons/net.sf.tuntaposx.tap.plist",
              "/Library/LaunchDaemons/net.sf.tuntaposx.tun.plist",
            ]
end
