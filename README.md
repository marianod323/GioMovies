# Seminário de Linguagens de Marcação Extensíveis

[TOC]

## Instalação

### Perl
Perl é uma linguagem bastante utilizada na criação de scripts. Para sua instalação, basta acessar o [link](perl.org/get.html) e seguir as instruções. Em algumas distribuições Linux, a linguagem vem instalada por padrão.

### CPANM
CPAN é o gerenciador de módulos nativo da linguagem Perl, contudo, ele tem uma complexidade elevada e necessita de muita configuração. Portanto, o módulo CPAN Minus foi utilizado. Ele simplifica o gerenciamento de pacotes e torna mais simples a instalação das dependências.

```sh
curl -L https://cpanmin.us | perl - --sudo App::cpanminus
cpanm --self-upgrade --sudo
```

### XML::LibXML
Para a validação dos arquivos, buscas em xPath e geração do site, utilizou-se diversas funções da biblioteca LibXML.
```sh
sudo cpanm XML::LibXML
```
```perl
use XML::LibXML; # Importação da biblioteca
```

### XML::<zero-width space>LibXSLT::Easy
Para gerar os documentos HTML com o *parsing* em XSL, utilizamos a biblioteca LibXSLT::Easy, pois, apesar de não possuir todas as funcionalidades que a LibXSLT, é mais simples e executa todo o processamento do XSL em uma linha.
```sh
sudo cpanm XML::LibXSLT::Easy
```
```perl
use XML::LibXSLT::Easy;
```

### Bibliotecas complementares
Diversas bibliotecas auxiliares foram utilizadas para a implementação de funções pontuais, cada uma delas estão citadas abaixo:
```sh
sudo cpanm Try::Tiny
sudo cpanm File::Copy
sudo cpanm File::Copy::Recursive
```
```perl
use Try::Tiny qw(try catch);
use File::Copy;
use File::Copy::Recursive qw(dircopy);
```
## Execuções

### DTD Validation
A validação por DTD se dá pelos arquivos na pasta "1 - DTD".
```sh
perl dtdValidation.pl <xmlFile>.xml <dtdFile>.dtd
```
Para a validação do documento XML da atividade, o comando:
```sh
perl dtdValidation.pl GioMovies.xml GioMovies.dtd
```
Após a execução, o programa retornará no terminal se o arquivo é válido ou os erros de validação.

#### Exemplos
##### Válido
```sh
Valid
```
##### Inválido
```sh
GioMovies.dtd:19: parser error : xmlParseElementDecl: 'EMPTY', 'ANY' or '(' expected
<!ELEMENT resourceRef bug>
                      ^
GioMovies.dtd:19: parser error : Content error in the external subset
<!ELEMENT resourceRef bug>
                      ^
```

### Schema Validation
A validação por Schema se dá pelos arquivos na pasta "2 - Schema".
```sh
perl schemaValidation.pl <xmlFile>.xml <xsdFile>.xsd
```
Para a validação do documento XML da atividade, o comando:
```sh
perl schemaValidation.pl GioMovies.xml GioMovies.xsd
```
Após a execução, o programa retornará no terminal se o arquivo é válido ou os erros de validação.

#### Exemplos
##### Válido
```sh
Valid
```
##### Inválido
```sh
==> GioMovies.xml:0: Schemas validity error : Element 'baseName': This element is not expected. Expected is ( instanceOf ).
GioMovies.xml:0: Schemas validity error : Element 'baseName': This element is not expected. Expected is ( instanceOf ).
GioMovies.xml:0: Schemas validity error : Element 'baseName': This element is not expected. Expected is ( instanceOf ).
GioMovies.xml:0: Schemas validity error : Element 'baseName': This element is not expected. Expected is ( instanceOf ).
...
Invalid
```

### XPath
Os arquivos de "3 - XPath" realizam a busca XPath no modelo abaixo.
```sh
perl xPath.pl <xmlFile>.xml <output>.txt "XPath Query"
```
Como as primeiras atividades exigiam funções não disponíveis na versão do XPath implementada pela LibXML, foram criados arquivos separados para tratar as funções à nível do script em Perl. Para executar todas as consultas, basta executar o script Shell.
```sh
sh xPathScript.sh
```
Após a execução, o programa retornará no arquivo de saída o resultado da query XPath.

### XSLT
A geração genérica de um documento HTML após o parser de um XSL é feita pelos arquivos em "4 - XSLT".
```sh
perl xslt.pl <xmlFile>.xml <xslFile>.xsl <output>.html
```
Para a geração do site "GioMovies", foi criado um arquivo auxiliar "xsltGioMovies.pl", que gera todas as páginas no diretório "Site" e as organiza em subpastas. Para executá-lo, basta executar o script Shell.
```sh
sh xsltGioMovies.sh
```
Após a execução, o programa retornará um arquivo HTML com o resultado do processamento do XSL.