# install Linux Packages
installLinuxPackages()
{
  OUT_FILE=$LOG_DIR/installPackages.arcantes.log
  YAY_DIR=$TMP_DIR/yay
  PACKAGES="git"
  YAY_PACKAGES=(
    # General applications
    "aur/google-chrome"
    "community/gcolor3"
    "community/neovim"
    "community/kitty"
    "community/fzf"
    "aur/typora"
    "extra/zsh"
    "community/tmux"
    "extra/gimp"
    "extra/inkscape"
    "aur/visual-studio-code-bin"

    # NodeJS
    "community/nodejs-lts-hydrogen"

    # PHP
    "extra/php"
    "extra/composer"

    # Python
    "core/python"

    # Lua
    "extra/lua"

    # Docker
    "community/docker"
    "community/docker-compose"

    # Github cli
    "community/github-cli"

    # Rust
    "extra/rust"
  )

  echo ""
  echo " __              __           __                          "
  echo "(_  |_  _  _      _)    __   |__)  _   _ |   _   _   _  _ "
  echo "__) |_ (- |_)    /__         |    (_| (_ |( (_| (_) (- _) "
  echo ""

  echo "> Installing : $PACKAGES"
  sudo pacman -S --noconfirm $PACKAGES
  echo "> done"

  echo ""
  echo ""

  echo "> Installing yay"

  if [[ -d $YAY_DIR ]]
  then
    rm -rf $YAY_DIR
  fi

  git clone https://aur.archlinux.org/yay.git $YAY_DIR

  cd $YAY_DIR
  makepkg -si --noconfirm
  cd $DIR

  echo ""
  echo ""

  echo "yay version : "
  yay --version

  rm -rf $YAY_DIR

  echo ""
  echo ""

  echo "> done"

  echo "> Installing yay packages :"
  echo ""
  for i in ${YAY_PACKAGES[@]}
  do
    echo ""
    echo ""
    echo ">> $i"
    yay -S --answerclean N --answerdiff N --answeredit N $i --noconfirm
    echo ""
    echo ""
  done

  echo ""
  echo ""

  echo "> done"
}

# install mac os packages
installMacPackages()
{
  echo ""
  echo " __              __           __                          "
  echo "(_  |_  _  _      _)    __   |__)  _   _ |   _   _   _  _ "
  echo "__) |_ (- |_)    /__         |    (_| (_ |( (_| (_) (- _) "
  echo ""

  BREW_PACKAGES=(
    # General applications
    "google-chrome"
    "neovim"
    "kitty"
    "fzf"
    "typora"
    "tmux"
    "gimp"
    "inkscape"
    "visual-studio-code"

    # NodeJS
    "node"

    # PHP
    "php"
    "composer"

    # Python
    "python"

    # Lua
    "lua"

    # Docker
    "docker"
    "docker-compose"
    "colima"

    # Github cli
    "gh"

    # Rust
    "rust"
  )

  echo "> installing homebrew"
  echo ""

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  export PATH=$PATH:/opt/homebrew/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

  echo ""
  echo ""
  echo "> done"

  echo "> Installing brew packages :"
  echo ""
  for i in ${BREW_PACKAGES[@]}
  do
    echo ""
    echo ""
    echo ">> $i"
    brew install $i
    echo ""
    echo ""
  done

  echo ""
  echo ""

  echo "> done"
}

# Install the standard package
installPackages()
{
  if [[ "$OSTYPE" == "linux"* ]]
  then
    installLinuxPackages
  else
    installMacPackages
  fi
}
