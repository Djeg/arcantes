# We first need to install the standard packages such as
# git, yay and others

# Setup usefull variables
DIR="$( cd "$( dirname "$0" )" && pwd )" # current working directory
CONFIG_DIR=$HOME/.config
BIN_DIR=$HOME/.bin
LOG_DIR=$HOME/.log
TMP_DIR=$HOME/.tmp

# includes the setup files
source src/welcome.sh
source src/setupFolders.sh
source src/installPackages.sh
source src/configuration.sh

# Define the initialization function
init()
{
  welcome
  setupFolders
  installPackages
  configuration
}
