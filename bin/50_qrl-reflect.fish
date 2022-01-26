function qrl-reflect-on
    if test (sudo iptables -t nat --list | grep 192.168.20.2 | wc -l) = "0";
        sudo iptables -t nat -A OUTPUT -p tcp -d 180.222.68.197  -j DNAT --to-destination 192.168.20.2
    else;
        echo "Rule Alredy Added"
    end
end

function qrl-reflect-off
    if test (sudo iptables -t nat --list | grep 192.168.20.2 | wc -l) = "0";
        echo "Rule Alredy Removed"
    else
        sudo iptables -t nat -D OUTPUT -p tcp -d 180.222.68.197  -j DNAT --to-destination 192.168.20.2
    end
end