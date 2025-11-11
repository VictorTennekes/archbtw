# ==============================================================================
# VARIABLES
# ==============================================================================
# Assume scripts are in a 'scripts' subdirectory
INSTALL_SCRIPT ?= scripts/install
CLEAN_SCRIPT ?= scripts/clean

# ==============================================================================
# MAIN TARGETS
# ==============================================================================
# Default target when running `make`
all: install

# Check if paru exists, and install if missing
check_paru:
	@command -v paru >/dev/null 2>&1 || { \
		echo "Paru not found. Installing..."; \
		sudo pacman -S --needed --noconfirm base-devel git; \
		git clone https://aur.archlinux.org/paru.git /tmp/paru; \
		cd /tmp/paru && makepkg -si --noconfirm; \
		rm -rf /tmp/paru; \
	}

# Generate package list from current system
generate_pkglist:
	@echo "Generating package list..."
	pacman -Qqe > requirements/pkglist.txt
	paru -Qqm >> requirements/pkglist.txt

# Main target for install, depends on check_paru and generate_pkglist
install: check_paru configs
	@echo "Installing packages..."
	paru -S --needed - < requirements/pkglist.txt
	@echo "✅ All setup complete!"

# The clean target now calls the clean script and removes downloaded files.
clean:
	@echo "🧹 Cleaning up dotfiles..."
	@bash $(CLEAN_SCRIPT)
	@echo "🧼 Clean complete."

# ==============================================================================
# CONFIGURATION & THEMES
# ==============================================================================
# This single target handles all configuration symlinking by calling your script.
# It also includes the logic for downloading themes.
configs:
	@echo "🔗 Symlinking configuration files..."
	@bash $(INSTALL_SCRIPT)

# ==============================================================================
# PHONY TARGETS
# ==============================================================================
# Prevents conflicts with any files that might have the same name as a target.
.PHONY: all install clean configs
