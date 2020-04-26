# PHP version switcher

### Installation:
 
 First of all we need to install multiple php versions, this can be easily done via Ondřej package, you can look for it on google, but basic commands would be:

    $ sudo apt-get update
    
    $ sudo apt install python-software-properties
    
    $ sudo add-apt-repository ppa:ondrej/php
    
    $ sudo apt install php5.6   
    $ sudo apt install php7.0   
    $ sudo apt install php7.1   
    $ sudo apt install php7.2   
    $ sudo apt install php7.3   
    $ sudo apt install php7.4
    
 Second you can add the scripts from this repo, for this there are a few options, here is one: 
 
    $ mkdir ~/bin
    $ mv phpvto.sh ~/bin/phpvto
    $ chmod +x ~/bin/phpvto
    
 Add `~/bin` to your PATH 
 
 
### Usage: 

  Run `$ phpvto [version-number]` and the script will do the rest.
    
  
### Information:

  For help run `$ phpvto --help` .
      
