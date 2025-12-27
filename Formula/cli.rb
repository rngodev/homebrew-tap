class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.16.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.16.0/rngo-0.16.0-x86_64-apple-darwin.zip'
    sha256 '528c143c8e2c542d8510b48895135fc9921b2cf3ba55e53aabd9b98618eaca2b'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.16.0/rngo-0.16.0-aarch64-apple-darwin.zip'
    sha256 '68a3a208af75049e719708cc9a033afc5ef034666fb4f5537e861f888c451cf1'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.16.0/rngo-0.16.0-x86_64-unknown-linux-musl.zip'
    sha256 'c41a8abd85a93fccfcf23677e3acb3887d7dca8f123731e7d4691011171008c3'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
