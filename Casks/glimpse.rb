cask "glimpse" do
  version "1.0.4"
  sha256 "897537c0b1e6399757fdecd5b40972e5934c0050fd27c4f079bbdd73224ca898"

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
