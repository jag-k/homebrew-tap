class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.2.0/git-raycast.tar.gz"
  sha256 "26fd57b7516c69105c3ba21b4d2be18c5e5d14e5e87c2cca5ac5de6c43dcabbc"
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
    bash_completion.install "autocomplete/#{NAME}.bash" => "#{NAME}.bash_completion"
    zsh_completion.install "autocomplete/#{NAME}.zsh" => "_#{NAME}"
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
