# typed: strict
# frozen_string_literal: true

cask "clipboard-transformer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "af112d836f07366973ae8c9f7106016e48f1b06709465442e424633aeff2bbe5",
         intel: "3748940bc31c9ddce06625c5b3aefad06b5ca47eaa1aa42dc64bf0e47034fad5"

  url "https://github.com/jag-k/clipboard-transformer/releases/download/v#{version}/clipboard-transformer-#{version}-#{arch}-apple-darwin-homebrew.zip"
  name "Clipboard Transformer"
  desc "Rule-based clipboard transformer"
  homepage "https://github.com/jag-k/clipboard-transformer"

  depends_on macos: ">= :ventura"

  app "Clipboard Transformer.app"
  binary "clipboard-transformer"

  caveats <<~EOS
    Run on Startup is controlled from the app's tray menu.
  EOS
end
