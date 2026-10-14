# Meeting.ai Homebrew Tap

The official [Homebrew](https://brew.sh) tap for [Meeting.ai](https://meeting.ai) command line tools.

## Formulas

| Formula | What it is | Source |
|---|---|---|
| [`memo`](Formula/memo.rb) | The Meeting.ai command line. Lets you, or the AI agent working for you, search meetings, read notes and transcripts, record a call, and manage contacts and Drive files from a terminal. | [meeting-ai/memo-cli](https://github.com/meeting-ai/memo-cli) |

Works on macOS (Apple Silicon and Intel) and Linux (arm64 and amd64).

## Install

```bash
brew install meeting-ai/tap/memo
```

That one command adds this tap and installs `memo`. If you prefer two steps:

```bash
brew tap meeting-ai/tap
brew install memo
```

## Get started

Sign in to Meeting.ai:

```bash
memo auth login
```

Then let your AI agents know how to use memo. This installs the bundled skill file into the
agent folders it finds on your machine:

```bash
memo install-skill-md
```

See the [memo README](https://github.com/meeting-ai/memo-cli#readme) for commands to try.

## Upgrade

```bash
brew update
brew upgrade memo
```

Use `brew upgrade` rather than `memo upgrade` when memo came from Homebrew. That way Homebrew
keeps track of the version you have.

## Uninstall

```bash
brew uninstall memo
brew untap meeting-ai/tap
```

Your sign-in and settings stay in `~/.config/memo`. Delete that folder to remove them too.

## Troubleshooting

**`memo` runs an older version after an upgrade.** You may also have a copy from the install
script in `~/.local/bin`. Check which one runs:

```bash
which -a memo
```

Remove the copy you don't want, or put `$(brew --prefix)/bin` first in your `PATH`.

**"existing credentials could not be decrypted".** Your saved sign-in came from a different
build of memo. Sign in again with `memo auth login`.

## How this tap is built

Each formula downloads the release archive for your platform straight from the tool's public
GitHub releases and checks it against the SHA-256 sum in that release's `checksums.txt`.
Nothing is rebuilt here.

## Links

- Website: https://meeting.ai
- CLI guide: https://meeting.ai/cli
- Support: support@meeting.ai
