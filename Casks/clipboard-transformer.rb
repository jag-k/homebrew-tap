# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.3"

  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  on_macos do
    sha256 arm:   "5853f9d5cb7ef5c8d1255223245b04840f3c71ce90e85332cc6438a0631ae708",
           intel: "91cb88f496baebb59ba7ee05fc8c748471b820ff7d059395a03551a791a52552"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"

    depends_on macos: :ventura

    app "Clipboard Transformer.app"
    binary "clipboard-transformer"

    caveats <<~EOS
      Run on Startup is controlled from the app's tray menu.
    EOS
  end

  on_linux do
    sha256 "4a1e5412ab86521bd0a77f79dd9f414b52d87e4852a7775e399f346f5945c02a"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-x86_64-linux-homebrew.tar.xz"

    depends_on arch: :x86_64

    appimage "Clipboard Transformer.AppImage"
    binary "clipboard-transformer"
  end
end
