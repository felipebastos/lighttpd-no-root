#@(#) Este makefile gerencia os processos de desenvolvimento do lighttpd-no-root
# Felipe Bastos Nunes - 21/Oct/2020
# Leia o arquivo LICENSE para detalhes sobre cópia e uso deste pacote.
NOME = 'lighttpd-no-root'
VERSAO = 0.5.3
SUMAPP = sha256sum

all: generate-build update-checksum checksum

reall: clean-before all

clean-before:
	@ echo 'Limpando última versão'
	@ cd build && rm $(NOME)-$(VERSAO).tar.gz $(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído'

generate-build:
	@ echo 'Gerando o build da última versão'
	@ mv src $(NOME)
	@ tar -czvf $(NOME)-$(VERSAO).tar.gz $(NOME)
	@ mv $(NOME)-$(VERSAO).tar.gz build
	@ mv $(NOME) src
	@ echo 'Concluído'

update-checksum:
	@ echo 'Gerando checksum da última versão'
	@ cd build && $(SUMAPP) $(NOME)-$(VERSAO).tar.gz>$(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído'

checksum:
	@ echo 'Checando sucesso do build.'
	@ cd build && $(SUMAPP) -c $(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído.'
