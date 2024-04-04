class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.0.2/git-raycast.tar.gz"
  sha256 "1b774feb0fb08115670d1c125ea857769b2b7d5f114fac15dc8cad997dd43e9a"
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
    system "#{bin}/#{NAME}", "--create-man-page", "#{NAME}.1"
    man1.install "#{NAME}.1"
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
