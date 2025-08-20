class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.13.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.13.0/rngo-0.13.0-x86_64-apple-darwin.zip'
    sha256 '2531f52294035d374c28159ca737b43140e183f20428523f138edbdd87dd7b23'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.13.0/rngo-0.13.0-aarch64-apple-darwin.zip'
    sha256 'dee057f5120fce47a08439d6aa09741a8d9ba48f12c1843d553d0c5d69b375cd'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.13.0/rngo-0.13.0-x86_64-unknown-linux-musl.zip'
    sha256 '57438120c2b95e747a671461235018a2c35cd762bcc5ec0dc14b68c56385a393'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
