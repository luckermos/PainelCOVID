# PainelCOVID (em progresso)
Trabalho em progresso na disciplina de Ciência de Dados I - Estatística - UFMG, 2020.  
Visite nosso [painel](https://luckermos.shinyapps.io/painelcovid/).

## Requisitos
Para reproduzir nosso painél em sua máquina certifique-se de ter instalado todos os pacotes no arquivo principal.Rmd.

## Como reproduzir localmente
Para reproduzir o painél localmente, execute o arquivo principal.Rmd.

## Dados utilizados
Os dados de covid a nível mundial são coletados da [Universidade de Jhon Hopkins](https://github.com/CSSEGISandData/COVID-19).    
As estimativas das populações são coletados do [World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL).    
Os dados de covid no Brasil são coletados do [Painél Coronavírus](https://covid.saude.gov.br/).    

## Coleta dos dados
Os dados são coletados pelo R, através de nosso [pacote](https://github.com/sjlva/covidRdata).

## Estrutura do projeto
Nosso projeto está estruturado da seguinte forma:
- Na pasta dados: temos sempre a versão mais atualizada dos bancos de dados que utilizamos, para efeitos de gerenciamento de processamento e armazenamento, todos os arquivos estão em .rds.  
- Na pasta funcoes: temos funções que são de uso geral, a fim de modularizar alguns trechos do código.  
- Na pasta imagens: temos algumas imagens que funcionam como ícones para o painél.  
- Na pasta www: temos o bootstrap, nosso css que aplica estilo ao nosso painél.
- No diretório principal temos 4 arquivos em Rmarkdown, que operam de forma independente, facilitando o trabalho em equipe.

## Arquivos .Rmd
O painél executa os arquivos .Rmd na seguinte ordem:
- principal.Rmd: Contém as configurações básicas do relatório, chama as principais funções, carrega os pacotes e por fim chama os relatórios de painél.
- analise_mundo.Rmd: É o relatório sobre o covid a nível mundial.
- analise_brasil.Rmd: É o relatório sobre o covid no Brasil.
- analise_uf.Rmd: É o relatório com sobre o covid a nível estadual.







