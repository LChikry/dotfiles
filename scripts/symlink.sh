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
# Loop through all files in the config directory
for file in "${configdir}"/*; do
    # Skip unwanted files (e.g., .DS_Store)
    if [[ "$(basename "$file")" == ".DS_Store" ]]; then
        continue
    fi
    # Get the filename without the path (e.g., "aerospace.toml" from "/path/to/aerospace.toml")
    filename=$(basename "$file")

    # Extract the base name without the extension to use as the directory name
    appname="${filename%.*}"

    # Define the target directory in ~/.config (e.g., ~/.config/aerospace/)
    target_dir="${HOME}/.config/${appname}"
    
    # Create the directory if it doesn't exist
    mkdir -p "${target_dir}"

    # Force symlink creation: this will overwrite any existing file or symlink
    echo "Creating symlink for ${file} -> ${target_dir}/${filename}"
    ln -sf "${file}" "${target_dir}/${filename}"
done