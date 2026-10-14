class Memo < Formula
  desc "Let any AI agent hear your meetings as they happen"
  homepage "https://github.com/meeting-ai/memo-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.3/memo_0.19.3_darwin_arm64.tar.gz"
      sha256 "30f9490e18f3b929cca5bfe2a9813c33412e898bd24d607f2e45b0c2ab47d6c7"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.3/memo_0.19.3_darwin_amd64.tar.gz"
      sha256 "4a543568c9fa89d44f2a8de960c3e0a9fda786ae8859e45e090d02d9d7b3fd8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.3/memo_0.19.3_linux_arm64.tar.gz"
      sha256 "a2b1d65bf350ca975157e9dfc3b99b8db8b48f97b1fbfb57e331988857071ec3"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.3/memo_0.19.3_linux_amd64.tar.gz"
      sha256 "6bccfcbe447964daa25bdcefd8ddd85b4806ae53ccb39c1348af06aaca990e08"
    end
  end

  def install
    bin.install "memo"
  end

  def caveats
    <<~EOS
      To teach your AI agents how to use memo, run:
        memo install-skill-md
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memo version")
  end
end
