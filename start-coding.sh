#!/bin/bash

# start-coding.sh - set up .gitconfig, decrypt coding-key, and feed it to ssh-add

/opt/gopherbot/gopherbot decrypt -f $HOME/custom/coding-key > $HOME/coding_key
chmod 0600 $HOME/coding_key
cat > $HOME/.gitconfig <<EOF
# This is Git's per-user configuration file.
[user]
# Please adapt and uncomment the following lines:
	name = David Parsley
	email = parsley@linuxjedi.org
[pull]
	rebase = true
EOF
exec ssh-add $HOME/coding_key