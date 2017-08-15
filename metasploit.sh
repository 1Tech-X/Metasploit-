#!/data/data/com.termux/files/usr/bin/bash
echo "-----------------------------------------------------"
echo "SUBSCRIBE THE CHANNEL Tech-X"
echo "-----------------------------------------------------"

echo "Please Wait.........." 

echo "####################################"
apt install autoconf bison clang coreutils curl findutils git apr figlet apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby-dev libgrpc-dev ncurses-utils termux-tools -y
echo "####################################"
echo "Downloading....."

curl -L https://github.com/rapid7/metasploit-framework/archive/4.14.28.tar.gz | tar xz

cd metasploit-framework-4.14.28

sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec

sed -i 's/grpc (1.3.4)/grpc (1.4.1)/g' Gemfile.lock
echo "Bundler is installing"
gem install bundler


echo "nokogiri is installing......"
gem install nokogiri -- --use-system-libraries



gem unpack network_interface
cd network_interface-0.0.1
sed 's|git ls-files|find -type f|' -i network_interface.gemspec
curl -L https://wiki.termux.com/images/6/6b/Netifaces.patch -o netifaces.patch
patch -p1 < netifaces.patch
gem build network_interface.gemspec
echo "network_interface is installing........"
gem install network_interface-0.0.1.gem
cd ..
rm -r network_interface-0.0.1


gem unpack grpc -v 1.4.1
cd grpc-1.4.1
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
echo "grpc is installing"
gem install grpc-1.4.1.gem
cd ..
rm -r grpc-1.4.1


echo "bundle and all other dependencies are installing......"
bundle install -j5


$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;

cd metasploit-framework-4.14.28

echo "###############################"
echo "Original Work BY Vishalbiswani& Auxilus,Thanks  To  Vishalbiswani& Auxilus For The Code "
echo "###############################"
figlet Tech-X
echo "###############################################"
echo "Subscribe The Channel TECHNICAL Tech-X"
figlet SUBSCRIBE
echo "###############################################"
echo "###############################"
echo "For HACKING & TECH VIDEOS"
echo "###############################"
figlet Tech-X
echo "####################################"
echo " NOW YOU CAN RUN METASPLOIT BY JUST EXECUTE THE COMMAND :=>  ./msfconsole"
echo "####################################"
figlet Finish
