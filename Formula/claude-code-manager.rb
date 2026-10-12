# Updated automatically by claude-code-manager's release workflow.
class ClaudeCodeManager < Formula
  desc "Terminal UI for browsing, managing, and resuming Claude Code sessions"
  homepage "https://github.com/sanjayginde/claude-code-manager"
  url "https://github.com/sanjayginde/claude-code-manager/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "a9bdc121fdf05b9424fe5ec575bf04119174ba8ad11499553e251395ce21b1ea"
  license "MIT"
  head "https://github.com/sanjayginde/claude-code-manager.git", branch: "main"

  depends_on "rust" => :build

  conflicts_with "ccm", because: "both install a `ccm` binary"

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
