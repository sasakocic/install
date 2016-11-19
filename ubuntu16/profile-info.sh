#export PS1='\[\033[33m\]\u@\H:\w $(__git_ps1 " (%s) ")\$ \[\033[m\]'
#if (( `id -Gn | grep -c wheel` )); then
#export PATH="$PATH:/usr/sbin;/sbin"
#fi
#export LC_ALL="C"
export PROMPT_COMMAND='if [ "${TERM}" = "xterm" -o "${TERM}" = "rxvt" ]; then echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007" ; fi'
#export PAGER=less
#export LESS="-SFin"
#alias s=ssh

 ''/usr/local/bin/info.sh''
