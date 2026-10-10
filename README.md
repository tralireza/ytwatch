# ytwatch

A lightweight macOS clipboard monitor written in Swift that automatically detects YouTube links copied to your clipboard and triggers playback or downloading via a custom shell function.

## Features

- **Instant Detection**: Continuously polls `NSPasteboard` to catch copied YouTube URLs (`youtube.com/watch?v=...` or `youtu.be/...`).
- **Asynchronous Execution**: Runs background tasks without blocking clipboard polling.
- **Custom Shell Integration**: Automatically sources `~/.bash_profile` and executes your custom `v` command (e.g. `mpv`, `yt-dlp`).

## Requirements

- macOS
- Swift 5.7+ (supports regex literals)
- Bash environment with a configured `v` function or alias in `~/.bash_profile`.

## Installation & Building

Clone the repository and build using `make`:

```bash
git clone https://github.com/tralireza/ytwatch.git
cd ytwatch
make
```

This compiles `ytwatch.swift` into the executable binary `ytwatch`.

## Usage

Run the monitor in your terminal:

```bash
./ytwatch
```

Press `Ctrl + C` to exit.
