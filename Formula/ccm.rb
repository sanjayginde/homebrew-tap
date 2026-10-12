# Updated automatically by claude-code-manager's release workflow.
class Ccm < Formula
  desc "Terminal UI for browsing, managing, and resuming Claude Code sessions"
  homepage "https://github.com/sanjayginde/claude-code-manager"
  url "https://github.com/sanjayginde/claude-code-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3eea5a694337c1cc5c0236f28f873e7547624713a797ec1f77bfcdacb5441086"
  license "MIT"
  head "https://github.com/sanjayginde/claude-code-manager.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      ccm resumes sessions by exec'ing `claude --resume <uuid>`, so it
      requires the Claude Code CLI to be installed and on your PATH:
        https://docs.claude.com/en/docs/claude-code

      To enable AI-generated session titles (optional), set:
        export ANTHROPIC_API_KEY=...
      Without the key, ccm falls back to showing a truncated first message.
    EOS
  end

  test do
    # `ccm` is a TUI with no --help/--version flags today; just assert the
    # binary is executable and present.
    assert_predicate bin/"ccm", :exist?
    assert_predicate bin/"ccm", :executable?
  end
end
