if test -e "/etc/arch-release"
    function i
        conda deactivate
        yay -Yy $argv
        conda activate
    end
    function r
        conda deactivate 
        yay -R $argv
        conda activate
    end
end