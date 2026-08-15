class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.30.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.30.0/rngo-0.30.0-x86_64-apple-darwin.zip'
    sha256 '37cbb70903a6b22e46e18cd1fc5620eeb03dea94fc10ffd116c523c21cf4fb2e'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.30.0/rngo-0.30.0-aarch64-apple-darwin.zip'
    sha256 '27bfb195800376142b72900eb7f455beb1b6532e45cbfc6075e8cd3b028dee37'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.30.0/rngo-0.30.0-x86_64-unknown-linux-musl.zip'
    sha256 '454d80c1fa99ef811cb027eec44fa9a439f4fb2264512a048fb81374ab34ac23'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
