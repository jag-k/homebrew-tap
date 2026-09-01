# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.6"

  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  on_macos do
    sha256 arm:   "f8599bd1b4d6c5293f5728425147cf60a7fad34f626be574632624ddf242c7e4",
           intel: "ae60077a376c6c10581b575d03943fef5bb854b57124c434dcab84770000db3b"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"

    depends_on macos: :ventura

    app "Clipboard Transformer.app"
    binary "clipboard-transformer"

    caveats <<~EOS
      Run on Startup is controlled from the app's tray menu.
    EOS
  end

  on_linux do
    sha256 "ad700f36f95ec4b66eb6a4ed000bed7244071be13104620f7f4d569256aaf164"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-x86_64-linux-homebrew.tar.xz"

    depends_on arch: :x86_64

    appimage "Clipboard Transformer.AppImage"
    binary "clipboard-transformer"
  end
end
