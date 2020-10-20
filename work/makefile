all: server php ssl index

server-php: server php

server-https: server ssl

server-index: server index

server:
	@ chmod +x instalar.sh
	@ ./instalar.sh

php:
	@ chmod +x php.sh
	@ ./php.sh

ssl:
	@ chmod +x ssl.sh
	@ ./ssl.sh

index:
	@ chmod +x index.sh
	@ ./index.sh