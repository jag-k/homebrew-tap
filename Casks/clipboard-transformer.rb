# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"

  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  on_macos do
    sha256 arm:   "45061d0e7b5bfa62ee9076b4277a8076f8e0a4f2ece2797e4b1c76158f4c9eff",
           intel: "4632cb8e5d4786420a972628f19cfda236bedd2335dc3c8951a1d1a379aa261a"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"

    depends_on macos: :ventura

    app "Clipboard Transformer.app"
    binary "clipboard-transformer"

    caveats <<~EOS
      Run on Startup is controlled from the app's tray menu.
    EOS
  end

  on_linux do
    sha256 "c14e0bf7d151c72635654d500aa6983c64ca74705f369b891aed2b39d3e29af8"

    url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-x86_64-linux-homebrew.tar.xz"

    depends_on arch: :x86_64

    appimage "Clipboard Transformer.AppImage"
    binary "clipboard-transformer"
  end
end
