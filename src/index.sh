#!/bin/bash
#@(#) Este script adiciona um site básico no Lighttpd
# Felipe Bastos Nunes - 21/Oct/2020
# Leia o arquivo LICENSE para detalhes sobre cópia e uso deste pacote.

raiz=`pwd`
echo 'Entrando em ' $raiz
cd $raiz
echo 'Copiando...'
`cp -r extras/estudos/* $HOME/lighttpd/www/`
echo 'Concluído.'
