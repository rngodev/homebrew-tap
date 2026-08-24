class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.34.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.34.0/rngo-0.34.0-x86_64-apple-darwin.zip'
    sha256 '2e88251e0c1290b7de196e2e8f058aa392adac007e69c90f60d20dd60897df90'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.34.0/rngo-0.34.0-aarch64-apple-darwin.zip'
    sha256 'f4c1ad8b0c26ab3cb3f56ce9091b0bd1685a5f7f981b9d4cf5eb9c5639cb0eea'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.34.0/rngo-0.34.0-x86_64-unknown-linux-musl.zip'
    sha256 '8fd1baea92c68c3321dcb5700a77a2adb53a7a9fa566c910fe44ddf7f9ce6f38'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
