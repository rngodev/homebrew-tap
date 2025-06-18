class Cli < Formula
  desc "The CLI for the rngo data simulation API"
  homepage "https://rngo.dev/docs/cli"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.4.0/rngo-0.4.0-x86_64-apple-darwin.zip"
    sha256 "5bd8145c481bfd3a8948ec82acfe42bc681dd25093582eb1e993548a59768cd5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.4.0/rngo-0.4.0-aarch64-apple-darwin.zip"
    sha256 "ce41ca0f734cf2da43384951a13bc81e7194e4af007f9ebb096f0786b757b894"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.4.0/rngo-0.4.0-x86_64-unknown-linux-musl.zip"
    sha256 "4be30220125d22ddb628099a82503c9743cf0d53a56156c11aea10ed8153bdfb"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
