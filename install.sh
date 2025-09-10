#!/usr/bin/env zsh

# Ask for the administrator password upfront
echo "Requesting administrator privileges...."
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
SUDO_PID=$!

# Cleanup function to kill background sudo process
cleanup() {
    kill $SUDO_PID 2>/dev/null
}
trap cleanup EXIT

SCRIPT=$(realpath "$0")
DOTFILE_PATH=$(dirname "$SCRIPT")

read -p "Start symlinking files to your computer [Y/N]: " wantSymlink

if [[ "$wantSymlink" == "Y" || "$wantSymlink" == "y" || "$wantSymlink" == "yes" || "$wantSymlink" == "Yes" || "$wantSymlink" == "YES" ]]; then

    # Make all .sh files in the bin directory executable
    echo "Making shell scripts executable..."
    chmod +x "${DOTFILE_PATH}"/bin/*.sh

    # Execute symlinks.sh first
    if [[ -f "${DOTFILE_PATH}/bin/symlinks.sh" ]]; then
        echo "Executing ${DOTFILE_PATH}/bin/symlinks.sh..."
        "${DOTFILE_PATH}/bin/symlinks.sh"
        if [[ $? -ne 0 ]]; then
            echo "Error: symlinks.sh failed to execute properly."
            exit 1
        fi
    else
        echo "Warning: ${DOTFILE_PATH}/bin/symlinks.sh not found. Skipping initial execution."
        exit 1
    fi
else
    echo "Skipping creation of symbolic links!"
fi

read -p "Start executing Apple scripts [Y/N]: " wantAppleExe
if [[ "$wantAppleExe" == "Y" || "$wantAppleExe" == "y" || "$wantAppleExe" == "yes" || "$wantAppleExe" == "Yes" || "$wantAppleExe" == "YES" ]]; then

    # Running Apple-specific scripts
    echo "Executing AppleScript files..."
    for script in "${DOTFILE_PATH}"/bin/*.applescript; do
        if [[ -f "$script" ]]; then
            echo "Executing $(basename "$script")..."
            osascript "$script"
            if [[ $? -ne 0 ]]; then
                echo "Warning: $(basename "$script") failed to execute."
            fi
        else
            echo "No AppleScript files found in ${DOTFILE_PATH}/bin/"
            break
        fi
    done
else
    echo "Skipping execution of Apple scripts!"
fi

read -p "Start executing bin files [Y/N]: " wantBinExe
if [[ "$wantBinExe" == "Y" || "$wantBinExe" == "y" || "$wantBinExe" == "yes" || "$wantBinExe" == "Yes" || "$wantBinExe" == "YES" ]]; then

    # Loop through and execute other .sh files
    echo "Executing shell script files..."
    for script in "${DOTFILE_PATH}"/bin/*.sh; do
        [[ "$(basename "$script")" == "symlinks.sh" ]] && continue # Skip symlinks.sh
        
        if [[ -f "$script" ]]; then
            echo "Executing $(basename "$script")..."
            "$script"
            if [[ $? -ne 0 ]]; then
                echo "Warning: $(basename "$script") failed to execute."
            fi
        else
            echo "No additional shell scripts found in ${DOTFILE_PATH}/bin/"
            break
        fi
    done
else
    echo "Skipping execution of bin files!"
fi

echo "Installation complete!"