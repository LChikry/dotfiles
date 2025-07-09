#!/usr/bin/env zsh

# Ask for the administrator password upfront
echo "requesting administrator privileges...."
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

SCRIPT=$(realpath "$0")
DOTFILE_PATH=$(dirname "$SCRIPT")

# make all .sh files in the bin directory executable
chmod +x ""${DOTFILE_PATH}"/bin/*.sh"

# Execute symlinks.sh first
if [[ -f ""${DOTFILE_PATH}"/bin/symlinks.sh" && -x ""${DOTFILE_PATH}"/bin/symlinks.sh" ]]; then
    echo "Executing "${DOTFILE_PATH}"/bin/symlinks.sh..."
    "${DOTFILE_PATH}"/bin/symlinks.sh
else
    echo "Warning: "${DOTFILE_PATH}"/bin/symlinks.sh not found or not executable. Skipping initial execution."
    exit 1
fi

# Loop through and execute other .sh files
for script in "${DOTFILE_PATH}"/bin/*.sh; do
    [[ "$(basename "$script")" == "symlinks.sh" ]] && continue # Skip symlinks.sh

    if [[ -f "$script" && -x "$script" ]]; then
        echo "Executing $script..."
        "$script"
    else
        echo "Skipping $script (not executable or not a file)."
    fi
done


# Running apple specific scripts
for script in "${DOTFILE_PATH}"/bin/*.applescript; do
    if [[ -f "$script" ]]; then
        echo "Executing $script..."
        osascript "$script"
    else
        echo "Skipping $script (not a file)."
    fi
done


echo "Installation Complete!"