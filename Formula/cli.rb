class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.20.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.20.0/rngo-0.20.0-x86_64-apple-darwin.zip'
    sha256 '112c9095901b28ae9a8aa13d51aa0fc242de5297cac53fff0820c1039e08599e'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.20.0/rngo-0.20.0-aarch64-apple-darwin.zip'
    sha256 '7af75b1a5394b47ccd0560c8231ac1966f1b3b7a9b5212337042d83da14bf6cb'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.20.0/rngo-0.20.0-x86_64-unknown-linux-musl.zip'
    sha256 'ee5833225eac974a72d02b8c8ed8f6d66771dbcecbcb46f3af48c150c51b9b73'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
