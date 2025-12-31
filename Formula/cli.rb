class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.17.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.17.0/rngo-0.17.0-x86_64-apple-darwin.zip'
    sha256 '9af25ea8c9878fe80a0e702c3a4517e355c8057acabaa6d908d64420cd1787cb'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.17.0/rngo-0.17.0-aarch64-apple-darwin.zip'
    sha256 '7ea1150b93c46b0dd6384fbc35a2d0c0814b8964bc850c2f43f63a38ab3a5e48'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.17.0/rngo-0.17.0-x86_64-unknown-linux-musl.zip'
    sha256 '683df688fa2d714aa76da5ab97a2604f42785272f6f4463f05e319a75b874e7a'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
