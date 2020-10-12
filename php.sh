#!/bin/bash
# Pré-requisito Libxml2
tar -vzxf libxml2.tar.gz
mv libxml2-2.9.7 libxml2-src
cd libxml2-src
./configure --prefix=$HOME/lighttpd-semroot/libxml2 --without-python
make
make install
rm -rf libxml2-src

# Pré-requisito Sqlite3
tar -vzxf sqlite3.tar.gz
mv sqlite-autoconf-3330000 sqlite3-src
cd sqlite3-src
./configure --prefix=$HOME/lighttpd-semroot/sqlite3
make
make install
rm -rf sqlite3-src

# Agora sim o PHP7
mkdir php etc
tar -xvf php.tar.gz
mv php-7.4.11 php-src
cd php-src
./configure --prefix=$HOME/lighttpd-semroot/php --with-config-file-path=$HOME/lighttpd-semroot/etc LIBXML_LIBS=-L$HOME/lighttpd-semroot/libxml2/lib LIBXML_CFLAGS=-I$HOME/lighttpd-semroot/libxml2/include/libxml2 SQLITE_LIBS=-L$HOME/lighttpd-semroot/sqlite3/lib SQLITE_CFLAGS=-I$HOME/lighttpd-semroot/sqlite3/include
make
make install
rm -rf php-src
