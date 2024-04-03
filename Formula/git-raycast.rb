class GitRaycast < Formula
  VERSION = "0.0.1".freeze
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze
  
  desc "Automate git using Raycast AI"
  
  homepage "https://github.com/#{REPO}"
  url "https://github.com/#{REPO}/releases/download/v#{VERSION}/#{NAME}"
  license "MIT"
  sha256 "7deb3f91df9b992dd691a8038240ab48877c032e21c6ebab9ad4903e6d5bcbee"

  head "https://github.com/#{REPO}.git"
  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system "go", "build", "-o", NAME, "cmd/#{NAME}"
    end
    bin.install NAME
  end

  test do
    system "#{bin}/#{NAME}", "--version"
  end
end
