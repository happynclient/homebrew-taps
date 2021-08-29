# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Happynet < Formula
  desc "happyn client for macos "
  homepage "https://happyn.cc"
  url "https://github.com/happynclient/happynmacos/releases/download/0.1/happynet-macos-darwin-amd64-0.1.tar.gz"
  sha256 "36a369561fa12284497bab327b1370a1bb4d92282f37725d19ecee10e540aeca"
  license "GPL-3.0"

  def install
    # tar zxvf happynet-macos-darwin-amd64-0.1.tar.gz
    puts "prefix = #{prefix}"
    bin.install 'bin/edge'
    etc.install "conf/edge.conf" => "edge.conf"
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
            <string>#{opt_bin}/edge</string>
            <string>#{etc}/edge.conf</string>
            <string>-f</string>
          </array>
        </dict>
      </plist>
    EOS
  end
end
