class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.41.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.41.0/rngo-0.41.0-x86_64-apple-darwin.zip'
    sha256 '077be6500660452d75430aed763b99c5131586ba3246903de47c797f2d604611'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.41.0/rngo-0.41.0-aarch64-apple-darwin.zip'
    sha256 'b47a2f6d62f1c649817680b1049bf342d23723ea83c43ed9be20079dd5094e67'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.41.0/rngo-0.41.0-x86_64-unknown-linux-musl.zip'
    sha256 '8f8f1b43fec0ef602f427787132f89a4f14501de2b0c699ba93ff9e4d502731c'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
