class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.28.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo-rs/releases/download/0.28.0/rngo-0.28.0-x86_64-apple-darwin.zip'
    sha256 'fe2c9e353b751a29a0beb8db2c846c221983f4fc42951912f2368ec08fa390e6'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo-rs/releases/download/0.28.0/rngo-0.28.0-aarch64-apple-darwin.zip'
    sha256 '4d0c3776ef62b3ca9815b19049cf6000919a2c620dfc9b760e51ccfc1c8c2192'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo-rs/releases/download/0.28.0/rngo-0.28.0-x86_64-unknown-linux-musl.zip'
    sha256 '9919495d633d7630df0cd20a8b0ab049c0fd7535ca526ac905a26b3d9dc3ba40'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
