class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.0.1/git-raycast"
  sha256 "4b7040cdf6c1963d13b28803fb80a8a81b9cd22a9397d1c14f6d6ff35c1d6a7d"
  license "MIT"

  head do
    url "https://github.com/#{REPO}.git", branch: "main"
    depends_on "go" => :build
  end 

  def install
    if build.head?
      system "go", "build", "-o", NAME, "cmd/#{NAME}"
      bin.install NAME
    else
      bin.install "#{name}_amd64" => NAME if Hardware::CPU.intel?
      bin.install "#{name}_arm64" => NAME if Hardware::CPU.arm?
    end
    system "#{bin}/#{NAME}", "--create-man-page", "man.1"
    man1.install "man.1"
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
