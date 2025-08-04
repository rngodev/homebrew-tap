class Cli < Formula
  desc "The CLI for the rngo data simulation API"
  homepage "https://rngo.dev/docs/cli"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-x86_64-apple-darwin.zip"
    sha256 "2dea3643c660ee95155b22378edd4aa8ba867f4406ad7c0969af60fb2f91f88a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-aarch64-apple-darwin.zip"
    sha256 "4edfaf697e70781c7c3464382a10d4a92af9e56c407ba98c8acd4bfde5a56240"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.11.0/rngo-0.11.0-x86_64-unknown-linux-musl.zip"
    sha256 "6de9cb64ba1cc76f91f948005163f4ee4a0d6e656350a71f63140f97e9e543cc"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
