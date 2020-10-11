#!/bin/bash

echo "Olá, vou lhe ajudar a instalar o servidor HTTP Lighttpd sem precisar de senha de super-usuário num sistema Linux qualquer."
echo "É importante que você compreenda que é para uso apenas educacional. Não tente rodar projetos reais (produção) com ele, pois muitas bibliotecas de segurança podem estar desativadas para permitir a execução."
echo "Primeiro me informe, por favor, se seu computador é provido de internet. (sim/não)"
read internet
latest="lighttpd-1.4.45"
if [ $internet == "sim" ]
then
	echo "OK, vou baixar uma das últimas versões do Lighttpd (1.4.55 foi a última que testei), aguarde..."
	`wget https://download.lighttpd.net/lighttpd/releases-1.4.x/latest.txt`
	latest=`cat latest.txt`
	`wget https://download.lighttpd.net/lighttpd/releases-1.4.x/$latest.tar.gz`
	`wget https://download.lighttpd.net/lighttpd/releases-1.4.x/$latest.sha256sum`
	`sha256sum --check $latest.sha256sum --ignore-missing --status`
	`rm $latest.sha256sum`
    confere=$?
    if [ confere == 1 ]
    then
        echo "Não posso garantir a segurança do arquivo baixado."
        echo "Contate o desenvolvedor do script."
        exit
    else
        echo "Checksum [OK]"
        `mv $latest.tar.gz server.tar.gz`
    fi
	rm latest.txt
	echo "Terminei o download! Descompactando..."
else
	echo "OK, vou utilizar o que veio no pacote, aguarde..."
	`cp pack.tar.gz server.tar.gz`
fi
`tar -xzf server.tar.gz`
`mv $latest server-src`
echo "Entrando no diretório do código fonte... [$latest]"
cd server-src
echo "Configurando o make e executando"
mkdir ~/lighttpd
echo "1 - Diretório destino criado."
# As opções de "without" estão aí para contornar algumas limitações.
# Por exemplo, para instalar e rodar num datashow que rodava um linux bem limitado, precisava desativar também
# o pcre. Então, se ao tentar executar o script, você perceber que ele acusa que não tem uma biblioteca (ele
# mostra isso ao chegar no passo 2 e 3), basta procurar qual opção desativa o uso dessa biblioteca.
./configure --prefix=$HOME/lighttpd --without-bzip2 #--without-pcre
echo "2 - Make configurado."
make
echo "3 - Make preparado"
make install
cd ..
rm -rf server-src
rm server.tar.gz
echo "4 - Instalação concluída, aguarde configuração inicial do servidor..."
cd ~/lighttpd
echo "5 - Criando pastas de configuração e armazenamento dos arquivos web..."
mkdir etc www
echo "6 - Criando arquivo de configuração"
touch etc/lighttpd.conf
mkdir www/cgi-bin
echo 'server.document-root = "/home/felipe/lighttpd/www/"
server.port = 3000
mimetype.assign = (
    ".html" => "text/html",
    ".txt" => "text/plain",
    ".jpg" => "image/jpeg",
    ".png" => "image/png",
    ".css" => "text/css"
)
'>> etc/lighttpd.conf

echo "Muito bem, agora vou iniciar o servidor, faça bom proveito!"
echo "Lembre-se que o servidor está rodando em http://localhost:3000"
echo "Para reiniciar o servidor: ctrl+c e depois :"
echo "cd ~/lighttpd/sbin"
echo "./lighttpd -Df ../etc/lighttpd.conf"
cd ~/lighttpd/sbin
./lighttpd -Df ../etc/lighttpd.conf
