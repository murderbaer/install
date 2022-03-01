pfetch
middle_mouse
source ~/.config/gitstatus/gitstatus.prompt.zsh
# color ouptut
PROMPT='%F{blue}%n%f%F{yellow}@%F{red}%m%f %F{yellow}%B%~%b%f %F{yellow}%#%f '
RPROMPT='$GITSTATUS_PROMPT'
# ---------------------alias--------------------- #
alias pacs="sudo pacman -Syu"
alias pacr="sudo pacman -Rs"
alias lmr="sudo systemctl restart lightdm"
alias nas="sudo mount -t cifs //192.168.3.5/NAS /home/arif/nas -o credentials=/root/.smb,iocharset=utf8,uid=1000,gid=1000"
alias mv="mv -vn"
alias mvkernel="sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-custom"
alias ls="ls --color=always"
alias ll="ls -lh --group-directories-first"
alias la="ls -lah --group-directories-first"
alias gr="git reset --hard && git clean -f"
alias cp="cp"
alias ..="cd .."
alias mki="make clean; make && sudo make install"
alias systemctl="sudo systemctl"

# ----------------------plugin------------------- #
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select 	# menu select
zstyle ':completion::complete:*' gain-privileges # sudo completion works
zstyle ':completion:*' rehash true # auto add new executables from PATH
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search # only mathching results from history are shown
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz select-word-style
select-word-style bash

# kill command
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=02;32'

autoload -U compinit 
compinit

# ----------------------history----------------- #
HISTFILE=~/.config/zsh/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# ------------------------key-------------------- #
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# setup needed for better hostory selection
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# some keys mainly for better deleting words 
bindkey -e
bindkey '^[[3;5~' kill-word
bindkey "^[Oc" forward-word
bindkey "^[Od" backward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# alt-bs
bindkey "\e\d"  undo
# Reverse search
bindkey '^R' history-incremental-search-backward

X_SERVER_RUNNING=$(ps -aux  | grep root | grep xorg)
if [ -z $X_SERVER_RUNNING ]
then
	middle_mouse
fi
