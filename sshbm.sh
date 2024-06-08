#!/bin/bash

SSH_CONFIG_FILE="/home/$USER/.ssh/config"
SSH_BOOKMARKS_ARRAY=()

while IFS= read -r LINE
do
    if [[ $LINE == *"Host "* ]]; then
        HOST_LABEL="Host "
        HOST=${LINE/#$HOST_LABEL}
        echo $HOST
        SSH_BOOKMARKS_ARRAY+=($HOST)
    fi
done < "$SSH_CONFIG_FILE"

declare -a SSH_BOOKMARKS_DIALOG_ARRAY=()

for index in "${!SSH_BOOKMARKS_ARRAY[@]}"; do
  SSH_BOOKMARKS_DIALOG_ARRAY+=("$index" "${SSH_BOOKMARKS_ARRAY[index]}")
done

CHOOSEN_SSH_BOOKMARK_INDEX=$(dialog --clear \
                --title "Choose a SSH bookmark" \
                --menu "Bookmarks" \
                15 40 4 \
                "${SSH_BOOKMARKS_DIALOG_ARRAY[@]}" \
                2>&1 >/dev/tty)
clear

CHOOSEN_SSH_BOOKMARK=${SSH_BOOKMARKS_ARRAY[$CHOOSEN_SSH_BOOKMARK_INDEX]}

if [ -n "$CHOOSEN_SSH_BOOKMARK_INDEX" ]; then
    ssh $CHOOSEN_SSH_BOOKMARK
else
    echo "You did not choose a SSH bookmark!"
fi