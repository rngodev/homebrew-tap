class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.22.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.22.0/rngo-0.22.0-x86_64-apple-darwin.zip'
    sha256 'aa85f36ee89bfa007ca8c42a555f0e72294dc6a55a1ffeadfee05cb99ae8dcae'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.22.0/rngo-0.22.0-aarch64-apple-darwin.zip'
    sha256 '82d193e0a6b15b0c9a1982681f1c3b75aebc7dee6d11ad5fc93f37a1fe3f0532'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.22.0/rngo-0.22.0-x86_64-unknown-linux-musl.zip'
    sha256 'f4ba9d8445d706a42a2c10296fcc68381201563eaeb1d89198e031ef44273902'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
