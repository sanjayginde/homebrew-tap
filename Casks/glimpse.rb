cask "glimpse" do
  version "1.0.25"
  sha256 "35a6d500c1014410bf0beec8a9a41d97c596d0e96ad893601d43f00e88c6b325"

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
