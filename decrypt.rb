#!/usr/bin/env ruby

require 'openssl'
require 'yaml'

buffer = {}
buffer = YAML.load_file('aes-256-cbc.yaml')

cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.decrypt
cipher.key = buffer[:key]
cipher.iv = buffer[:iv]

buf = ""
File.open("test01.dec", "wb") do |outf|
  File.open("test01.enc", "rb") do |inf|
    while inf.read(4096, buf)
      outf << cipher.update(buf)
    end
    outf << cipher.final
  end
end
