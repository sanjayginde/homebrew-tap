cask "glimpse" do
  version "1.0.22"
  sha256 "5762fbe8fb4318ddc5083e9c186198b50031655ffae5785f1537ba9e2c3a454b"

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
