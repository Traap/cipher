#!/usr/bin/env ruby

require 'openssl'
require 'yaml'

# encrypt
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

# Write key and iv to yaml file. 
buffer = {}
buffer[:key] = key
buffer[:iv] = iv

File.write("aes-256-cbc.yaml", buffer.to_yaml)

