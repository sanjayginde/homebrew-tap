# sanjayginde/homebrew-tap

Homebrew formulae and casks for my projects.

| Name | Install | Description |
|------|---------|-------------|
| [ccm](https://github.com/sanjayginde/claude-code-manager) | `brew install sanjayginde/tap/ccm` | Terminal UI for browsing, managing, and resuming Claude Code sessions |
| [Glimpse](https://github.com/sanjayginde/glimpse) | `brew install --cask sanjayginde/tap/glimpse` | Menu bar monthly calendar |

`Formula/ccm.rb` and `Casks/glimpse.rb` are updated automatically by each
project's release workflow.

> Glimpse is ad-hoc signed (not notarized). The cask strips the quarantine
> attribute after install so Gatekeeper allows it to launch.
