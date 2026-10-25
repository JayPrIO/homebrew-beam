# Homebrew formula for beam — syncs active repo files between Macs via
# iCloud Drive, bypassing node_modules/vendor/build/etc via .beamignore.
#
# No tagged release exists yet, so this builds straight off the `main`
# branch (no pinned sha256 — Homebrew treats a git `url` this way as a
# rolling/HEAD-style install). Once a tagged release exists, replace
# `url`/`version` below with a versioned tarball + sha256 (see the
# commented block) for reproducible installs.
class Beam < Formula
  desc "Sync active repository files between Macs via iCloud Drive"
  homepage "https://github.com/jayprio/beam-cli"
  url "https://github.com/jayprio/beam-cli.git", branch: "main"
  version "0.1.0"
  license "MIT"

  # Once tagged releases exist, prefer a pinned, reproducible source instead:
  # url "https://github.com/jayprio/beam-cli/archive/refs/tags/vX.Y.Z.tar.gz"
  # sha256 "REPLACE_WITH_SHA256_OF_THE_RELEASE_TARBALL"
  # version "X.Y.Z"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "beam", shell_output("#{bin}/beam --help")
  end
end
