cask "glimpse" do
  version "1.0.11"
  sha256 "d79e57c7d1276138151019496c09e245d709642167ebc46db3c2f4b26ef2654d"

  url "https://github.com/sanjayginde/glimpse/releases/download/v#{version}/Glimpse-#{version}.zip"
  name "Glimpse"
  desc "Menu bar monthly calendar"
  homepage "https://github.com/sanjayginde/glimpse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Glimpse.app"

  # Glimpse is ad-hoc signed, not notarized; clear quarantine so Gatekeeper allows launch
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Glimpse.app"]
  end

  uninstall quit: "dev.sanjayginde.glimpse"

  zap trash: "~/Library/Preferences/dev.sanjayginde.glimpse.plist"
end
