function squooshBatch
    # We tell argparse about -h/--help and -s/--second - these are short and long forms of the same option.
    # The "--" here is mandatory, it tells it from where to read the arguments.
    argparse 'h/help' 's/sourcedir=!test -d' 'o/outdir=!test -d' -- $argv
    # exit if argparse failed because it found an option it didn't recognize - it will print an error
    or return

    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        echo "squooshBatch [-h|--help] [-s|--sourcedir=sourcedir] [-o|--outdir=outdir]"
        return 0
    end
    echo $argv
    echo "Done"

    for f in {$_flag_sourcedir}/*.png
        echo "Processing $f file..."
        npx @squoosh/cli --optimizer-butteraugli-target 2 --webp auto $f -d $_flag_outdir
    end
end
