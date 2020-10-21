# LIGHTTPD-NO-ROOT
## Downloads
Todos os builds e checksums estão na pasta [builds](https://github.com/felipebastos/lighttpd-no-root/releases) do repositório.

## O que é o Lighttpd-no-root?
Um script que permite instalar e executar o Lighttpd em sistemas Linux sem necessidade de acesso root.

O que o script já faz:
- Permite escolher dentre baixar a última versão disponível do servidor (o que pode trazer novos desafios de configuração não previstos);
- Faz checksum do download para garantir a integridade;
- Caso o aparelho em questão não tenha acesso a rede, o "pack.tar.gz" contém a versão 1.4.55, para instalação "offline".
- habilitado o FastCGI ou similar para uso/estudo de PHP 7.4;
- Criados scripts que facilitem executar, reiniciar e desinstalar o pacote.

Planos para o futuro:
- criar uma pequena home padrão com tutoriais para uso em sala de aula presencial/remota de temas como: configuração de um servidor HTTP, configuração e deploy de uma aplicação web em PHP;

## Como utilizá-lo?
Você tem duas opções: makefile ou scripts individuais. O makefile foi criado para evitar erro na ordem de execução dos scripts, sendo o meio preferencial. Porém, como o objetivo deste pacote é contornar a ausência de acesso de administrador, caso ele não esteja presente, pode-se utilizar diretamente os scripts.

### Make
Caso seu sistema já tenha instalado o software **make**, e deseja instalar todo o pacote, apenas execute no terminal:
`make all`

Para outras opções, execute:
`make help`

### Scripts
Os scripts estão configurados para rodar com shell **bash**. Caso seu sistema operacional não tem o bash instalado, será necessário alterar a primeira linha de cada script para o shell disponível e, em alguns casos, adaptar o código a limitações do mesmo.
Para instalar todo o pacote, você precisará realizar o chamado aos scripts na seguinte ordem:
`chmod +x *.sh`
`./instalar.sh`
`./php.sh`
`./ssl.sh`
`./index.sh`
`./admin.sh`

Você pode omitir o php.sh e o admin.sh caso não deseje utilizar o PHP. Também, caso não deseje utilizar HTTPS, pode omitir ssl.sh.

Para mais explicações acesse o diretório *docs* onde poderá encontrar explicações para o funcionamento dos scripts e motivo das configurações prévias.

## Estrutura da instalação
O lighttpd será instalado em HOME/lighttpd.
Internamente segue o esboço abaixo:
- lighttpd
  - deps (o PHP será instalado aqui)
  - etc
    - lighttpd.conf (Arquivo de configuração do servidor)
  - lib
  - logs (logs de funcionamento e erro do sistema)
  - sbin
    - lighttpd (binário para iniciar o servidor)
  - share
  - uploads (configurado previamente para guardar arquivos que algum script permita upload)
  - www (diretório para armazenar os sites - é necessário reiniciar o serviço sempre que houver alteração em seu conteúdo)

## Como ajudar
Você pode ajudar de duas formas:

### Como usuário do pacote
Se houver alguma funcionalidade comum nos estudos de instalação e configuração de servidores HTTP, por favor, abra uma *issue* solicitando, e descrevendo a mesma. Se tiver links da documentação, adicione, ajudará bastante.

Se ocorrer algum erro na execução dos scripts, na compilação dos pacotes, ou na execução dos mesmos, abra uma *issue* em que descreve o erro, que comandos você executou e anexe conteúdo útil como: texto no terminal do começo da execução do comando até o final (isso pode ajudar pois pode evidenciar um erro de compilação, ou a ausência de uma biblioteca), ou o lighttpd.conf e logs do servidor (na pasta logs da instalação).

### Como desenvolvedor
Se quiser ajudar a refinar o projeto ou adicionar novas funcionalidades, fique a vontade para me contatar no [telegram][t.me/felipebasnun] ou no [twitter][https://www.twitter.com/ehlogico_], e quem sabe eu lhe adiciono ao repositório para poder realizar *pull requests* e etc.

# Dependências
O pacote inclui:
  - Lighttpd 1.4.55, também licenciado sob a BSD, disponível  em seu [site oficial][http://www.lighttpd.net/]
  - PHP 7.4.11, licenciado sob a licença PHP, disponível em seu [site oficial][https://www.php.net]
  - Sqlite 3, software em domínio público, disponível em seu [site oficial][https://sqlite.org/index.html]
  - LibXML2, sob a licença MIT, disponível em seu [site oficial][http://www.xmlsoft.org/]

Se apesar do checksum você não se sentir seguro em utilizar os arquivos inclusos no pacote, fique a vontade para realizar seu download, apenas os renomeando para o mesmo nome utilizado pelos scripts.

Registramos agradecimento a gstrauss, mantenedor do Lighttpd, que, após um singelo pedido, providenciou um meio para acesso automatizado a última versão do software.
