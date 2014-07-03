#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.3 64bit

set -e

REPO_URL="http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-10.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed"
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} >/dev/null

# Install Puppet...
echo "Installing puppet"
yum install -y puppet > /dev/null

echo "Puppet installed!"

echo "Adding id_rsa and id_rsa.pub"
id_rsa=$(echo "-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAqy7seSXJTyeGdeLmt0dlKS+wkTrf7BGQsrxH+EeRoD/VppGe
LihEKZ01KlS2+0R4VTL4SHredqEddvrUib0LulinI+b7AM3IBgGJ5aNlZYqKFqQK
xYCxhb1UsV2mIDDnlH3JVX8Wtgca8ePmWtI700SIhIqmfZ+3isnZPJVkab5zm7hg
OG7O3j0vLpI9j1wU/QJ+GMzKXIWvdl7n3Y9HcBQmJdUw6F3DB8vhF4MGvAIEXCxw
ihKTqRyhgipI+hqmkqha30RqoLNyQ7rGdaEj0UdiZlVszf2Zco9KmdQIC/XlvS9Q
OsN/qsT4ZLP7cJMyaG8m5cj6zb4VLoF5qVXuewIBIwKCAQAJyCrFGBohx76KZLy6
BBRowOWEpEdPUXX7lbr4PpqbcVyqbriU7Fuqm0Td2PSDYv+P1wbfkf4VaErTmU35
PgCrkAmNBeJ1ExK+g768qkBO8flDH1ESmaO+f9j0MTyxYeFY8T60bamGvpPTTtn2
j6ulrCUO41n4jMio2FWObu/LhyHaTNwk5yiQ7caO0JMIOzFV1TTjzgy3hN0RaeIP
aZjJZUMp03jJN1NHLMAyVUC+418kD4Jpn9lRiFA/4WuemoHno8YSU5u+INx+z+Iz
7FdZc28SCFhYj/bd8MXL98afHL8YEe+Cvc9X2J/opTMuwlV7o6W8i/JRAax9tXgx
jKxLAoGBANvlpDt0XaTNV6tD/1eJSCGnVx3kaE6RpmVVpJPUfP0EsD1XDGNUjBRm
WYFHn9fXE6Jlc04WwtX+QLM0KX5f7mYzDi80CLmLrrnKKKlsHjxZUQWfRJ33kqFb
0/ukQwbwUs+VVNygDooq2SrxCExLkKgO9UWg6mX/TEawGGC4I1JRAoGBAMdJ0xg+
Q+QopHEnUNj2CBP3mEKhzp0/Si1v/V/7Wlim99Fy1AvSiX1D4zxfD0HYY2D/qbg6
4mKYCnHwF+9CnF8J6CFqhIuVxaXOXCZ82u7akkULfsTIk5fqxcmEIO07LAYCoJQq
u0j+nN8MYK9yubJlygzhTYRE1IPmgWGOFNULAoGAOIuCAKjk4Twd25UkZvdqUcvx
1HyP2bBsnbbvzj30QQ/VjB2yunTTkDeTW8H15wtrcubjIrVlTPg8hdo2jjXs2HOH
Tfdv9TKMA+OGzHrjNBb3k7s9h7SwrSY90v5aYN62NWDp75bfKtfRcXEuBP18+APY
q4EmVL39q8bhsnh+HHsCgYEAmbybh7sBLFnd8OPQp161xkKoqG4xrIFH2eithI6z
aPXVHereF7+r5EpQNeLug0CHLZIGlW9A7PjyHWFxjK+6dTOHL7iSIol7NsPDbiXN
dm4ZELEYpm7YQf5AzqfBoRBjyh9IrNCB2Tlxs2FR5m5x/qZLaQWTkev0ZcByb9QB
cSUCgYANEk7lApFyB3Bo6qOk8jhWvLpiTjr5wC2YkziRo0HnBCMhBgAYrF71UtCB
Lt9lpXaCEwc6LDR0QhsIGpt3nUq41CT3g9NdPVpdd9pcEQZyCwEEKAgPNvCFtp98
vajxItVLTWtcgAeuW/P3U40Ul/ZvvJOZktxPY3N6/uMwrPR9UQ==
-----END RSA PRIVATE KEY-----")

id_rsa_pub=$(echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqy7seSXJTyeGdeLmt0dlKS+wkTrf7BGQsrxH+EeRoD/VppGeLihEKZ01KlS2+0R4VTL4SHredqEddvrUib0LulinI+b7AM3IBgGJ5aNlZYqKFqQKxYCxhb1UsV2mIDDnlH3JVX8Wtgca8ePmWtI700SIhIqmfZ+3isnZPJVkab5zm7hgOG7O3j0vLpI9j1wU/QJ+GMzKXIWvdl7n3Y9HcBQmJdUw6F3DB8vhF4MGvAIEXCxwihKTqRyhgipI+hqmkqha30RqoLNyQ7rGdaEj0UdiZlVszf2Zco9KmdQIC/XlvS9QOsN/qsT4ZLP7cJMyaG8m5cj6zb4VLoF5qVXuew== deploy@centos64.rentpath.local")

echo $id_rsa >> /home/deploy/.ssh/id_rsa
echo $id_rsa_pub >> /home/deploy/.ssh/id_rsa.pub
echo $id_rsa_pub >> /home/deploy/.ssh/authorized_keys
echo "Completed adding keys"

