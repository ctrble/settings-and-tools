# ═══════════════════════════════════════════════════════════════════
#  .zshrc — ctrble
#
#  THE FOUR DECISIONS (read this before you go spelunking):
#
#    1. Oh My Zsh  → plugin manager ONLY. It is NOT the prompt.
#    2. Starship   → the prompt.  Config: ~/.config/starship.toml
#    3. Nerd Font  → set PER-TERMINAL, never here.  See SETUP.md.
#    4. nvm        → via the zsh-nvm plugin.
#
#  Anything installed lives in the Brewfile. Full steps: SETUP.md
# ═══════════════════════════════════════════════════════════════════

# ── Homebrew ───────────────────────────────────────────────────────
# Handles both Apple Silicon (/opt/homebrew) and Intel (/usr/local).
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ── Oh My Zsh ──────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"

# Empty ON PURPOSE. Starship draws the prompt (bottom of this file).
# Setting a theme here just makes OMZ build a prompt that Starship
# immediately discards. This was the source of much confusion.
ZSH_THEME=""

# Auto-update OMZ without prompting.
# Replaces the deprecated DISABLE_UPDATE_PROMPT="true".
# MUST come before oh-my-zsh.sh is sourced.
zstyle ':omz:update' mode auto

# Plugin env vars — also must precede the source line below.
export NVM_AUTO_USE=true

# Order matters:
#   • zsh-nvm before any other node/nvm plugin
#   • zsh-syntax-highlighting ALWAYS last
# Custom plugins are NOT installed by Homebrew. They're git clones in
# $ZSH/custom/plugins/ — see SETUP.md, step 5.
plugins=(
  git                      # builtin
  zsh-interactive-cd       # builtin — requires fzf
  zsh-nvm                  # github.com/lukechilds/zsh-nvm
  zsh-yarn-completions     # github.com/chrisands/zsh-yarn-completions
  zsh-autosuggestions      # github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting  # github.com/zsh-users/zsh-syntax-highlighting  ← LAST
)

source "$ZSH/oh-my-zsh.sh"

# ── Tools ──────────────────────────────────────────────────────────
# fzf — powers zsh-interactive-cd
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# Docker Desktop (only exists once Docker Desktop has run once)
[ -f "$HOME/.docker/init-zsh.sh" ] && source "$HOME/.docker/init-zsh.sh"

# ── PATH ───────────────────────────────────────────────────────────
# The `code` shim comes from VS Code:
#   cmd+shift+P → "Shell Command: Install 'code' command in PATH"
export PATH="$HOME/.local/bin:$PATH"

# ── Prompt — KEEP LAST ─────────────────────────────────────────────
# starship.rs · config: ~/.config/starship.toml
eval "$(starship init zsh)"
