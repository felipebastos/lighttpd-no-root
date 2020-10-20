# LIGHTTPD-NO-ROOT
## Downloads
Todos os builds e checksums estão na pasta [builds](https://www.github.com/felipebastos/lighttpd-no-root/builds/) do repositório.

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
Se você encontrar uma falha, ou tiver sugestões de funcionalidades, por favor, abra uma "issue" no repositório.

Pedimos que se forem várias sugestões, abra uma para cada, de modo que possam ser atendidas individualmente, conforme possível.

# Dependências
Utilizamos o Lighttpd, também licenciado sob a BSD, disponível  em http://www.lighttpd.net/

Registramos agradecimento a gstrauss, mantenedor do Lighttpd, que, após um singelo pedido, providenciou um meio para acesso automatizado a última versão do software.
