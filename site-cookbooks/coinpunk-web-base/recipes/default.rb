#
# Cookbook Name:: coinpunk-web-base
# Recipe:: default
#
# Copyright 2013, Coinpunk
#
# All rights reserved - Do Not Redistribute
#

# Install Prerequisites

apt_package "autoconf" do
  action :install
end

apt_package "libtool" do
  action :install
end

apt_package "libdb4.8" do
  action :install
end

apt_package "libdb4.8-dev" do
  action :install
end

apt_package "git" do
  action :install
end

apt_package "software-properties-common" do
  action :install
end

# Install NodeJS

%w{python-software-properties python g++ make}.each do |pkgname|
  apt_package pkgname do
    action :install
  end
end

# apt_package "unattended-upgrades" do
#   action :install
# end

# execute "dpkg-reconfigure -plow unattended-upgrades" do
#   user "root"
# end 

execute "add-apt-repository -y ppa:chris-lea/node.js" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

execute "apt-get install -y nodejs" do
  user "root"
end
