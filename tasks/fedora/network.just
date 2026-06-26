enable-privacy-dns: _install::crudini
    sudo crudini --set /etc/systemd/resolved.conf.d/dns.conf \
        Resolve DNSOverTLS yes
    sudo crudini --set /etc/systemd/resolved.conf.d/dns.conf \
        Resolve DNSSEC no
    sudo crudini --set /etc/systemd/resolved.conf.d/dns.conf \
        Resolve LLMNR yes
    sudo crudini --set /etc/systemd/resolved.conf.d/dns.conf \
        Resolve Domains ~.
    sudo systemctl restart systemd-resolved.service

    sudo crudini --set /etc/NetworkManager/conf.d/99-ignore-auto-dns.conf \
        main dns none
    sudo crudini --set /etc/NetworkManager/conf.d/99-ignore-auto-dns.conf \
        connection ipv4.ignore-auto-dns yes
    sudo crudini --set /etc/NetworkManager/conf.d/99-ignore-auto-dns.conf \
        connection ipv6.ignore-auto-dns yes
    sudo systemctl restart NetworkManager.service

enable-ipv6-temp-addr: _install::crudini
    echo "
    net.ipv6.conf.all.use_tempaddr = 2
    net.ipv6.conf.default.use_tempaddr = 2
    " >> "/etc/sysctl.d/99-ipv6-privacy.conf"
    sudo sysctl -p

    sudo crudini --set /etc/NetworkManager/conf.d/99-ipv6-temp-addr.conf \
        connection ipv6.ip6-privacy 2
    sudo systemctl restart Networkmanager.service

[private]
mod _install "./install/for-config.just"
