
function dev
    cd $PROJECTS_DIR/$argv
end

function devc
    dev $argv
    code .
end

function devg
    dev $argv
    gkrak
end

function devgc
    dev $argv
    code .
    gkrak
end

alias devcg=devgc

function dev_complete
    # Get project name
    set arg (commandline -ct)
    
    # save our PWD
    set saved_pwd $PWD

    # cd to $PROJECTS (and then back after)
    # while in $PROJECTS_DIR, complete as if we are 'cd'
    builtin cd $PROJECTS_DIR    
    and complete -C "cd $arg"
    builtin cd $saved_pwd
end

complete --command dev --no-files --arguments='(exa -D $PROJECTS_DIR)'
complete --command devc --no-files --arguments='(exa -D $PROJECTS_DIR)'
complete --command devg --no-files --arguments='(exa -D $PROJECTS_DIR)'
complete --command devgc --no-files --arguments='(exa -D $PROJECTS_DIR)'
