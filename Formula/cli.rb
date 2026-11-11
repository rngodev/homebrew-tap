class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.40.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.40.0/rngo-0.40.0-x86_64-apple-darwin.zip'
    sha256 'b354a34e759627b31af9a59917969aa7a66706779f2703adadb4713268b1304c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.40.0/rngo-0.40.0-aarch64-apple-darwin.zip'
    sha256 '932c745054aa8ca1c32f4613f7dc9ac91fbce2dca0adf3c674fc46035dab0243'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.40.0/rngo-0.40.0-x86_64-unknown-linux-musl.zip'
    sha256 'f9333f311cb7eb10710102f3271bc040e69f5712f53938165711a8337df78610'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
