#install rvm and add your .bashrc
curl -s https://rvm.beginrescueend.com/install/rvm -o rvm-installer ; \
chmod +x rvm-installer ; \
rvm_bin_path=~/.rvm/bin rvm_man_path=~/.rvm/share/man ./rvm-installer ; \

#install readline, iconv, zlib, openssl, autoconf package
rvm pkg install readline; \
rvm pkg install iconv; \
rvm pkg install zlib; \
rvm pkg install openssl; \
rvm pkg install autoconf; \

#install ruby 1.9.2 with above package
rvm install 1.9.2 --with-readline-dir=$rvm_path/usr --with-iconv-dir=$rvm_path/usr --with-zlib-dir=$rvm_path/usr --with-openssl-dir=$HOME/.rvm/usr ; \

#settings the ruby 1.91.2 is default
rvm use 1.9.2 --default; \

# checking the ruby version! - If you see the ruby version 1.9.2, you OK!
ruby -v;

# Create and use Gemset
rvm gemset create rails309;
rvm gemset use rails309 --default;

# install Rails 3.0.9
gem install rails -v=3.0.9;

# Check Rails version
gem list;
rails -v;