class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.0.1/git-raycast"
  sha256 "11fd7783eeae2913ed11d508b4ea6491be18d820a300e7cdc4a2aa17c71f9022"
  license "MIT"
  head "https://github.com/#{REPO}.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", NAME, "cmd/#{NAME}" if build?
    bin.install NAME
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
