VPN for road warriors
=====================

My goal is to automate the build of a VPN for iDevices (iPhones, iPads, and
other iOS-based computers). The main use-case for this is to allow my iPad and
laptop to connect to my VPS, and appear to be in the UK (for web-testing
purposes, natch).


The flaws
=========

Firstly, this doesn't seem to work out of the box. Once you've called
```vagrant up```, you then need to ssh in and restart ```xl2tpd``` and
```ipsec```. I've no idea why right now, I'm probably missing a Notify command
somewhere.

Secondly, the whole setup isn't that realistic. To do this properly, we should
really be simulating various network setups:


 Type          | Description                                                 
 ------------- | ----------------------------------------------------------- 
 public:public | Both VPN server and iDevice have public IPs.                
 public:NAT    | The VPN server has a public IP, but the iDevice is behind a 
               | NAT router.                                                 
 NAT:public    | The VPN is behind a NAT router (which is forwarding the     
               | appropriate ports). For example, tunnelling into a home or  
               | office network. The iDevice has a public IP.                
 NAT:NAT       | Both VPN server and iDevice are behind NAT routers.         


We should simulate these scenarios with a second VM that acts as a router.


Do I need Precise? Will this work with Lucid?
=============================================

I haven't been able to make this work with Lucid. There is plenty of talk on
the internet that Lucid contains a buggy version of Openswan or XL2TPD, and
this kind of setup doesn't work.  I for one don't have the patience to wrestle
it any further.


