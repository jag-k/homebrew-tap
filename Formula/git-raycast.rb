# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GitRaycast < Formula
  desc "Automate git using Raycast AI"
  homepage "https://github.com/jag-k/git-raycast"
  version "0.3.0"
  license "MIT"
  depends_on :macos

  url "https://github.com/jag-k/git-raycast/releases/download/v0.3.0/git-raycast.tar.gz"
  sha256 "b0fee2ce8abff2094308ab5baf6b7c7413d26486e8f8361b54b14e36aa5f3d10"

  def install
    if build.head?
      system "go", "build", *std_go_args(output: bin/"git-raycast"), "./git-raycast"
    else
      bin.install "git-raycast"
    end

    bash_completion_path = "git-raycast.bash"
    zsh_completion_path = "git-raycast.zsh"
    fish_completion_path = "git-raycast.fish"

    bash_completion.install bash_completion_path => "git-raycast.bash_completion" if File.exist?(bash_completion_path)
    zsh_completion.install zsh_completion_path => "_git-raycast" if File.exist?(zsh_completion_path)
    fish_completion.install fish_completion_path if File.exist?(fish_completion_path)
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  head do
    url "https://github.com/jag-k/git-raycast.git", branch: "main"
    depends_on "go" => :build
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-raycast --version")
  end
end
