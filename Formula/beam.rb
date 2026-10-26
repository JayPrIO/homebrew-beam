# Homebrew formula for beam — syncs active repo files between Macs via
# iCloud Drive, bypassing node_modules/vendor/build/etc via .beamignore.
#
# Installs a prebuilt binary (no Go toolchain needed on the user's
# machine) published by jayprio/beam-cli's release workflow
# (.github/workflows/release.yml), which builds darwin/amd64 and
# darwin/arm64 tarballs on every vX.Y.Z tag.
class Beam < Formula
  desc "Sync active repository files between Macs via iCloud Drive"
  homepage "https://github.com/jayprio/beam-cli"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/jayprio/beam-cli/releases/download/v0.1.0/beam_darwin_arm64.tar.gz"
    sha256 "11c5459d122c9e663aacf5bfd9209977f6ff44c63404834c28caf52e0bc58d9f"
  end

  on_intel do
    url "https://github.com/jayprio/beam-cli/releases/download/v0.1.0/beam_darwin_amd64.tar.gz"
    sha256 "70702bd4b4b773c962951f453c4ab6d7b592d4d59ed698630f76c92153192eb2"
  end

  def install
    bin.install "beam"
  end

  test do
    assert_match "beam", shell_output("#{bin}/beam --help")
  end
end
