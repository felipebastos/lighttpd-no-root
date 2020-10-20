#!/bin/bash
# Pré-requisito Libxml2
tar -vzxf libs/libxml2.tar.gz
mv libxml2-2.9.7 libxml2-src
cd libxml2-src
./configure --prefix=/tmp/libxml2 --without-python
make
make install
cd ..
rm -rf libxml2-src

# Pré-requisito Sqlite3
tar -vzxf libs/sqlite3.tar.gz
mv sqlite-autoconf-3330000 sqlite3-src
cd sqlite3-src
./configure --prefix=/tmp/sqlite3
make
make install
cd ..
rm -rf sqlite3-src

# Agora sim o PHP7
tar -xvf libs/php.tar.gz
mv php-7.4.11 php-src
cd php-src
./configure --prefix=$HOME/lighttpd/deps/php --with-config-file-path=$HOME/lighttpd/etc LIBXML_LIBS=/tmp/libxml2/lib LIBXML_CFLAGS=-I/tmp/libxml2/include/libxml2 SQLITE_LIBS=/tmp/sqlite3/lib SQLITE_CFLAGS=-I/tmp/sqlite3/include --disable-all --disable-cli 
make
make install
cd ..
rm -rf php-src

cd ~/lighttpd
printf 'fastcgi.server += (
    ".php" => ((
        "bin-path" => "'>>etc/lighttpd.conf
printf $HOME>>etc/lighttpd.conf
echo '/lighttpd/deps/php/bin/php-cgi",
        "socket" => "/tmp/php.socket",
        "bin-environment" => (
            "PHP_FCGI_CHILDREN" => "4",
            "PHP_FCGI_MAX_REQUESTS" => "10000"
        ),
        "bin-copy-environment" => (
            "PATH", "SHELL", "USER"
        ),
        "broken-scriptfilename" => "enable",
        "min-procs" => 1,
        "max-procs" => 1,
        "idle-timeout" => 20
    ))
)'>>etc/lighttpd.conf
