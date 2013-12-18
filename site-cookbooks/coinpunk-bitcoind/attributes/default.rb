# Run on the test network instead of the real bitcoin network.
default['coinpunk']['bitcoind']['testnet']=1

# transaction index
default['coinpunk']['bitcoind']['txindex']=1

# Connect via a socks4 proxy
# eg. default['coinpunk']['bitcoind']['proxy']="127.0.0.1:9050"
default['coinpunk']['bitcoind']['proxy']=nil

# Use as many addnode= settings as you like to connect to specific peers
# e.g. default['coinpunk']['bitcoind']['addnode']=["69.164.218.197", "10.0.0.2:8333"]
default['coinpunk']['bitcoind']['addnode']=[]
 
 # ... or use as many connect= settings as you like to connect ONLY
 # to specific peers:
# e.g. default['coinpunk']['bitcoind']['connect']=["69.164.218.197", "10.0.0.2:8333"]
default['coinpunk']['bitcoind']['connect']=[]

# Maximum number of inbound+outbound connections.
default['coinpunk']['bitcoind']['maxconnections']=0

# JSON-RPC options (for controlling a running Bitcoin/bitcoind process)
# server=1 tells Bitcoin-QT to accept JSON-RPC commands.
default['coinpunk']['bitcoind']['server']=0

# You must set rpcuser and rpcpassword to secure the JSON-RPC api
default['coinpunk']['bitcoind']['rpcuser']="Ulysseys"
default['coinpunk']['bitcoind']['rpcpassword']="YourSuperGreatPasswordNumber_DO_NOT_USE_THIS_OR_YOU_WILL_GET_ROBBED_385593"

# How many seconds bitcoin will wait for a complete RPC HTTP request.
# after the HTTP connection is established. 
default['coinpunk']['bitcoind']['rpctimeout']=30

# By default, only RPC connections from localhost are allowed.  Specify
# as many rpcallowip= settings as you like to allow connections from
# other hosts (and you may use * as a wildcard character).
# NOTE: opening up the RPC port to hosts outside your local
# trusted network is NOT RECOMMENDED, because the rpcpassword
# is transmitted over the network unencrypted.
# e.g. default['coinpunk']['bitcoind']['rpcallowip']=["10.1.1.34","192.168.1.*"]
default['coinpunk']['bitcoind']['rpcallowip']=[]

# Listen for RPC connections on this TCP port:
default['coinpunk']['bitcoind']['rpcport']="8332"

# You can use Bitcoin or bitcoind to send commands to Bitcoin/bitcoind
# running on another host using this option:
default['coinpunk']['bitcoind']['rpcconnect']="127.0.0.1"

# Use Secure Sockets Layer (also known as TLS or HTTPS) to communicate
# with Bitcoin -server or bitcoind
default['coinpunk']['bitcoind']['rpcssl']=1

# OpenSSL settings used when rpcssl=1
default['coinpunk']['bitcoind']['rpcsslciphers']="TLSv1+HIGH:!SSLv2:!aNULL:!eNULL:!AH:!3DES:@STRENGTH"
default['coinpunk']['bitcoind']['rpcsslcertificatechainfile']="server.cert"
default['coinpunk']['bitcoind']['rpcsslprivatekeyfile']="server.pem"


# Miscellaneous options

# Set gen=1 to attempt to generate bitcoins
default['coinpunk']['bitcoind']['gen']=0

# Pre-generate this many public/private key pairs, so wallet backups will be valid for
# both prior transactions and several dozen future transactions.
default['coinpunk']['bitcoind']['keypool']=100

# Pay an optional transaction fee every time you send bitcoins.  Transactions with fees
# are more likely than free transactions to be included in generated blocks, so may
# be validated sooner.
default['coinpunk']['bitcoind']['paytxfee']=0.00

# Allow direct connections for the 'pay via IP address' feature.
default['coinpunk']['bitcoind']['allowreceivebyip']=1
 
# User interface options

# Start Bitcoin minimized
default['coinpunk']['bitcoind']['min']=1

# Minimize to the system tray
default['coinpunk']['bitcoind']['minimizetotray']=1