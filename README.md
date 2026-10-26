# homebrew-beam

Homebrew tap for [beam](https://github.com/jayprio/beam-cli).

## Install

```sh
brew tap jayprio/beam
brew install beam
```

Installs a prebuilt binary — no Go toolchain required locally.

## How it's built

`jayprio/beam-cli`'s `.github/workflows/release.yml` builds darwin/amd64
and darwin/arm64 binaries on every `vX.Y.Z` tag push and publishes them
as release assets with sha256 checksums. `Formula/beam.rb` downloads
the matching arch's tarball (`on_arm`/`on_intel`) and just installs the
binary — no build step on the user's machine.

## Releasing a new version

1. Tag and push a new version in `beam-cli` (e.g. `git tag v0.2.0 &&
   git push origin v0.2.0`) — this triggers the release build.
2. Once the release's assets are up, download both tarballs and
   compute their sha256 (`shasum -a 256 <file>`), or just fetch the
   `.sha256` files CI publishes alongside them.
3. Update `Formula/beam.rb`'s `version`, `url`s, and `sha256`s to
   match, then commit and push.
