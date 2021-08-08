if test -e /etc/arch-release
    function update-mirrors
        sudo rankmirrors -c Australia,New_Zealand
    end
end
