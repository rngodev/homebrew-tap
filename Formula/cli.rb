class Cli < Formula
  desc "The CLI for the rngo data simulation API"
  homepage "https://rngo.dev/docs/cli"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.9.0/rngo-0.9.0-x86_64-apple-darwin.zip"
    sha256 "43cdd991ab7540b2897637bb7cf3b7c223f525690be353187efd57eacf3be77a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.9.0/rngo-0.9.0-aarch64-apple-darwin.zip"
    sha256 "dc61534f12175ec19c3916166435b6da14beac196ccc18fa74892b6ab5b271ff"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.9.0/rngo-0.9.0-x86_64-unknown-linux-musl.zip"
    sha256 "06578f95af024c8f3ee21d80f6a9e900a00ccf17f4b7e45ebf21348c3250c558"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
