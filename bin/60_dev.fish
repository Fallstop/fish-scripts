
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


    # cd to $PROJECTS (and then back after)
    # while in $PROJECTS, complete as if we are 'cd'
    and complete -C"cd $arg"
    builtin cd $PROJECTS_DIR/
end

complete --command dev --arguments '(dev_complete)'
complete --command devc --arguments '(dev_complete)'
complete --command devgc --arguments '(dev_complete)'
