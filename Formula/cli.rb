class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.36.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.36.0/rngo-0.36.0-x86_64-apple-darwin.zip'
    sha256 '9b3d1fb1b9a103b2efca46ef4112a2d42ad548e0067b69ac9f92375216a3b7b3'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.36.0/rngo-0.36.0-aarch64-apple-darwin.zip'
    sha256 '03240863827b8d3e913b4f73001809d90f49280fddb60581d24f2b6d52472861'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.36.0/rngo-0.36.0-x86_64-unknown-linux-musl.zip'
    sha256 '352614be5b926a4c70f19b1a1926380f296ed72257b40ab49185bd5e3fc29bf7'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
