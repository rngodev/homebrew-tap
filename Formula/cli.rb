class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.37.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.37.0/rngo-0.37.0-x86_64-apple-darwin.zip'
    sha256 'eb659909f57c7401c4f167045ed361e24ad1b5a913604fdc6565f0d4bf3e2ee9'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.37.0/rngo-0.37.0-aarch64-apple-darwin.zip'
    sha256 '1991d41fad6279a8c013253af806256bc76a1d4f1971b6f71afcb72d311da853'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.37.0/rngo-0.37.0-x86_64-unknown-linux-musl.zip'
    sha256 'edd559254ba577d3659ee7ba1ace7f13fba0e6068a55d5dfc62019f4fb9457ba'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
