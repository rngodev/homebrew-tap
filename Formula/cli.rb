class Vault < Formula
  desc "rngo CLI"
  homepage "https://docs.rngo.dev"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.2.3/rngo-0.2.3-x86_64-apple-darwin.zip"
    sha256 "41179c894b0d4295798e6ed4d13f67f877d838545e53344ed51c91fed66e19d8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/rngodev/cli/releases/download/0.2.3/rngo-0.2.3-aarch64-apple-darwin.zip"
    sha256 "45c64217af0370fd039e3c6c5f403f1ebd2e11e2e783eda8e3b9fc46746a7867"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/rngodev/cli/releases/download/0.2.3/rngo-0.2.3-x86_64-unknown-linux-musl.zip"
    sha256 "d1d949a7d24e4e800ab2e6ebff74b7a894c302155d75b31230bd91c98e7ae900"
  end

  def install
    bin.install "rngo"
  end

  test do
    system "#{bin}/rngo"
  end
end
