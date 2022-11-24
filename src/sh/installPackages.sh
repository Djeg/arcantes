# Install the standard package
installPackages()
{
  PACKAGES="git"

  echo ""
  echo " __              __           __                          "
  echo "(_  |_  _  _      _)    __   |__)  _   _ |   _   _   _  _ "
  echo "__) |_ (- |_)    /__         |    (_| (_ |( (_| (_) (- _) "
  echo ""

  echo "> Installing : $PACKAGES"
  yes 0 | sudo pacman -S $PACKAGES > $OUT_FILE
  echo "> done"

  echo "> Installing yay"
  echo
}
