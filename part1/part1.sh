#!/bin/bash

if [ "$USER" != "root" ]; then
    echo "Error: This script must be run with sudo permissions."
    exit 1
fi


if [ -z "$1" ]; then
    echo "Error: first arguments is missing."
    exit 1
fi
if [ -z "$2" ]; then
    echo "Error: second arguments is missing."
    exit 1
fi

if [ -z "$3" ]; then
    echo "Error: third arguments is missing."
    exit 1
fi

USERNAME=$1
USERPASS=$2
GROUPNAME=$3


echo "Username: $USERNAME"
echo "Password: (hidden for security)"
echo "Group Name: $GROUPNAME"


useradd -m -s /bin/bash $USERNAME
if [ $? -ne 0 ]; then
    echo "Error: Failed to create user $USERNAME."
    exit 1
fi

echo "User $USERNAME created successfully."


echo "$USERNAME:$USERPASS" | chpasswd
if [ $? -ne 0 ]; then
    echo "Error: Failed to set password for user $USERNAME."
    exit 1
fi

echo "Password set successfully."


echo "User information before group assignment:"
id $USERNAME


groupadd -g 200 $GROUPNAME
if [ $? -ne 0 ]; then
    echo "Error: Failed to create group $GROUPNAME."
    exit 1
fi

echo "Group $GROUPNAME created successfully with GID 200."


usermod -aG $GROUPNAME $USERNAME
if [ $? -ne 0 ]; then
    echo "Error: Failed to add user $USERNAME to group $GROUPNAME."
    exit 1
fi

echo "User $USERNAME added to group $GROUPNAME successfully."
id $USERNAME


usermod -u 1600 -g $GROUPNAME $USERNAME
if [ $? -ne 0 ]; then
    echo "Error: Failed to modify user $USERNAME UID or primary group."
    exit 1
fi

echo "User $USERNAME modified successfully with UID=1600 and primary group=$GROUPNAME."


echo "User information after final modifications:"
id $USERNAME

echo "Script execution completed successfully."

