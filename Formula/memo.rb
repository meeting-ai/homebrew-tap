class Memo < Formula
  desc "Let any AI agent hear your meetings as they happen"
  homepage "https://github.com/meeting-ai/memo-cli"
  version "0.19.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.2/memo_0.19.2_darwin_arm64.tar.gz"
      sha256 "c7c5be2f477376d85879d8c2c77beebdfef33f851a36a1b6f2b35e0f545ad645"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.2/memo_0.19.2_darwin_amd64.tar.gz"
      sha256 "2fc515dc6b570cceb2be34308b28116bf71516ee95aee084e4e1d7b30c0d3652"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.2/memo_0.19.2_linux_arm64.tar.gz"
      sha256 "6d53213817c9622a8e3d8d3734bb6d0a8b17e44056c4d65e284c2ff071e9cba8"
    else
      url "https://github.com/meeting-ai/memo-cli/releases/download/v0.19.2/memo_0.19.2_linux_amd64.tar.gz"
      sha256 "4644cdeb948aca155304454a94930d0e628754a1a2057718178625bfdd65125a"
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
