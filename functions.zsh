# Path to your oh-my-zsh installation.

alias internet='sudo create_ap wlp2s0 enp0s29u1u2 virus_0_00_31 lolinternet --no-virt'
alias disable_touchscreen='xinput disable $(xinput | grep 'Atmel' | cut -d= -f 2 | cut -f 1)'

function enable_sshagent(){
  eval "$(ssh-agent)"
  ssh-add ~/.ssh/id_rsa
}

# refresh the zshrc
function f5(){
. ~/.zshrc
}
bindkey -s '\e[15~' '^qf5\n'

function cs(){
    cd $1 && ls
}
function v(){
    vim $*
}
alias u='cd ..'
alias act='source env/bin/activate'
alias pacman='sudo pacman'


function randpass(){
  size="36"
  if [[ -z "$1" ]]; then
    echo "no size given"
  else
    echo "size set to $1"
    size=$1
  fi
  echo $(cat /dev/urandom | tr -cd "[:alnum:]" | head -c $size)
}


# git aliases
alias gis='git status'
alias gio='git checkout'
alias gic='git commit'
alias gib='git branch'
alias gish='git push'
alias gill='git pull'
alias getch='git fetch'
#--pretty=format:"%h - %an, %ar : %s"
#%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset
alias gilog='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"  --all --decorate' #--oneline '
alias yolocommit='fortune=$(fortune -n 55 | tr -cd "[:alnum:]|[ \n.]"); git add .; git commit -m "$fortune"'

alias setpy2="sudo ln -f /usr/bin/python2 /usr/bin/python"
alias setpy3="sudo ln -f /usr/bin/python3 /usr/bin/python"

alias ←="pushd -q +1"
alias →="pushd -q -1"
alias ↑="cd .."

bindkey -s '^u' "↑\n"
bindkey -s '^b' "←\n"
bindkey -s '^f' "→\n"

### Added by the Heroku Toolbelt
function most_useless_use_of_zsh {
local lines columns colour a b p q i pnew
((columns=COLUMNS-1, lines=LINES-1, colour=0))
for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
  for ((a=-2.0; a<=1; a+=3.0/columns)) do
    for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
      ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
    done
    ((colour=(i/4)%8))
    echo -n "\\e[4${colour}m "
  done
  echo
done
}
