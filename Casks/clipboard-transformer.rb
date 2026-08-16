# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.4"

  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  on_macos do
    sha256 arm:   "676d0e97002d3a7d069ec04e45043c3b2a3c09fe6cdb731c6a094b3ba98ed6f0",
           intel: "c2decc046e0720dbcb6e7f12bc8ae3fe6dd8ed79ec21f9d4256f9aa72c0e4294"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"

    depends_on macos: :ventura

    app "Clipboard Transformer.app"
    binary "clipboard-transformer"

    caveats <<~EOS
      Run on Startup is controlled from the app's tray menu.
    EOS
  end

  on_linux do
    sha256 "ba7518c4034905a855cbb4af01a65e4b2b99d4f96ffe69a581b1d64c67273605"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-x86_64-linux-homebrew.tar.xz"

    depends_on arch: :x86_64

    appimage "Clipboard Transformer.AppImage"
    binary "clipboard-transformer"
  end
end
