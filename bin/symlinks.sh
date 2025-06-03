#!/usr/bin/env zsh
setopt null_glob  # Prevent errors when glob patterns match nothing

create_symlink() {
    config_dir="$1"
    target_dir="$2"

    for file in "${config_dir}/".* "${config_dir}/"*; do
        filename=$(basename "$file")

        if [[ "$filename" == "." || "$filename" == ".." || "$filename" == ".DS_Store" ]]; then
            continue
        fi

        target="${target_dir}/${filename}"
        ln -sf "$file" "$target"
        echo "Symlink created: $file -> $target"
    done
}

# for files in different specific places
extras_dir="${HOME}/.dotfiles/extras"
for item in "${extras_dir}"/*; do
    [[ -d "$item" ]] || continue
    dirname=$(basename "$item")

    case "$dirname" in
        vscode)
            create_symlink "${item}" "${HOME}/Library/Application Support/Code/User"
            ;;
        msword)
            create_symlink "${item}" "${HOME}/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Templates.localized"
            ;;
        *)
            echo "No handler for $dirname"
            ;;
    esac
done

# for files in HOME directory
dotfiles_dir="${HOME}/.dotfiles/dotfiles"
create_symlink "${dotfiles_dir}" "${HOME}"

# Symlinking the entire directory with exact name for .config directory in the HOME directory
mkdir -p "${HOME}/.config"
configdir="${HOME}/.dotfiles/config"
for item in "${configdir}"/*; do
    [[ -d "$item" ]] || continue
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