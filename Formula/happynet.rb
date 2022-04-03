# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Happynet < Formula
  desc "happyn client for macos "
  homepage "https://happyn.cn"
  url "https://download.happyn.vip/macos/happynet-macos-darwin-amd64-0.4.tar.gz"
  sha256 "de7e5b4a25bd34ce04da19d5ed69477461cef278329a6827475de482d83e3544"
  license "GPL-3.0"

  def install
    # tar zxvf happynet-macos-darwin-amd64-0.2.tar.gz
    puts "prefix = #{prefix}"
    bin.install 'bin/happynet'
    etc.install "conf/happynet.conf" => "happynet.conf"
    puts "Completed install happynet"
  end

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <true/>
          <key>RunAtLoad</key>
          <true/>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>StandardErrorPath</key>
          <string>/usr/local/var/log/#{plist_name}.log</string>
          <key>StandardOutPath</key>
          <string>/usr/local/var/log/#{plist_name}.log</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/happynet</string>
            <string>#{etc}/happynet.conf</string>
            <string>-f</string>
          </array>
        </dict>
      </plist>
    EOS
  end
end
