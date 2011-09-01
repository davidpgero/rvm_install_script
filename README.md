## The shortest way to install Rails3 on Ubuntu
*with RVM (Ruby Version Manager) an Ruby1.9*

### How install?

    1. git clone git://github.com/davidpgero/rvm_install_script.git
    2. cd rvm_install_script
    3.  chmod +x rvm_install_script.sh
    4. ./rvm_install_script.sh

After the last steps you can go for coffee. 
After the install you get the message about *Ruby Version Manager, Ruby version is 1.9.2 and Rails3.0 are installed* succesfully.

###How it's works?

    1. install RVM and add it to .bashrc (this loads every time you start a shell)
    2. install packages (readline, iconv, zlib, openssl, autoconf)
    3. install Ruby 1.9.2 with above packages
    4. Set Ruby 1.9.2 as default and create a basic Gemset
    5. Installing Rails3.0
    6. Testing the Ruby and Rails versions. If you get the 1.9.2. and 3.+ then it's work!

## Detailed Readme of Steps which the install script does:

If there were any elder version and had problems:
1. After install RVM and updating;
2. Completely uninstall Ruby;
3. Install all RVM packages before starting installing Ruby;
4. Install all packages which for your OS 
5. Install Ruby with the needed and preinstaled RVM packages.
6. Install Gemsets to avoid confusion with updates and gem versions
Optional: If you are using elder Ruby you might need to install Rubygems too (not for 1.9.2, only elder versions).
7. Install your gems, for example Rails, but important note: do not use 'sudo' as you would without using RVM. Check if everything works fine.

**This script is made for Ubuntu users. Check your specific needs on your OS please.**


### Step1: Prerequirements:

##### Check if you have Git already:
    $ git -v

If Git isn't installed yet:
    $ sudo apt-get install git-core curl
    $ sudo aptitude build-dep git-core

*You don't have to use Joe Editor, I love it nut it's optional.* Any other editor's fine like Gedit, Vi, Emacs, etc. If you want to install Joe then:
    $ sudo apt-get install joe 

### Step2: Install RVM
    $ bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

At the end of of Bash Profile (on Ubuntu it's usually .bashrc file):
    $ joe .bashrc
in the end of the file type:
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

NOTE: This is for a *user* install. If you installed as root then you substitute '$HOME/.rvm' with '/usr/local/rvm'.
Save and exit. In joe editor: CTRL+K+X is save and exit
*Last command is for Joe, you need to save and exit in your editor.*

Restart your terminal or type and reload RVM compiler:
    $ . "$HOME/.rvm/scripts/rvm"
    $ rvm reload
    $ rvm get
    $ rvm reload

*Note: If you already have Ruby and you had problems and want to completly reinstall it*
    $ rvm remove ruby

### Step3. Install all RVM packages:

    $ rvm package install readline
    $ rvm package install iconv
    $ rvm package install zlib
    $ rvm package install openssl
    $ rvm package install autoconf

### Step 5: Install Ruby version 1.9.2 with RVM.
    $ rvm install 1.9.2 --with-readline-dir=$rvm_path/usr --with-iconv-dir=$rvm_path/usr --with-zlib-dir=$rvm_path/usr --with-openssl-dir=/usr/local 

Note: if you had problems with Rake "stack too deep" this may be a solution:
$ rvm install 1.9.2-p0 --with-readline-dir=$rvm_path/usr --with-iconv-dir=$rvm_path/usr --with-zlib-dir=$rvm_path/usr --with-openssl-dir=/usr/local 

Set the default Ruby to use.
    $ rvm use 1.9.2

Check if works:
    $ ruby -v
    $ rvm list

Use and set default Ruby interpreter:
    $ rvm use 1.9.2 --default

*It overrides the system's default Ruby.* 
Next time you open a terminal you don't need to specify which Ruby version you want because it set as default.

### Step 6: Create Gemsets 
**This prevents confusions with gems versions and updates.**
*Important format: 'rvm' then your Ruby version from 'rvm list' and then your Gemset's name*
    $ rvm gemset create YourProjectName
Use this Gemset and set as default:
    $ rvm gemset use 1.9.2@YourProjectName --default

More info about Gemsets: 
http://beginrescueend.com/gemsets/basics/


###Step 7: Install Rails
    $ gem install rails

######Important: check if everything works fine
    $ rvm -v
    $ rvm list
    $ ruby -v
    $ rails -v
    $ gem list

Welcome on Rails!:) You may want to visit the famous 15minutes blog on RailsGuides.
Finally choose your favorite Gems from http://ruby-toolbox.com/ and from Github.

**Please report if you had any issue with the install script. Thanks.**
