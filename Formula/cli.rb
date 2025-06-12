class Cli < Formula
  desc "rngo CLI"
  homepage "https://docs.rngo.dev"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.3.0/rngo-0.3.0-x86_64-apple-darwin.zip"
    sha256 "7bcb24764e681f1f494b4c0df6badd1b3952091c5b83cbe19c6439d6df5e2276"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.3.0/rngo-0.3.0-aarch64-apple-darwin.zip"
    sha256 "77e4e6c6f4432e991da6ce4a4eaff53237f50c5b44c3325923ee0828551897aa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.3.0/rngo-0.3.0-x86_64-unknown-linux-musl.zip"
    sha256 "62ea595be567b1e187e62f99c90db706c545c7e0035462ab3aa7d30aaa072586"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
