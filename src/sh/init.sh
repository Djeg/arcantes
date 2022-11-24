# We first need to install the standard packages such as
# git, yay and others

# Setup usefull variables
DIR="$( cd "$( dirname "$0" )" && pwd )" # current working directory
OUT_FILE=$DIR/log/out
CONFIG_DIR=$HOME/.config
BIN_DIR=$HOME/.bin
LOG_DIR=$HOME/.log
TMP_DIR=$HOME/.tmp

# includes the setup files
source src/sh/welcome.sh
source src/sh/setupFolders.sh
source src/sh/installPackages.sh

# Define the initialization function
init()
{
  welcome
  setupFolders
  installPackages
}

# Install git
#yes O | sudo pacman -Sq git lua
#
## Setup the .config folders
#echo "Setup home config folder"
#if [[ ! -d "$HOME/.config" ]]
#then
#  mkdir "$HOME/.config"
#  echo "done"
#else
#  echo "already exists"
#fi
#
## Setup the .bin folders
#echo "Setup home bin folder"
#if [[ ! -d "$HOME/.bin" ]]
#then
#  mkdir "$HOME/.bin"
#  echo "done"
#else
#  echo "already exists"
#fi
#
## Setup git configuration
#echo "Setup git configuration"
#if [[ -f "$HOME/.gitconfig" ]]
#then
#  echo "\tRemoving existing configuration"
#  rm "$HOME/.gitconfig"
#fi
#echo "\tLinking configuration"
#ln -s $ROOT/etc/git/gitconfig $HOME/.gitconfig
#echo "done"
#
## Setup global gitignore
#echo "Setup git gnore"
#if [[ -f "$HOME/.gitignore" ]]
#then
#  echo "\tRemoving existing ignore"
#  rm "$HOME/.gitignore"
#fi
#echo "\tLinking ignore"
#ln -s $ROOT/etc/git/gitignore $HOME/.gitignore
#echo "done"
