#@(#) Este makefile realiza o processo de instalação do Lighttpd sem acesso root
# Felipe Bastos Nunes - 21/Oct/2020
# Leia o arquivo LICENSE para detalhes sobre cópia e uso deste pacote.
ajuda:
	@ echo 'help - exibe esta ajuda.'
	@ echo 'server - instala apenas o servidor.'
	@ echo 'php - instala o php em servidor já instalado, no local padrão.'
	@ echo 'ssl - configura o HTTPS em servidor já instalado, no local padrão.'
	@ echo 'index - insere arquivos básicos de um site num servidor já instalado, no local padrão.'
	@ echo 'admin-mod - Adiciona scripts para administrar o servidor em interface web.'
	@ echo 'all - instala o pacote completo.'
	

all: server php ssl index admin-mod

admin-mod:
	@ echo '--------------------------------------------------------------------------------'
	@ echo 'Instalação do módulo de administração.'
	@ chmod +x admin.sh
	@ ./admin.sh
	@ echo 'Concluída a instalação do módulo de instalação.'
	@ echo '--------------------------------------------------------------------------------'

server:
	@ echo '--------------------------------------------------------------------------------'
	@ echo 'Instalação do servidor.'
	@ chmod +x instalar.sh
	@ ./instalar.sh
	@ echo 'Concluída a instalação do servidor.'
	@ echo '--------------------------------------------------------------------------------'

php:
	@ echo '--------------------------------------------------------------------------------'
	@ echo 'Instalação do PHP.'
	@ chmod +x php.sh
	@ ./php.sh
	@ echo 'Concluída a instalação do PHP.'
	@ echo '--------------------------------------------------------------------------------'

ssl:
	@ echo '--------------------------------------------------------------------------------'
	@ echo 'Habilitando o uso de HTTPS.'
	@ chmod +x ssl.sh
	@ ./ssl.sh
	@ echo 'Habilitado o uso de HTTPS.'
	@ echo '--------------------------------------------------------------------------------'

index:
	@ echo '--------------------------------------------------------------------------------'
	@ echo 'Inserindo um site exemplo para experimentos.'
	@ chmod +x index.sh
	@ ./index.sh
	@ echo 'Inserido o site exemplo.'
	@ echo '--------------------------------------------------------------------------------'
