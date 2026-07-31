# Setup

Terminal environment runbook. Two paths: **[new machine](#part-1--new-machine)** (from scratch) and **[existing machine](#part-2--existing-machine-migration)** (migrate off the old setup).

---

## The mental model

Read this once and most future confusion disappears.

| Layer | Tool | Config file |
|---|---|---|
| Shell | zsh (ships with macOS) | `~/.zshrc` |
| Plugins | Oh My Zsh — **plugins only, not the prompt** | `~/.zshrc` |
| Prompt | **Starship** | `~/.config/starship.toml` |
| Font | SpaceMono Nerd Font | **per-terminal, never in `.zshrc`** |
| Terminal | Ghostty (primary), Zed (in-editor) | `~/.config/ghostty/config`, `~/.config/zed/settings.json` |
| Packages | Homebrew | `Brewfile` |

**Three rules that cover every past mistake:**

1. 🔤 **Font is a terminal setting, not a shell setting.** No amount of digging in `.zshrc` will tell you why glyphs are broken.
2. 🚀 **The prompt is Starship.** Not Spaceship, not `ZSH_THEME`. If the prompt looks wrong, edit `starship.toml`.
3. 📦 **If it's installed, it's in the `Brewfile`.** If it's not in the Brewfile, it isn't managed and future-you won't find it.

---

## Part 1 — New machine

### 1. Command line tools + Homebrew

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-install instructions to add `brew` to your PATH. The `.zshrc` in this repo already handles both Apple Silicon and Intel prefixes, so this only matters for the current shell.

### 2. Clone this repo

```bash
mkdir -p ~/Developer && cd ~/Developer
git clone https://github.com/ctrble/settings-and-tools.git
cd settings-and-tools
```

### 3. Install everything

```bash
brew bundle install
```

Do **not** `brew tap homebrew/cask-fonts`. It's deprecated and empty — all fonts live in the main cask repo now. Any guide telling you to tap it is stale.

### 4. Install Oh My Zsh

Not a Homebrew package. The installer will overwrite `~/.zshrc`, so let it, then re-link in step 6.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 5. Clone the custom plugins

Also not Homebrew packages. All four are git clones into `$ZSH/custom/plugins/`:

```bash
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

git clone https://github.com/lukechilds/zsh-nvm              "$ZSH_CUSTOM/plugins/zsh-nvm"
git clone https://github.com/zsh-users/zsh-autosuggestions   "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/chrisands/zsh-yarn-completions  "$ZSH_CUSTOM/plugins/zsh-yarn-completions"
```

`git` and `zsh-interactive-cd` are built into Oh My Zsh — nothing to clone.

### 6. Link the configs

```bash
./install.sh --dry-run   # look first
./install.sh
```

### 7. Set up fzf

```bash
"$(brew --prefix)/opt/fzf/install"
```

Answer yes to the key bindings prompt. This creates `~/.fzf.zsh`, which `.zshrc` sources conditionally.

### 8. Restart the shell

```bash
exec zsh
```

First launch will be slow — `zsh-nvm` installs nvm on its first run.

### 9. Node

```bash
nvm install --lts
nvm alias default lts/*
```

### 10. VS Code `code` shim (optional)

In VS Code: `cmd+shift+P` → *Shell Command: Install 'code' command in PATH*.

### 11. Verify

Jump to the [verification checklist](#verification).

---

## Part 2 — Existing machine migration

Run in order. Each step is independently safe.

### 1. Back up what you have

```bash
mkdir -p ~/dotfiles-backup
cp ~/.zshrc ~/dotfiles-backup/.zshrc.old
cp ~/.config/starship.toml ~/dotfiles-backup/starship.toml.old
```

### 2. Untap the deprecated font tap

This is the deprecation warning you've been seeing.

```bash
brew untap homebrew/cask-fonts
```

### 3. Delete the dead Spaceship install

Unreferenced since June 2021 — `ZSH_THEME` pointed at `robbyrussell`, and Starship overrode that anyway.

```bash
rm ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
rm -rf ~/.oh-my-zsh/custom/themes/spaceship-prompt
```

### 4. Find and re-home SpaceMono

It's currently unmanaged — not in Homebrew, not in `~/Library/Fonts`:

```bash
find ~/Library/Fonts /Library/Fonts -iname '*SpaceMono*'
```

Delete whatever that turns up, then install the managed version:

```bash
brew install --cask font-space-mono-nerd-font
```

If Homebrew complains about existing files, the manual copies weren't fully removed.

### 5. Drop the second font

Ghostty and Zed both do glyph fallback natively. The "Hack for icons + SpaceMono for text" split was an iTerm2-era workaround.

```bash
brew uninstall --cask font-hack-nerd-font
```

### 6. Capture the real package list

Do this **on this machine**, since it's the one with the working setup. It will overwrite the starter `Brewfile` in this repo with the truth:

```bash
cd ~/Developer/settings-and-tools
brew bundle dump --describe --force
git diff Brewfile          # sanity-check before committing
```

Look for `agrinman/tap` and `anomalyco/tap` in the output — decide whether you still use them.

### 7. Review the prompt config

`shell/starship.toml` is your config, cleaned up — three behavior changes worth knowing before you link it:

- `$status` now actually works if you want it (it was silently a no-op; the module is disabled by default)
- the docker segment's double-space is fixed
- the ~50-module hand-enumerated list is replaced by `$all`, so line 2 uses Starship's default ordering instead of yours

Diff it against what you're running before overwriting:

```bash
diff <(sed 's/#.*//' ~/.config/starship.toml) <(sed 's/#.*//' shell/starship.toml)
```

### 8. Link the new configs

```bash
./install.sh --dry-run
./install.sh
exec zsh
```

### 9. Set the font in each terminal

- **Ghostty** — handled by `install.sh` via the linked config. Verify the family name resolves: `ghostty +list-fonts | grep -i spacemono`
- **Zed** — handled by `install.sh`. ⚠️ Your previous settings were backed up, not merged. Reconcile from the `.backup-*` file.
- **Warp** — nothing to do. See below.

### 10. Retire Warp

Warp's config is GUI + account-backed state — it's the only piece of this setup that can't live in this repo. That's the reason to drop it, more than any feature comparison.

```bash
brew uninstall --cask warp   # if it was brew-installed; otherwise drag to Trash
```

Leftovers to clean: `~/.warp/`, and check `~/Library/Application Support/dev.warp.Warp-Stable`.

### 11. Commit

```bash
git add -A
git commit -m "Modernize: Ghostty + Zed + Starship, drop Warp/iTerm/Spaceship"
git push
```

---

## Verification

```bash
# Prompt is Starship, and only Starship
echo "$ZSH_THEME"              # → empty
command -v starship            # → a path

# Deprecated tap is gone
brew tap | grep cask-fonts     # → no output

# Font is brew-managed
brew list --cask | grep -i nerd    # → font-space-mono-nerd-font, and nothing else

# Configs are symlinks into the repo
ls -la ~/.zshrc ~/.config/starship.toml ~/.config/ghostty/config

# Brewfile matches reality
brew bundle check --verbose
```

Visual checks:

- [ ] Git branch glyph renders in the prompt (not a `▯` box)
- [ ] Node version and Docker context show up in the right directories
- [ ] Ghostty and Zed's terminal look identical
- [ ] Autosuggestions appear as you type (grey ghost text)
- [ ] Syntax highlighting colors commands green/red as you type
- [ ] `cd **<tab>` opens an fzf picker

---

## Troubleshooting

**Glyphs show as boxes (▯) or question marks.**
Terminal font problem, not a shell problem. Check the family name matches exactly: `ghostty +list-fonts | grep -i spacemono`. In Ghostty specifically this shouldn't happen at all — it bundles Nerd Font symbols.

**A glyph shows as nothing at all — no box, just a space.**
Different failure, and it's *not* the font. The character is missing from the config file. Nerd Font glyphs live in the Unicode Private Use Area, so they're invisible in most editors and survive copy/paste, chat, and clipboard round-trips poorly — they get silently stripped to whitespace. Check with:

```bash
grep -n 'format' ~/.config/starship.toml | cat -A
```

If you see `[ $version]` with nothing between the bracket and the `$`, the glyph is gone. This is why `starship.toml` writes them as TOML `\u` escapes (`"[\ue718 $version]..."`) rather than literal characters — an escape is plain ASCII, greppable, self-documenting, and can't be destroyed in transit. Note the quote style is load-bearing: basic (double-quoted) TOML strings process `\u`, literal (single-quoted) strings do not.

Find any glyph's codepoint at <https://www.nerdfonts.com/cheat-sheet>.

**Icons render but look cramped or overlap text.**
The `Mono` variant single-widths its glyphs. Change `SpaceMono Nerd Font Mono` → `SpaceMono Nerd Font` in both terminal configs. Don't add a second font.

**Zed's terminal font changed when I changed my editor font.**
Expected: if `terminal.font_fallbacks` is unset, Zed's terminal inherits `buffer_font_fallbacks`. Both are set explicitly in this repo's `settings.json` to prevent it.

**Prompt looks wrong / I want to change a segment.**
`~/.config/starship.toml`. Nothing else. Not `.zshrc`, not a theme file. Docs: <https://starship.rs/config/>

**Shell startup got slow.**
Usually nvm. Profile it: `time zsh -i -c exit`. If nvm dominates, `zsh-nvm` supports lazy loading — or consider `fnm`/`mise`, which are substantially faster. Not urgent.

**`brew install --cask font-...` says files already exist.**
A manually installed copy is still in `~/Library/Fonts` or `/Library/Fonts`. Remove it and retry.

**A guide tells me to `brew tap homebrew/cask-fonts`.**
The guide is stale. The tap was deprecated in 2024 and its contents moved to the main cask repo. `brew install --cask font-<name>` works with no tap.

---

## Repo layout

```
settings-and-tools/
├── README.md
├── SETUP.md                    ← you are here
├── Brewfile                    ← regenerate with `brew bundle dump --describe --force`
├── install.sh                  ← symlinks configs into place
├── shell/
│   ├── .zshrc
│   └── starship.toml           ← the prompt; three-line layout
├── terminal/
│   ├── ghostty/config
│   └── zed/settings.json
├── keyboard-atom66/            ← Atom66 mechanical KEYBOARD (not the editor)
└── archive/                    ← kept for reference, not in use
    ├── M1-2021/
    ├── iTerm/
    └── Unity Settings/
```

### Repo reorg commands

Run once, on either machine:

```bash
git mv atom66 keyboard-atom66
mkdir -p archive
git mv M1-2021 "Unity Settings" iTerm archive/
git commit -m "Reorganize: clarify atom66 is a keyboard, archive unused configs"
```

The `atom66` rename exists purely so future-you doesn't spend ten minutes wondering whether it's the dead text editor. Same reason this document exists.
