# We first need to install the standard packages such as
# git, yay and others

# Copy / Read env file
cp -n .env.dist .env
if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

# Setup usefull variables
DIR="$( cd "$( dirname "$0" )" && pwd )" # current working directory
CONFIG_DIR=$HOME/.config
BIN_DIR=$HOME/.bin
LOG_DIR=$HOME/.log
TMP_DIR=$HOME/.tmp
PROJECT_FOLDER=$HOME/$PROJECT_FOLDER_NAME

# includes the setup files
source src/welcome.sh
source src/setupFolders.sh
source src/installPackages.sh
source src/configuration.sh

# Define the initialization function
init()
{
  # welcome
  # setupFolders
  # installPackages
  configuration
}
