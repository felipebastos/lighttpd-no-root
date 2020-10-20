NOME = 'lighttpd-no-root'
VERSAO = 0.5.1
SUMAPP = sha256sum

all: generate-build update-checksum checksum

reall: clean-before all

clean-before:
	@ echo 'Limpando última versão'
	@ cd builds && rm $(NOME)-$(VERSAO).tar.gz $(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído'

generate-build:
	@ echo 'Gerando o build da última versão'
	@ mv work $(NOME)
	@ tar -czvf $(NOME)-$(VERSAO).tar.gz $(NOME)
	@ mv $(NOME)-$(VERSAO).tar.gz builds
	@ mv $(NOME) work
	@ echo 'Concluído'

update-checksum:
	@ echo 'Gerando checksum da última versão'
	@ cd builds && $(SUMAPP) $(NOME)-$(VERSAO).tar.gz>$(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído'

checksum:
	@ echo 'Checando sucesso do build.'
	@ cd builds && $(SUMAPP) -c $(NOME)-$(VERSAO).$(SUMAPP)
	@ echo 'Concluído.'