function gitBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function prompt() {
  # this is some utils
  bold="\033[1m"
  stop="\033[0m"
  newLine=$'\n'

  # here is some palletes
  colorBlack="236"
  colorLightGreen="158"
  colorWhite="253"
  colorError="160"
  colorGrey="239"

  # here is some background and foreground combination
  fgLightGreen="\033[38;5;${colorLightGreen}m"
  bgLightGreenAndFgBlack="\033[38;5;${colorBlack};48;5;${colorLightGreen}m"
  bgBlackAndFgLightGreen="\033[38;5;${colorLightGreen};48;5;${colorBlack}m"
  bgGreyAndFgLightGreen="\033[38;5;${colorLightGreen};48;5;${colorGrey}m"
  bgGreyAndFgWhite="\033[38;5;${colorWhite};48;5;${colorGrey}m"
  bgBlackAndFgGrey="\033[38;5;${colorGrey};48;5;${colorBlack}m"
  bgRedAndFgWhite="\033[38;5;${colorWhite};48;5;${colorError}m"
  bgLightGreenAndFgRed="\033[38;5;${colorError};48;5;${colorLightGreen}m"

  # determining the branch to display
  if [[ -z $(gitBranch) ]]; then
    branch=""
  else
    branch="${stop}%B%F{$colorLightGreen}  $(gitBranch)${stop}"
  fi

  error="%(?,,%B%F{$colorWhite}%K{$colorError} 󰇸 %f%b%k%F{$colorError}%K{$colorLightGreen}%f%k)"

  echo "${error}%B%F{$colorBlack}%K{$colorLightGreen} λ %b%f%k%F{$colorLightGreen}%K{$colorGrey}%f%k%F{$colorWhite}%K{$colorGrey} %c %f%k%F{$colorGrey}%f${branch}${stop}${newLine}╰─ "
}

PROMPT="$(prompt)"
RPROMPT=""
