class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.31.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.31.0/rngo-0.31.0-x86_64-apple-darwin.zip'
    sha256 'c7b8f57ff0327dca80cf5bfac2bc7bc031d4475fd1fa66e0d28b4ca2b211e2a8'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.31.0/rngo-0.31.0-aarch64-apple-darwin.zip'
    sha256 '122ccfaddbeac6b0840e3501d89ec1a27781338e6371401ba29353c173485a0a'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.31.0/rngo-0.31.0-x86_64-unknown-linux-musl.zip'
    sha256 '7ff36622e1b02ebe86fa6ecf368d577176fb01d136b68f461615f70a82249149'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
