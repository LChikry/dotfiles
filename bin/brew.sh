#!/usr/bin/env zsh

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not installed. Installing Homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Attempt to set up Homebrew PATH automatically for this session
    if [ -x "/opt/homebrew/bin/brew" ]; then
        # For Apple Silicon Macs
        echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
        export PATH="/opt/homebrew/bin:$PATH"

        # Also add it permanently to ~/.zshrc if not already there
        if ! grep -q "/opt/homebrew/bin" ~/.zshrc; then
            echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
            echo "Added Homebrew to PATH in ~/.zshrc for future sessions."
        fi
    fi
else
    echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
    echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
    exit 1
fi


# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup


# installing all packages and applications
brew bundle install --file ~/.dotfiles/bin/Brewfile


# Get the path to Homebrew's zsh
BREW_ZSH="$(brew --prefix)/bin/zsh"
# Check if Homebrew's zsh is already the default shell
if [ "$SHELL" != "$BREW_ZSH" ]; then
    echo "Changing default shell to Homebrew zsh"
    # Check if Homebrew's zsh is already in allowed shells
    if ! grep -Fxq "$BREW_ZSH" /etc/shells; then
        echo "Adding Homebrew zsh to allowed shells"
        echo "$BREW_ZSH" | sudo tee -a /etc/shells >/dev/null
    fi
    # Set the Homebrew zsh as default shell
    chsh -s "$BREW_ZSH"
    echo "Default shell changed to Homebrew zsh."
else
    echo "Homebrew zsh is already the default shell. Skipping configuration."
fi



# Set the Homebrew Python path if it's not already set
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* && ":$PATH:" != *":/usr/local/bin:"* ]]; then
    echo "Setting Homebrew Python path to PATH..."

    # Check if Apple Silicon or Intel Mac, then add the correct path
    if [[ "$(uname -m)" == "arm64" ]]; then
        echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc  # For Apple Silicon
    else
        echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc  # For Intel Macs
    fi
    
    echo "Homebrew Python path added to PATH."
else
    echo "Homebrew Python path is already set in PATH."
fi

# remove the prompt of conda since it is done by Starship
conda config --set changeps1 False