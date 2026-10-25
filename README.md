# homebrew-beam

Homebrew tap for [beam](https://github.com/jayprio/beam-cli).

## Install

```sh
brew tap jayprio/beam
brew install beam
```

## Prerequisites for this tap to actually work

This formula builds from the `beam-cli` repo's `main` branch (no tagged
release exists yet), so before `brew tap`/`brew install` will succeed:

1. `beam-cli` must be pushed to `https://github.com/jayprio/beam-cli`
   (it currently has no git remote configured).
2. This directory must itself be a git repo, pushed to GitHub as
   `https://github.com/jayprio/homebrew-beam` — Homebrew's tap
   naming convention requires the `homebrew-` prefix, and `brew tap
   jayprio/beam` expects to find it there.

Once both exist:

```sh
cd /Users/jayprajapati/Developer/go-projects/homebrew-beam
git init
git add .
git commit -m "beam homebrew formula"
git remote add origin git@github.com:jayprio/homebrew-beam.git
git push -u origin main
```

## Updating to a tagged release

Once `beam-cli` has a tagged release, swap `Formula/beam.rb`'s `url`/
`version` for the commented-out versioned-tarball block (pin a real
`sha256`, computed via `shasum -a 256` on the release tarball) instead
of building off `main` — see the comments in the formula.
