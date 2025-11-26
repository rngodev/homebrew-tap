class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.15.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.15.0/rngo-0.15.0-x86_64-apple-darwin.zip'
    sha256 '4af0f5bdacdf2c50b60e87eb68451e0e02bd5f783e31afee34f06398c0b6b73a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.15.0/rngo-0.15.0-aarch64-apple-darwin.zip'
    sha256 'f54a8d9f3fe90b06604e79f2da09cc2260d78d4e8825a10cdb23475f9a129771'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.15.0/rngo-0.15.0-x86_64-unknown-linux-musl.zip'
    sha256 'a7ba0d6c20cc6d27959beb7e02a269d6497f9f5db6e91ee642f072507ae1c602'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
