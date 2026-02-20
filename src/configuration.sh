# VSCode Extensions
VSCODE_EXTENSIONS=(
  "1yib.rust-bundle"
  "adpyke.codesnap"
  "azemoh.one-monokai"
  "biomejs.biome"
  "blanc-frederic.vs-phpcompanion"
  "blodwynn.featurehighlight"
  "bmewburn.vscode-intelephense-client"
  "cucumberopen.cucumber-official"
  "dbaeumer.vscode-eslint"
  "dustypomerleau.rust-syntax"
  "editorconfig.editorconfig"
  "esbenp.prettier-vscode"
  "fabiospampinato.vscode-monokai-night"
  "fayras.simple-new-file"
  "gerane.theme-flatlandmonokai"
  "github.copilot"
  "github.copilot-chat"
  "graphql.vscode-graphql"
  "graphql.vscode-graphql-syntax"
  "hideoo.create"
  "humao.rest-client"
  "illixion.vscode-vibrancy-continued"
  "jock.svg"
  "jprestidge.theme-material-theme"
  "meganrogge.template-string-converter"
  "mehedidracula.php-namespace-resolver"
  "mikestead.dotenv"
  "monokai.theme-monokai-pro-vscode"
  "ms-azuretools.vscode-docker"
  "ms-python.debugpy"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-vsliveshare.vsliveshare"
  "orta.vscode-jest"
  "pkief.material-icon-theme"
  "prisma.prisma"
  "robertz.code-snapshot"
  "rust-lang.rust-analyzer"
  "serayuzgur.crates"
  "siarheikuchuk.gherkin-beautifier-vs-code-plugin"
  "solomonkinard.git-blame"
  "styled-components.vscode-styled-components"
  "subhendukundu.gif-code-snippet"
  "syler.sass-indented"
  "tal7aouy.theme"
  "tamasfe.even-better-toml"
  "techtheawesome.rust-yew"
  "vscodevim.vim"
  "whatwedo.twig"
  "zhuangtongfa.material-theme"
)

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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

  if [[ -f $HOME/.localrc ]]
  then
    rm $HOME/.localrc
  fi

  ln -s $DIR/.localrc $HOME/.localrc

  echo "> done"
}

# Configure neovim
nvimConfig()
{
  NEOVIM_CONFIG=$DIR/etc/arcante-nvim
  NEOVIM_DEST=$HOME/.config/nvim

  if [[ -f $NEOVIM_DEST ]]
  then
    rm $NEOVIM_DEST
  fi

  if [[ -d $NEOVIM_DEST ]]
  then
    rm -rf $NEOVIM_DEST
  fi

  echo ""
  echo ""
  echo "> Setup neo vim"
  ln -s $NEOVIM_CONFIG $NEOVIM_DEST
  echo "> done"
}

# tmux configuration
tmuxConfig()
{
  TMUX_PATH=$DIR/etc/tmux/conf
  TMUX_DEST=$HOME/.tmux.conf

  echo ""
  echo ""
  echo "> Setup tmux"

  if [[ -f $TMUX_DEST ]]
  then
    rm $TMUX_DEST
  fi

  ln -s $TMUX_PATH $TMUX_DEST

  echo "> done"
}

# fonts confiuration
fontConfig()
{
  FONT_PATH=$DIR/etc/fonts

  [[ "$OSTYPE" == "linux"* ]] && FONT_DEST=$HOME/.local/share/fonts/ || FONT_DEST=$HOME/Library/Fonts/

  echo ""
  echo ""
  echo "> Setup fonts"

  if [[ -d $FONT_DEST ]]
  then
    rm -rf $FONT_DEST
  fi

  if [[ -f $FONT_DEST ]]
  then
    rm $FONT_DEST
  fi

  ln -s $FONT_PATH $FONT_DEST

  if [[ "$OSTYPE" == "linux"* ]]
  then
    fc-cache
  fi

  echo "> done"
}

# Docker configuration
dockerConfig()
{
  echo ""
  echo ""
  echo "> Setup docker"
  if [[ "$OSTYPE" == "linux"* ]]
  then
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo usermod -aG docker $USER
  else
    colima start
  fi

  docker run hello-world

  echo "> done"
}

# Configure the dev file
devFileConfig()
{
  echo ""
  echo ""
  echo "> Setup dev file"

  DEV_PATH="$DIR/etc/dev"
  DEV_DESTINATION="$HOME/.dev"

  if [[ -d $DEV_DESTINATION ]]
  then
    rm -rf $DEV_DESTINATION
  fi

  if [[ -f $DEV_DESTINATION ]]
  then
    rm $DEV_DESTINATION
  fi

  ln -s $DEV_PATH $DEV_DESTINATION

  echo "> done"
}

# Configure the bin directory
binConfig()
{
  echo ""
  echo ""
  echo "> Setup bin dir"

  BIN_PATH="$DIR/bin"
  BIN_DESTINATION="$HOME/.bin"

  if [[ -d $BIN_DESTINATION ]]
  then
    rm -rf $BIN_DESTINATION
  fi

  if [[ -f $BIN_DESTINATION ]]
  then
    rm $BIN_DESTINATION
  fi

  ln -s $BIN_PATH $BIN_DESTINATION

  echo "> done"
}

# Configure VSCode
codeConfig()
{
  echo ""
  echo ""
  echo "> Setup vscode"

  CODE_PATH="$DIR/etc/code"

  [[ "$OSTYPE" == "linux"* ]] && CODE_DESTINATION="$HOME/.config/Code/User" || CODE_DESTINATION="$HOME/Library/Application Support/Code/User"

  FILES=(
    "settings.json"
    "keybindings.json"
  )

  for i in ${FILES[@]}
  do
    echo ">> Setup $i"

    ln -sf "${CODE_PATH}/$i" "$CODE_DESTINATION/$i"
  done

  DIRS=(
    "snippets"
  )

  for x in ${DIRS[@]}
  do
    echo ">> Setup $x"

    if [[ -d "${CODE_DESTINATION}/$x" ]]
    then
      rm -rf "${CODE_DESTINATION}/$x"
    fi

    ln -sf "${CODE_PATH}/$x" "${CODE_DESTINATION}/$x"
  done

  for y in ${VSCODE_EXTENSIONS[@]}
  do
    echo ">> Install extension: $y"
    code --install-extension $y
  done
}

# Configure kitty
kittyConfig()
{
  echo ""
  echo ""
  echo "> Setup Kitty configuration"

  KITTY_CONF="$DIR/etc/kitty"
  DEST_DIR="$HOME/.config/kitty"

  if [[ -d $DEST_DIR ]]
  then
    rm -rf $DEST_DIR
  fi

  ln -s $KITTY_CONF $DEST_DIR

  echo "> Done"
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
  nvimConfig
  tmuxConfig
  fontConfig
  dockerConfig
  devFileConfig
  binConfig
  codeConfig
  kittyConfig
}
