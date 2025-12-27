#!/bin/bash

set -e

REPO="rngodev/cli"
FORMULA_FILE="Formula/cli.rb"

echo "Fetching latest release from GitHub API..."
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")

VERSION=$(echo "$RELEASE_DATA" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
echo "Latest version: $VERSION"

# Extract SHA256 digests from GitHub API
echo "Extracting SHA256 for x86_64-apple-darwin..."
DARWIN_INTEL_ASSET="rngo-${VERSION}-x86_64-apple-darwin.zip"
DARWIN_INTEL_DIGEST=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"$DARWIN_INTEL_ASSET\") | .digest")
if [ -z "$DARWIN_INTEL_DIGEST" ] || [ "$DARWIN_INTEL_DIGEST" == "null" ]; then
  echo "Error: No digest found for $DARWIN_INTEL_ASSET in GitHub API response"
  exit 1
fi
DARWIN_INTEL_SHA=$(echo "$DARWIN_INTEL_DIGEST" | cut -d':' -f2)
echo "  SHA256: $DARWIN_INTEL_SHA"

echo "Extracting SHA256 for aarch64-apple-darwin..."
DARWIN_ARM_ASSET="rngo-${VERSION}-aarch64-apple-darwin.zip"
DARWIN_ARM_DIGEST=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"$DARWIN_ARM_ASSET\") | .digest")
if [ -z "$DARWIN_ARM_DIGEST" ] || [ "$DARWIN_ARM_DIGEST" == "null" ]; then
  echo "Error: No digest found for $DARWIN_ARM_ASSET in GitHub API response"
  exit 1
fi
DARWIN_ARM_SHA=$(echo "$DARWIN_ARM_DIGEST" | cut -d':' -f2)
echo "  SHA256: $DARWIN_ARM_SHA"

echo "Extracting SHA256 for x86_64-unknown-linux-musl..."
LINUX_INTEL_ASSET="rngo-${VERSION}-x86_64-unknown-linux-musl.zip"
LINUX_INTEL_DIGEST=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"$LINUX_INTEL_ASSET\") | .digest")
if [ -z "$LINUX_INTEL_DIGEST" ] || [ "$LINUX_INTEL_DIGEST" == "null" ]; then
  echo "Error: No digest found for $LINUX_INTEL_ASSET in GitHub API response"
  exit 1
fi
LINUX_INTEL_SHA=$(echo "$LINUX_INTEL_DIGEST" | cut -d':' -f2)
echo "  SHA256: $LINUX_INTEL_SHA"

# Update the formula file
echo "Updating $FORMULA_FILE..."

cat > "$FORMULA_FILE" << EOF
class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '${VERSION}'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-x86_64-apple-darwin.zip'
    sha256 '${DARWIN_INTEL_SHA}'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-aarch64-apple-darwin.zip'
    sha256 '${DARWIN_ARM_SHA}'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-x86_64-unknown-linux-musl.zip'
    sha256 '${LINUX_INTEL_SHA}'
  end

  def install
    bin.install 'rngo'
  end

  test do
    system "#{bin}/rngo"
  end
end
EOF

echo "✓ Formula updated to version $VERSION"
echo ""
echo "You can now commit and push the changes:"
echo "  git add $FORMULA_FILE"
echo "  git commit -m \"Bump CLI to $VERSION\""
echo "  git push"
