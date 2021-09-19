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

if test -e "/etc/arch-release"
    alias i="yay -Yy"
    alias r="yay -R"
end
