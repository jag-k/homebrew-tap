class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.0.2/git-raycast"
  sha256 "4b7040cdf6c1963d13b28803fb80a8a81b9cd22a9397d1c14f6d6ff35c1d6a7d"
  license "MIT"
  head "https://github.com/#{REPO}.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", NAME, "cmd/#{NAME}" if build?
    system "#{bin}/#{NAME}", "--create-man-page", "man.1"
    bin.install NAME
    man1.install "man.1"
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
