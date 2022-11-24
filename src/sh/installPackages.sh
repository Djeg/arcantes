# Install the standard package
installPackages()
{
  OUT_FILE=$LOG_DIR/installPackages.arcantes.log
  YAY_DIR=$TMP_DIR/yay
  PACKAGES="git"
  YAY_PACKAGES=(
    # General applications
    "aur/google-chrome"
    "community/gcolor3"
    "community/neovim"
    "aur/typora"
    "aur/zoom"
    "community/code"
    "extra/zsh"

    # NodeJS
    "community/nodejs-lts-hydrogen"

    # PHP
    "extra/php"
    "extra/composer"

    # Python
    "core/python"

    # Lua
    "extra/lua"
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
