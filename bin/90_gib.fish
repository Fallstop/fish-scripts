function gib
    cowsay "Enter Admin Password"
    sudo printf "\nThanks for sudo\n"
    set start_time (date +%s)

    if test -e "/etc/arch-release"
        printf "\nUpdating yay\n"
        yay -Suy --noconfirm
    end

    if test -e "/etc/debian_version"
        printf "\nUpdating APT\n"
        sudo apt update
        sudo apt full-upgrade -y
        sudo apt autoremove -y
    end

    printf "\nUpdating Snap"
    sudo snap refresh

    printf "\nUpdating RustUp\n"
    rustup self update
    rustup update

    printf "\nUpdating cargo"
    cargo install-update -a

    printf "\nUpdating flatpak\n"
    sudo flatpak update -y
    flatpak update -y

    printf "\nUpdating Yarn\n"
    yarn global upgrade

    printf "\nUpdating NPM\n"
    npm install -g npm

    printf "\nUpdating Conda\n"
    conda update --prefix ~/anaconda3 anaconda -y

    printf "\nUpdating Starship\n"
    curl -fsSL https://starship.rs/install.sh > /tmp/installStarship.sh
    sudo sh /tmp/installStarship.sh -y
    rm /tmp/installStarship.sh -f
    
    set total_time (math (date +%s) - $start_time)
    cowsay "That took $total_time seconds too long."
end