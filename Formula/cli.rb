class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.29.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.29.0/rngo-0.29.0-x86_64-apple-darwin.zip'
    sha256 'c6d59e5a2a046bb254ae59abff77696af26691715dc66234f6a0bb490125c3dd'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.29.0/rngo-0.29.0-aarch64-apple-darwin.zip'
    sha256 '2a7995b247036f1166e67d9e31217969ceb7b68bb9da550d72a9ea0e3d3117d4'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.29.0/rngo-0.29.0-x86_64-unknown-linux-musl.zip'
    sha256 '9f276901c696e7c78d0e6ac531a32f46d2b35fa627584d18a33fba9e8d6cd613'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
