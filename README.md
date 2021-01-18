# cipher
Program a Cipher example I found on StackOverflow

[[How to encrypt files with Ruby?]](https://stackoverflow.com/questions/11044324/how-to-encrypt-files-with-ruby) was asked June 15th, 2012.  I found the answers useful so I coded up an example with a small twist.  I save the cipher.key and cipher.id to a hash and the persist the hash to a yaml file.


## Create a bash shell and run these commands.

### Create key and iv.
The command below creates aes-256-cbc.yaml

```bash
./new-key-and-iv.rb
```

### Encrypt file.yaml
file.yaml is encrypted and written test01.enc

```bash
./encrypt.rb

```
### Decrypt file.yaml
test01.enc is decrypted and writtend to test01.dec

```bash
./decrypt.rb
```

### Notes
file.yaml and test01.dec are identical if you ran these steps in order.


### both.rb
A one-stop program to encrypt (test00.enc) and decrypt (test00.dec) file.yaml 

```bash
./both.rb
```
