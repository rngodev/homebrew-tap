class Cli < Formula
  desc "The CLI for the rngo data simulation API"
  homepage "https://rngo.dev/docs/cli"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-x86_64-apple-darwin.zip"
    sha256 "e816e81057c485c6d3cea5d95bbd1a2f6f0d7f9d6db303c1111f07fba194e8f3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-aarch64-apple-darwin.zip"
    sha256 "0996465423de5691f92196ac0fd5dfc530efb33c4b55a4b7241019ff11723eb2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-x86_64-unknown-linux-musl.zip"
    sha256 "37f3abe5e2f52d6cc12e73f38786458e756eb5cee66842c369957dc1880958c1"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
