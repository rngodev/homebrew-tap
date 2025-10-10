class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.14.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.14.0/rngo-0.14.0-x86_64-apple-darwin.zip'
    sha256 '6817fe553798de1372036ef6148f94f992f576ade8594f16f23245bb56b087d7'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.14.0/rngo-0.14.0-aarch64-apple-darwin.zip'
    sha256 'e6ba90c431d709b0065b0753603b300be82b45322840019281ff76f68a9b74ce'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.14.0/rngo-0.14.0-x86_64-unknown-linux-musl.zip'
    sha256 'b0f07d296af849854bc741388b182e8cfdd0d204a30e46053ccc7ebfa02e48d5'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
