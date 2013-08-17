# -*- mode: ruby -*-
# vi: set ft=ruby :

# Load the global common configuration that all boxes use.
import "_common.pp"

# Load the template that defines the VPN setup.
import "_vpn_template.pp"

# Apply the VPN template.
node default inherits vpn_template { }
