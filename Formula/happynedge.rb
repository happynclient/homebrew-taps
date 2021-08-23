# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Happynedge < Formula
  desc "happyn client for macos "
  homepage "https://happyn.cc"
  url "https://github.com/happynclient/happynmacos/releases/download/2.9.0-rc1/happynmacos-darwin-amd64-2.9.0-rc1.tar.gz"
  sha256 "00104f8a56e3355bfadb69ed5dcbb44d44136ed61e17936be22160380773ff5e"
  license "GPL-3.0"

  def install
    # tar zxvf happnmacOS.tar.gz
    puts "prefix = #{prefix}"
    bin.install 'bin/edge'
    etc.install "conf/edge.conf" => "edge.conf"
    puts "Completed install happynedge"
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