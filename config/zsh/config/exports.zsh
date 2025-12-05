# --- App Configurations ---
export FZF_DEFAULT_COMMAND='fd --type f'
export STARSHIP_CONFIG="$HOME/.config/zsh/starship.toml"
export TERMINAL=ghostty

# --- Terminal Colors ---
export CLICOLOR=1
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export QT_QPA_PLATFORM=wayland

# --- History ---
export HISTSIZE=10000
export SAVEHIST=10000
