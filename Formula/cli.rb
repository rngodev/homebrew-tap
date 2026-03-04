class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.19.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.19.0/rngo-0.19.0-x86_64-apple-darwin.zip'
    sha256 '8ce9157bcfd2b8ed34891e5bfbb870d0de7208e74ca271abd75ce139bfc5a5b0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/cli/releases/download/0.19.0/rngo-0.19.0-aarch64-apple-darwin.zip'
    sha256 '4aaed6b99a3621f54bd9b2c9326a8e3468132498757488e8c19500ef99a3c12d'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/cli/releases/download/0.19.0/rngo-0.19.0-x86_64-unknown-linux-musl.zip'
    sha256 '28b457c059ae3d3738a0080a94920780591b1bfd02c5a6f66be032ba45978c7c'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
