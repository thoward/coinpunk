name "coinpunk-web"
description "The base role for the Coinpunk Web Server"

run_list(
  "recipe[apt]", 
  "recipe[build-essential]", 
  "recipe[ntp]", 
  "recipe[coinpunk-web-base::default]",
  "recipe[redisio::install]",
  "recipe[redisio::enable]",
  "recipe[coinpunk-bitcoind::default]"
)

override_attributes(
  :apt => { 
    "compiletime" => true
    },
  :redisio => {
    "servers" => [{
      "port" => "6379",
      "backuptype" => "aof"
    }],
    "default_settings" => {
      "appendfsync" => "always"
    } 
  }
)