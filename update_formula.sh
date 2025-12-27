#!/bin/bash

set -e

REPO="rngodev/cli"
FORMULA_FILE="Formula/cli.rb"

echo "Fetching latest release from GitHub API..."
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")

VERSION=$(echo "$RELEASE_DATA" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
echo "Latest version: $VERSION"

# Extract SHA256 digests from GitHub API
ASSETS=(
  "rngo-${VERSION}-x86_64-apple-darwin.zip"
  "rngo-${VERSION}-aarch64-apple-darwin.zip"
  "rngo-${VERSION}-x86_64-unknown-linux-musl.zip"
)

declare -A SHAS

for asset in "${ASSETS[@]}"; do
  echo "Extracting SHA256 for $asset..."
  # GitHub API provides digest in format "sha256:hash"
  digest=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"$asset\") | .digest")

  if [ -z "$digest" ] || [ "$digest" == "null" ]; then
    echo "Error: No digest found for $asset in GitHub API response"
    exit 1
  fi

  # Extract hash after "sha256:" prefix
  sha=$(echo "$digest" | cut -d':' -f2)

  SHAS[$asset]=$sha
  echo "  SHA256: $sha"
done

# Update the formula file
echo "Updating $FORMULA_FILE..."

cat > "$FORMULA_FILE" << EOF
class Cli < Formula
  desc 'The CLI for the rngo data simulation API'
  homepage 'https://rngo.dev/docs/cli'
  version '${VERSION}'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-x86_64-apple-darwin.zip'
    sha256 '${SHAS[rngo-${VERSION}-x86_64-apple-darwin.zip]}'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-aarch64-apple-darwin.zip'
    sha256 '${SHAS[rngo-${VERSION}-aarch64-apple-darwin.zip]}'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://github.com/${REPO}/releases/download/${VERSION}/rngo-${VERSION}-x86_64-unknown-linux-musl.zip'
    sha256 '${SHAS[rngo-${VERSION}-x86_64-unknown-linux-musl.zip]}'
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
