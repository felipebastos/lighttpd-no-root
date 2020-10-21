#!/bin/bash
#@(#) Este script realiza o processo de configuração de HTTPS do Lighttpd
# Felipe Bastos Nunes - 21/Oct/2020
# Leia o arquivo LICENSE para detalhes sobre cópia e uso deste pacote.

# Gerando o arquivo com as chaves de criptografia
# CUIDADO: Esta criptografia é completamente básica, apenas para uso de estudos.
# O servidor responderá agora em duas portas, por padrão:
# http://localhost:3000/ Será executado sem criptografia na porta 3000
# https://localhost:1443/ Será executado com criptografia na porta 1443
# Como não há acesso root, não temos permissão para uso de portas abaixo do 1000
# Como a chave criada é auto-assinada, os navegadores a terão como insegura e
# pedirão permissão do usuário.
cd ~/lighttpd/etc
mkdir certs
cd certs
`openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days 365 -nodes`
chmod 400 lighttpd.pem

# Configurando o uso do SSL no Lighttpd
cd ~/lighttpd
printf 'server.modules += ("mod_openssl")
$SERVER["socket"] == ":1443" {
  ssl.engine = "enable" 
  ssl.pemfile = "'>>etc/lighttpd.conf
printf $HOME>>etc/lighttpd.conf
echo '/lighttpd/etc/certs/lighttpd.pem" 
}'>>etc/lighttpd.conf

./restart.sh
