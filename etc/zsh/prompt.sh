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
  fgRedError="\033[38;5;${colorError}m"
  fgWhite="\033[38;5;${colorWhite}m"
  fgGrey="\033[38;5;${colorGrey}m"

  # determining the branch to display
  if [[ -z $(gitBranch) ]]; then
    branch=""
  else
    branch="${stop}%B%F{$fgGrey}  $(gitBranch)${stop}"
  fi

  error="%(?,,%B%F{$colorError}⌧ %f%b)"

  echo "${error}${stop}%B%F{$colorLightGreen}λ ❱%b%f%k%F{$colorLightGreen}%K{$colorGrey}%f%k%F{$colorWhite}%B %c%f%k%F{$colorGrey}%f${branch}${stop}${newLine}╰─ "
}

PROMPT="$(prompt)"
RPROMPT=""
