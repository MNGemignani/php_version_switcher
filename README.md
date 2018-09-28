# Php version switcher

### Installation:
 
 First of all we need to install multiple php versions, this can be easily done via Ondřej package, you can look for this on google, but basic commands would be:

    $ sudo apt-get update
    
    $ sudo apt install python-software-properties
    
    $ sudo add-apt-repository ppa:ondrej/php
    
    $ sudo apt install php5.6   
    $ sudo apt install php7.0   
    $ sudo apt install php7.1   
    $ sudo apt install php7.2   
    
 Second you can add the scripts from this repo, for this there are a few options, I will give two basic ones. 
 
 1) Add the content from `phpvto` to the end of your `.bashrc` file and after saving it run `$ source .bashrc`.
 
 2) Add `phpvto.sh` some where in your home directory, and run `$ chmod +x phpvto.sh` to make it executable.
 
 
### Usage: 

  1)  If you install using the first option, just run `$ phpvto [version-number]` and the script will do the rest.
  
  2)  For the second option you need to run `$ ./phpvto.sh [version-number]` (from the directory where the file is, or add the file to your PATH).
  
  
### Information:

  For help run `$ phpvto -help` or `$ ./phpvto.sh -help`.
  
  Please do not expect any help or bug fixing from me, this is only a trial script for learning proposes. I'm always open for tips or improvements in my code.
    