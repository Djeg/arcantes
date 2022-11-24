# Configure git
gitConfig()
{
  GITCONFIG_PATH=$HOME/.gitconfig
  GITIGNORE_PATH=$HOME/.gitignore

  echo "> Setup git config and ignore"

  if [[ -f $GITCONFIG_PATH ]]
  then
    rm $GITCONFIG_PATH
  fi

  if [[ -f $GITIGNORE_PATH ]]
  then
    rm $GITIGNORE_PATH
  fi

  ln -s $DIR/etc/git/gitconfig $GITCONFIG_PATH
  ln -s $DIR/etc/git/gitignore $GITIGNORE_PATH

  echo "> done"
}

# Configure zsh
zshConfig()
{
  ZSH_DIR=$DIR/etc/zsh
  ZSH_DESTINATION=$CONFIG_DIR/zsh
  ZSHRC=$HOME/.zshrc
  TMP_INSTALL=$TMP_DIR/ohmyzsh.install.sh
  OHMY_DIR=$HOME/.oh-my-zsh

  if [[ -d $OHMY_DIR ]]
  then
    rm -rf $OHMY_DIR
  fi

  if [[ -f $TMP_INSTALL ]]
  then
    rm $TMP_INSTALL
  fi

  echo ""
  echo ""
  echo "> Install oh my zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "> done"
  echo ""
  echo ""
  echo "> Setup configuration"

  if [[ -d $ZSH_DESTINATION ]]
  then
    rm -rf $ZSH_DESTINATION
  fi
  if [[ -f $ZSH_DESTINATION ]]
  then
    rm $ZSH_DESTINATON
  fi

  ln -s $ZSH_DIR $ZSH_DESTINATION

  mv $ZSHRC $HOME/.zshrc.oldone

  ln -s $ZSH_DIR/zshrc $ZSHRC

  echo "> done"
}


# Configure all programs
configuration()
{
  echo ""
  echo ""
  echo " __ _               _____             ___             __ _        "
  echo " / _\ |_ ___ _ __   |___ /            / __\___  _ __  / _(_) __ _ "
  echo " \ \| __/ _ \ '_ \    |_ \   _____   / /  / _ \| '_ \| |_| |/ _\` |"
  echo " _\ \ ||  __/ |_) |  ___) | |_____| / /__| (_) | | | |  _| | (_| |"
  echo " \__/\__\___| .__/  |____/          \____/\___/|_| |_|_| |_|\__, |"
  echo "            |_|                                             |___/ "
  echo ""
  echo ""

  gitConfig
  zshConfig
}
