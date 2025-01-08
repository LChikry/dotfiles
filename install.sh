#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make all .sh files in the script directory executable
chmod +x ./script/*.sh

# Loop through all .sh files in the script directory and execute them
for script in ./script/*.sh; do
    if [[ -f "$script" && -x "$script" ]]; then
        echo "Executing $script..."
        "$script"
    else
        echo "Skipping $script (not executable or not a file)."
    fi
done

echo "Installation Complete!"