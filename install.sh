xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file ~/.setup/config/Brewfile

# first delete file if they doesn't exist
ln -s ~/.setup/dotfiles/.zshrc ~/.zshrc
ln -s ~/.setup/dotfiles/.gitignore ~/.gitignore
ln -s ~/.setup/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.setup/config/aerospace.toml ~/.config/aerospace/aerospace.toml


