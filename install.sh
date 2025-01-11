#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make all .sh files in the bin directory executable
chmod +x ./bin/*.sh

# Loop through all .sh files in the bin directory and execute them
for script in ./bin/*.sh; do
    if [[ -f "$script" && -x "$script" ]]; then
        echo "Executing $script..."
        "$script"
    else
        echo "Skipping $script (not executable or not a file)."
    fi
done

echo "Installation Complete!"