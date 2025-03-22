# Setup all nescessary folders
setupFolders()
{
  echo ""
  echo " __                          __                    "
  echo "(_  |_  _  _     /|    __   |_   _  |  _|  _  _  _ "
  echo "__) |_ (- |_)     |         |   (_) | (_| (- |  _) "
  echo ""

  # Change permissions if on mac os
  # if [[ "$OSTYPE" != "linux"* ]]
  # then
  #   echo "> Setup permissions"
  #   echo ""
  #   sudo chmod -R 777 $HOME/Applications
  #   sudo chmod -R 777 $HOME/Library
  # fi

  echo "> Setup .config"
  if [[ ! -d $CONFIG_DIR ]]
  then
    mkdir $CONFIG_DIR
  fi
  echo "> done"

  echo "> Setup .bin"
  if [[ ! -d $BIN_DIR ]]
  then
    mkdir $BIN_DIR
  fi
  echo "> done"

  echo "> Setup .log"
  if [[ ! -d $LOG_DIR ]]
  then
    mkdir $LOG_DIR
  fi
  echo "> done"

  echo "> Setup .tmp"
  if [[ ! -d $TMP_DIR ]]
  then
    mkdir $TMP_DIR
  fi
  echo "> done"

  echo "> Setup Project Folder"
  if [[ ! -d $PROJECT_FOLDER ]]
  then
    mkdir $PROJECT_FOLDER
  fi
  echo "> done"
}
