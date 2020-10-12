#!/bin/bash
# Pré-requisito Libxml2
tar -vzxf libxml2.tar.gz
cd libxml2-2.9.7
./configure -prefix=$HOME/lighttpd-semroot/libxml2 --without-python
make
make install
rm -rf libxml2-2.9.7

# Pré-requisito Sqlite3

tar -xvf php.tar.gz
mv php-7.4.11 php-src
cd php-src
mkdir php etc
./configure --prefix=$HOME/lighttpd-semroot/php --with-config-file-path=$HOME/lighttpd-semroot/etc LIBXML_LIBS=$HOME/lighttpd-semroot/libxml2/lib LIBXML_CFLAGS=$HOME/lighttpd-semroot/libxml2/include --without-sqlite3
make
make install
rm -rf php-src
