class GitRaycast < Formula
  # Constants for reuse across the formula
  NAME = "git-raycast".freeze
  REPO = "jag-k/git-raycast".freeze

  desc "Automate git using Raycast AI"
  homepage "https://github.com/#{REPO}"
  url "https://github.com/#{REPO}/releases/download/v0.2.1/git-raycast.tar.gz"
  sha256 "cf7345b7ba3349035c73a40a9fa22a52fe67be06abae265e96999eba5d2170cf"
  license "MIT"

  # Configure automatic version checking
  livecheck do
    url :stable
    strategy :github_latest
  end

  # Development version configuration
  head do
    url "https://github.com/#{REPO}.git", branch: "main"
    depends_on "go" => :build  # Only needed for building from source
  end

  def install
    if build.head?
      # Build from source if installing head version
      cd buildpath do
        system "go", "build", *std_go_args(output: bin/NAME), "./cmd/#{NAME}"
      end
    else
      # Install pre-built binary for the current architecture
      bin.install "#{NAME}_#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => NAME
    end

    # Handle shell completions installation
    bash_completion_path = "autocomplete/#{NAME}.bash"
    zsh_completion_path = "autocomplete/#{NAME}.zsh"

    # Check which completion files are missing and warn user
    completion_files_missing = []
    completion_files_missing << "bash" unless File.exist?(bash_completion_path)
    completion_files_missing << "zsh" unless File.exist?(zsh_completion_path)

    if completion_files_missing.any?
      opoo "Shell completion files are missing for: #{completion_files_missing.join(", ")}"
    end

    # Install completion files if they exist
    if File.exist?(bash_completion_path)
      bash_completion.install bash_completion_path => "#{NAME}.bash_completion"
    end

    if File.exist?(zsh_completion_path)
      zsh_completion.install zsh_completion_path => "_#{NAME}"
    end
  end

  test do
    # Verify that the binary works and reports the correct version
    assert_match version.to_s, shell_output("#{bin}/#{NAME} --version")
  end
end
