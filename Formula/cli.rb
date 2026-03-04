class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.18.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.18.0/rngo-0.18.0-x86_64-apple-darwin.zip'
    sha256 '02c929366a9d2d781b63e56c3c25484a57ad8205f1465fb41ec32b8302a0bc33'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.18.0/rngo-0.18.0-aarch64-apple-darwin.zip'
    sha256 '6be7b17f5afad953f2ff791573f6f331a347db52dc852510e38218be936b0fd7'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.18.0/rngo-0.18.0-x86_64-unknown-linux-musl.zip'
    sha256 '5f63d0954c9b71e19cfe5a1a25eabdb04d5b8fcc6c2fd7e016f8cf39ab9e8cb1'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
