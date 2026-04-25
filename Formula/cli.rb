class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.21.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.21.0/rngo-0.21.0-x86_64-apple-darwin.zip'
    sha256 '65ac3cfd19ae47ff80a06a5939ed9e6d219ca06908b1f9605a6100df84cb0434'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.21.0/rngo-0.21.0-aarch64-apple-darwin.zip'
    sha256 '6eb17609ad14aca9b829fbea10d1badf45fb9b4e9a3749e69866057929d0031f'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.21.0/rngo-0.21.0-x86_64-unknown-linux-musl.zip'
    sha256 '8c5f0c9b7966a58ff75a8d9e4ad660fdb50524b0eafd65b90c0c2d7332c185d7'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
