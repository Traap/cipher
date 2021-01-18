#!/usr/bin/env ruby
# https://stackoverflow.com/questions/11044324/how-to-encrypt-files-with-ruby

require 'openssl'
# encryption
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

buf = ""
File.open("test00.enc", "wb") do |outf|
  File.open("file.yaml", "rb") do |inf|
    while inf.read(4096, buf)
      outf << cipher.update(buf)
    end
    outf << cipher.final
  end
end

# decryption
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.decrypt
cipher.key = key
cipher.iv = iv # key and iv are the ones from above

buf = ""
File.open("test00.dec", "wb") do |outf|
  File.open("test00.enc", "rb") do |inf|
    while inf.read(4096, buf)
      outf << cipher.update(buf)
    end
    outf << cipher.final
  end
end
