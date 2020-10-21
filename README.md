# PainelCOVID (em progresso)
Trabalho em progresso na disciplina de Ciência de Dados I - Estatística - UFMG, 2020.  
Visite nosso [painel](https://luckermos.shinyapps.io/covidmundo/).

## Requisitos
Para reproduzir nosso painel em sua máquina certifique-se de ter instalado todos os pacotes no arquivo *principal.Rmd*.

## Como reproduzir localmente
Para reproduzir o painel localmente, execute o arquivo *principal.Rmd*.

## Dados utilizados
Os dados de covid a nível mundial são coletados da [Universidade de Johns Hopkins](https://github.com/CSSEGISandData/COVID-19).    
As estimativas das populações são coletados do [World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL).    
Os dados de covid no Brasil são coletados do [Painel Coronavírus](https://covid.saude.gov.br/).    

## Coleta dos dados
Os dados são coletados pelo **R**, através de nosso cronjob.

## Estrutura do projeto
Nosso projeto está estruturado da seguinte forma:
- Na pasta *dados*: temos sempre a versão mais atualizada dos bancos de dados que utilizamos, para efeitos de gerenciamento de processamento e armazenamento. Todos os arquivos estão em *.rds*.  
- Na pasta *funcoes*: temos funções que são de uso geral, a fim de modularizar alguns trechos do código.  
- Na pasta *imagens*: temos algumas imagens que funcionam como ícones para o painel.  
- Na pasta *www*: temos o *bootstrap*, nosso *css* que aplica estilo ao nosso painel.
- No diretório principal temos 4 arquivos em *Rmarkdown*, que operam de forma independente, facilitando o trabalho em equipe.
- Na pasta *Relatório Descritiva*: temos nosso relatório descritivo.
- Na pasta *cronjob*: temos os scripts necessários para realizar o download automático dos banco de dados citados.

## Arquivos .Rmd
O painel executa os arquivos .Rmd na seguinte ordem:
1. *principal.Rmd*: Contém as configurações básicas do relatório, chama as principais funções, carrega os pacotes e por fim chama os relatórios do painel.
2. *analise_mundo.Rmd*: É o relatório sobre o covid a nível mundial.
3. *analise_brasil.Rmd*: É o relatório sobre o covid no Brasil.
4. *analise_uf.Rmd*: É o relatório sobre o covid a nível estadual.







