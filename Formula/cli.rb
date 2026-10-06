class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.38.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.38.0/rngo-0.38.0-x86_64-apple-darwin.zip'
    sha256 'e334e0f6e5e32f464c16237ddf1881b6fa3971d1f50be797a8449c82617c9fbd'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.38.0/rngo-0.38.0-aarch64-apple-darwin.zip'
    sha256 '5758b0f1e42feefb83cd8ab7ef569476a907385f2070d0a5f54206581a3b75ca'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.38.0/rngo-0.38.0-x86_64-unknown-linux-musl.zip'
    sha256 'aea4437f456a12d1766a2ebdf21d1f1c9f72c9dce3e92d2f320de6470f651bf2'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
