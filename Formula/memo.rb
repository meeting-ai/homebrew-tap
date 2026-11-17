class Memo < Formula
  desc "Let any AI agent hear your meetings as they happen"
  homepage "https://github.com/meeting-ai/memo-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.0/memo_0.20.0_darwin_arm64.tar.gz"
      sha256 "410890c7e4c6d13dd803f0c7022f7c3f3c4a5f115aeebbcf5a347da24de0b32a"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.0/memo_0.20.0_darwin_amd64.tar.gz"
      sha256 "75cd455f2b7fd989d28e44744796ed8a859b871c72e0199570a0cc406bf66be1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.0/memo_0.20.0_linux_arm64.tar.gz"
      sha256 "842670250bce6d359d1622d4372d2e153690d7ffb25a1d31fb851aa0e7c307c8"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.20.0/memo_0.20.0_linux_amd64.tar.gz"
      sha256 "804286e35834068e6785c5457c8c730919a8cf7cdf071be7a3e0ac722c709c30"
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
