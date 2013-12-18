#
# Cookbook Name:: coinpunk-bitcoind
# Recipe:: default
#
# Copyright 2013, Coinpunk
#
# All rights reserved - Do Not Redistribute
#

directory "/tmp/bitcoind-build" do
  action :create
end

execute "wget -O /tmp/bitcoind-build/watchonly.tar.gz https://github.com/sipa/bitcoin/archive/watchonly.tar.gz" do
  cwd "/tmp/bitcoind-build"
  user "root"  
end

execute "tar -zxf watchonly.tar.gz" do
  cwd "/tmp/bitcoind-build"
  user "root"  
end

execute "add-apt-repository -y ppa:bitcoin/bitcoin" do
  user "root"  
end

execute "apt-get update" do
  user "root"
end

execute "apt-get install -y libdb4.8++ libdb4.8++-dev pkg-config libprotobuf-dev libminiupnpc8 minissdpd libboost1.48-* ccache" do
  user "root"
end

execute "autoreconf -vif" do
  cwd "/tmp/bitcoind-build/bitcoin-watchonly"
  user "root"  
end

execute "configure" do
  command "./configure --without-qt"
  cwd "/tmp/bitcoind-build/bitcoin-watchonly"
  user "root"  
end

execute "make" do
  cwd "/tmp/bitcoind-build/bitcoin-watchonly"
  user "root"  
end

execute "make install" do
  cwd "/tmp/bitcoind-build/bitcoin-watchonly"
  user "root"  
end

directory "/etc/bitcoind/" do
  action :create
end

template "/etc/bitcoind/bitcoin.conf" do
  source 'bitcoinconf.erb'
  cookbook 'coinpunk-bitcoind'
  owner 'root'
  mode '0644'
  variables({
    :testnet => node['coinpunk']['bitcoind']['testnet'],
    :txindex => node['coinpunk']['bitcoind']['txindex'],
    :proxy => node['coinpunk']['bitcoind']['proxy'],
    :addnode => node['coinpunk']['bitcoind']['addnode'],
    :connect => node['coinpunk']['bitcoind']['connect'],
    :maxconnections => node['coinpunk']['bitcoind']['maxconnections'],
    :server => node['coinpunk']['bitcoind']['server'],
    :rpcuser => node['coinpunk']['bitcoind']['rpcuser'],
    :rpcpassword => node['coinpunk']['bitcoind']['rpcpassword'],
    :rpctimeout => node['coinpunk']['bitcoind']['rpctimeout'],
    :rpcallowip => node['coinpunk']['bitcoind']['rpcallowip'],
    :rpcport => node['coinpunk']['bitcoind']['rpcport'],
    :rpcconnect => node['coinpunk']['bitcoind']['rpcconnect'],
    :rpcssl => node['coinpunk']['bitcoind']['rpcssl'],
    :rpcsslciphers => node['coinpunk']['bitcoind']['rpcsslciphers'],
    :rpcsslcertificatechainfile => node['coinpunk']['bitcoind']['rpcsslcertificatechainfile'],
    :rpcsslprivatekeyfile => node['coinpunk']['bitcoind']['rpcsslprivatekeyfile'],
    :gen => node['coinpunk']['bitcoind']['gen'],
    :keypool => node['coinpunk']['bitcoind']['keypool'],
    :paytxfee => node['coinpunk']['bitcoind']['paytxfee'],
    :allowreceivebyip => node['coinpunk']['bitcoind']['allowreceivebyip'],
    :min => node['coinpunk']['bitcoind']['min'],
    :minimizetotray => node['coinpunk']['bitcoind']['minimizetotray'],
  })
  #notifies :restart, "service[bitcoind]", :immediately
end

# TODO: implement service start/stop script for bitcoind
# service "bitcoind" do
#   supports :restart => true, :status => false
#   action [:enable, :start]
# end