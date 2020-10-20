#!/bin/bash

raiz=`pwd`
echo 'Entrando em ' $raiz
cd $raiz
echo 'Copiando...'
`cp -r estudos/* $HOME/lighttpd/www/`
echo 'Concluído.'