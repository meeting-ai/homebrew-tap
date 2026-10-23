class Memo < Formula
  desc "Let any AI agent hear your meetings as they happen"
  homepage "https://github.com/meeting-ai/memo-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.4/memo_0.19.4_darwin_arm64.tar.gz"
      sha256 "712f1e885c75c8c81f340ab3f9045c8dfb91037f8b7ccd444f60c68ce17ed39c"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.4/memo_0.19.4_darwin_amd64.tar.gz"
      sha256 "3d143b574b0e7d6b7c0477119dfe17bf2ccb37367d6ac07c479ae04def02c407"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.4/memo_0.19.4_linux_arm64.tar.gz"
      sha256 "fee65a2548c1dc15e959d52c722251f63f27200d5d91092570e18949592cc81e"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.4/memo_0.19.4_linux_amd64.tar.gz"
      sha256 "288435d5c1f54fb315cd9463e750c8644961fc524b74200280ba434db4d659cc"
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
