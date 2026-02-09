#!/bin/bash

USERNAME=$1
ARCHIVE_DIR=$2
DIR_PATH="./$ARCHIVE_DIR"  
ARCHIVE_FILE="$ARCHIVE_DIR.tar.gz"

#1)Check if the directory we want to create already exists, and if it does, remove it.
if [ -d "$DIR_PATH" ]; then
    echo "Directory $DIR_PATH exists. Removing..."
    rm -r "$DIR_PATH"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to remove $DIR_PATH"
        exit 1
    fi
    echo "Directory removed"
fi

# 2)Create the directory & create 4 files in this directory 
mkdir -p "$DIR_PATH" && touch "$DIR_PATH"/{main.c,main.h,hello.c,hello.h}
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory or files"
    exit 1
fi
echo "Directory and files created successfully"

# 3)Loop on each of these files and write in them “this file is named ….”
for FILE in "$DIR_PATH"/{main.c,main.h,hello.c,hello.h}; do
    echo "This file is named $(basename "$FILE")" >> "$FILE"
done
if [ $? -ne 0 ]; then
    echo "Error: Failed to write content to files"
    exit 1
fi
echo "Files content updated successfully"

# 4)Compress this directory into a tar file
tar -czf "$ARCHIVE_DIR.tar.gz" "$DIR_PATH"
if [ $? -ne 0 ]; then
    echo "Error: Failed to archive the directory"
    exit 1
fi
echo "Directory archived as $ARCHIVE_DIR.tar.gz"

# Move archive to new user's home directory
sudo mv "$ARCHIVE_DIR.tar.gz" "/home/$USERNAME/"
if [ $? -ne 0 ]; then
    echo "Error: Failed to move archive to /home/$USERNAME/"
    exit 1
fi
echo "Archive moved to /home/$USERNAME/"

# Change ownership of the archive file to the new user
sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/$ARCHIVE_DIR.tar.gz"		
if [ $? -ne 0 ]; then
    echo "Error: Failed to change ownership of the archive"
    exit 1
fi
echo "Ownership of archive changed to $USERNAME"

# Extract archive in the new user's home directory (run as the new user)
sudo -u "$USERNAME" bash -c "tar -xzf '/home/$USERNAME/$ARCHIVE_DIR.tar.gz' -C '/home/$USERNAME/'"	
	#by --help and AI help in command
if [ $? -ne 0 ]; then
    echo "Error: Failed to extract archive in /home/$USERNAME/"
    exit 1
fi
echo "Archive extracted successfully in /home/$USERNAME/"

# Clean up archive file after extraction
sudo rm "/home/$USERNAME/$ARCHIVE_DIR.tar.gz"
if [ $? -ne 0 ]; then
    echo "Error: Failed to delete archive after extraction"
    exit 1
fi
echo "Cleanup complete."

