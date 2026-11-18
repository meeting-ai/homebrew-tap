class Memo < Formula
  desc "Let any AI agent hear your meetings as they happen"
  homepage "https://github.com/meeting-ai/memo-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.1/memo_0.20.1_darwin_arm64.tar.gz"
      sha256 "17ae21e9449c21705336cdf110717329408bc123a7f4b8d669b0c778c631fc52"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.1/memo_0.20.1_darwin_amd64.tar.gz"
      sha256 "b77b81961535384d6196c5a44c07169bca0fdf62c8621e3dd0ad6e851b449ae3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.1/memo_0.20.1_linux_arm64.tar.gz"
      sha256 "8ca383ae11c98f51b78e8996a98ea9f3f3989a83a871ae70f0c9dfac1f91b5a7"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.1/memo_0.20.1_linux_amd64.tar.gz"
      sha256 "c25c1e9946b9deed3daca46193d2225afe797e667d647fe46026a61776531dc9"
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
