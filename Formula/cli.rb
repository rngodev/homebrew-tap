class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.32.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.32.0/rngo-0.32.0-x86_64-apple-darwin.zip'
    sha256 '0fec0fcb5073ffbc9eda975e46c48c19e033540869e8f8a9d0b69afdc0475091'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.32.0/rngo-0.32.0-aarch64-apple-darwin.zip'
    sha256 '25e6976022a3114dc42ee720d2831cfa5f03b3001f21e66a9cf43bb204a5f594'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.32.0/rngo-0.32.0-x86_64-unknown-linux-musl.zip'
    sha256 'b98bb69e8d64fb82c038f1d9fefae051f69dd721675d278184c205062d2364c0'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
