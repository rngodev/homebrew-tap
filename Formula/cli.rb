class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.35.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.35.0/rngo-0.35.0-x86_64-apple-darwin.zip'
    sha256 'eef942acf8dec19e2cf56bec03e488ee27f23339ff9da90082c730ee54a52552'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.35.0/rngo-0.35.0-aarch64-apple-darwin.zip'
    sha256 '4def25b97a2168ab9f718df8c23fdc00aeb12e4e712d06c9bf6eb491348a5714'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.35.0/rngo-0.35.0-x86_64-unknown-linux-musl.zip'
    sha256 '789e8cbfa3f4aebd61beafd797929043ac97f8d9109124b3c2f29f3bfcd07e33'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
