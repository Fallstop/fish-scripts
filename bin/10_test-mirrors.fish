function test-mirrors
    if test -e "/etc/arch-release"
        export TMPFILE="/tmp/rank-mirror-temp"; \
            sudo true; \
            rate-mirrors --save=$TMPFILE manjaro --max-delay=11600 \
            && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
            && sudo mv $TMPFILE /etc/pacman.d/mirrorlist
    end
end