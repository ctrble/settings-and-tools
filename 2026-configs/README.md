# settings-and-tools

ya know, useful shit like dotfiles

**→ [SETUP.md](SETUP.md)** — new machine setup, migration steps, verification, troubleshooting.

---

## What's in here

| Path | What it is |
|---|---|
| `shell/.zshrc` | zsh + Oh My Zsh (plugins only — **not** the prompt) |
| `shell/starship.toml` | the prompt |
| `terminal/ghostty/config` | Ghostty — primary terminal |
| `terminal/zed/settings.json` | Zed — editor + integrated terminal |
| `Brewfile` | everything installed, and where it came from |
| `install.sh` | symlinks the above into place, with backups |
| `keyboard-atom66/` | **Atom66 mechanical keyboard.** Not the Atom editor. |
| `archive/` | old configs kept for reference: iTerm2, Unity, M1-2021 notes |

## Quick start

```bash
git clone https://github.com/ctrble/settings-and-tools.git
cd settings-and-tools
brew bundle install
./install.sh --dry-run && ./install.sh
exec zsh
```

Full steps, including Oh My Zsh and the four plugin clones that Homebrew doesn't handle: **[SETUP.md](SETUP.md)**.

## The three rules

1. 🔤 **Font is a terminal setting.** Never in `.zshrc`.
2. 🚀 **The prompt is Starship.** Not Spaceship, not `ZSH_THEME`.
3. 📦 **If it's installed, it's in the `Brewfile`.**

## Not in use

Retired, kept in `archive/` only as a record: **iTerm2** (→ Ghostty), **Warp** (GUI/account-backed config, couldn't be version-controlled), **Spaceship prompt** (→ Starship), **`homebrew/cask-fonts`** (deprecated 2024; fonts are in the main cask repo).
