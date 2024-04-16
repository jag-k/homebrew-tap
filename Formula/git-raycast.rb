class GitRaycast < Formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"

  homepage "https://github.com/#{REPO}"
  url "https://github.com/jag-k/git-raycast/releases/download/v0.1.0/git-raycast.tar.gz"
  sha256 "ef1fb497315aefb28ec3ba4b6c6cce8b8454bce76c93f2c02ddabe462855e83a"
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
