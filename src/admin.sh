#!/bin/bash
#@(#) Este script adiciona exemplos em PHP no Lighttpd
# Felipe Bastos Nunes - 21/Oct/2020
# Leia o arquivo LICENSE para detalhes sobre cópia e uso deste pacote.

raiz=`pwd`
echo 'Entrando em ' $raiz
cd $raiz
echo 'Copiando...'
`cp -r extras/admin $HOME/lighttpd/www/admin`
echo 'Concluído.'
