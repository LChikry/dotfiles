#!/usr/bin/env zsh


# Set the directory where your dotfiles are stored
dotfiles_dir="${HOME}/.setup/dotfiles"
# Loop through all files in the dotfiles directory (dotfiles start with a dot)
for file in "${dotfiles_dir}/."*; do
    # Skip unwanted files (e.g., .DS_Store)
    if [[ "$(basename "$file")" == ".DS_Store" ]]; then
        continue
    fi
    # Get the filename without the path (e.g., ".bashrc" from "/home/user/.setup/dotfiles/.bashrc")
    filename=$(basename "$file")

    # Define the target location in the home directory (e.g., ~/.bashrc)
    target="${HOME}/${filename}"

    # Create symlink (force overwrite if exists)
    ln -sf "${file}" "${target}"
    echo "Symlink created: ${file} -> ${target}"
done


# Ensure the ~/.config directory exists
mkdir -p "${HOME}/.config"
# Set the directory where your config files are stored
configdir="${HOME}/.setup/config"
# Loop through all items in the config directory
for item in "${configdir}"/*; do
    # Skip unwanted items (e.g., .DS_Store or non-directories)
    if [[ "$(basename "$item")" == ".DS_Store" || ! -d "$item" ]]; then
        continue
    fi

    # Get the directory name without the path
    dirname=$(basename "$item")

    # Define the target path in ~/.config
    target="${HOME}/.config/${dirname}"

    # If the target exists, remove it (symlink or directory)
    if [[ -e "$target" || -L "$target" ]]; then
        echo "Removing existing item at ${target}"
        rm -rf "$target"
    fi

    # Create the symlink for the directory
    echo "Creating symlink for directory: ${item} -> ${target}"
    ln -sfn "${item}" "${target}"
done


if [[ "$SHELL" == *"zsh"* ]]; then
    source ~/.zshrc
elif [[ "$SHELL" == *"bash"* ]]; then
    source ~/.bashrc
else
    echo 'Unknown shell!'
fi