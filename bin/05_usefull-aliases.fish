alias ls="exa --icons --time-style long-iso"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias lla="ls"
alias ld="ls -D"
alias ldl="ls -Dl"
alias lld="ldl"
alias l=ls

alias lll="ls -lTR"

alias cdnt="cd -"

alias calc="kalker"

if test -e "/etc/arch-release"
    alias i="conda deactivate && yay -Yy && conda activate"
    alias r="conda deactivate && yay -R && conda activate"
end
