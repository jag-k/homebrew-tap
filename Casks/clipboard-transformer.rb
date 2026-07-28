# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"

  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  on_macos do
    sha256 arm:   "0726f6f7b230054d0864c2854b989954617c0dfa54659bdfe5806f94dfd1cda2",
           intel: "000be32c0013f7a1cd1d12b6fa9245f2865be408855ee5fdd380faaca8d1dfff"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"

    depends_on macos: :ventura

    app "Clipboard Transformer.app"
    binary "clipboard-transformer"

    caveats <<~EOS
      Run on Startup is controlled from the app's tray menu.
    EOS
  end

  on_linux do
    sha256 "dc4406fa7c1bc43c3d236ce8a8fa28fd604140085831fa2fa806738128ddee9d"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-x86_64-linux-homebrew.tar.xz"

    depends_on arch: :x86_64

    appimage "Clipboard Transformer.AppImage"
    binary "clipboard-transformer"
  end
end
