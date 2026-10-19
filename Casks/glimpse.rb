cask "glimpse" do
  version "1.0.23"
  sha256 "90d1618bf6d51ee362a6efe765dc77350d92f86e9cd8f6765b55803c342409d3"

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

  uninstall quit: "dev.sanjayginde.glimpse"

  zap trash: "~/Library/Preferences/dev.sanjayginde.glimpse.plist"
end
