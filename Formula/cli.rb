class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '0.39.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.39.0/rngo-0.39.0-x86_64-apple-darwin.zip'
    sha256 'a6ec86c20dc8d16193d0c455fc085f52ebde8ffb7b9d3b5627d1b3b06e52ec9a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/rngodev/rngo/releases/download/0.39.0/rngo-0.39.0-aarch64-apple-darwin.zip'
    sha256 '7b9f29ab87ca2634e1dc40e687a9bc5bf71f5aee711415d5223c34e3913ecf83'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/rngodev/rngo/releases/download/0.39.0/rngo-0.39.0-x86_64-unknown-linux-musl.zip'
    sha256 '07912896eaafb00e5e4ade262b4dded86982aeb4043063d02509ed38068c0eb0'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
