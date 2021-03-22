<img src="https://d3043uog1ad1l6.cloudfront.net/uploads/2020/03/photo-1584118624012-df056829fbd0.jpeg" width="500">

# PainelCOVID (Paralizado em 27/10/20)
Trabalho realizado na disciplina de Ciência de Dados I - Estatística - UFMG, 2020.  
Visite nosso [painel](https://luckermos.shinyapps.io/covidmundo/).

## Requisitos
Para executar o painel certifique-se de ter instalado todos os pacotes do arquivo *principal.Rmd*.

## Como reproduzir localmente
Para executar o painel localmente execute o arquivo *principal.Rmd*.

## Dados utilizados
Os dados da COVID-19 a nível mundial são coletados da [Universidade de Johns Hopkins](https://github.com/CSSEGISandData/COVID-19).    
As estimativas das populações são coletados do [World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL).    
Os dados da COVID-19 no Brasil são coletados do [Painel Coronavírus](https://covid.saude.gov.br/).    

## Coleta dos dados
Os dados são coletados pelo **R**, através do cronjob construído.

## Estrutura do projeto
O projeto está estruturado da seguinte forma:
- Na pasta *dados*: bancos de dados. Todos os arquivos estão em *.rds*.  
- Na pasta *funcoes*: funções que são de uso geral, a fim de modularizar alguns trechos do código.  
- Na pasta *imagens*: algumas imagens que funcionam como ícones para o painel.  
- Na pasta *www*: *css* que aplica estilo ao painel.
- No diretório principal estão 4 arquivos em *Rmarkdown*, que operam de forma independente, facilitando o trabalho em equipe.
- Na pasta *Relatório Descritiva*: relatório descritivo.
- Na pasta *cronjob*: scripts necessários para realizar o download automático dos banco de dados citados.

## Arquivos .Rmd
O painel executa os arquivos .Rmd na seguinte ordem:
1. *principal.Rmd*: Contém as configurações básicas do relatório, chama as principais funções, carrega os pacotes e, por fim, chama os relatórios do painel.
2. *analise_mundo.Rmd*: Relatório sobre a COVID-19 a nível mundial.
3. *analise_brasil.Rmd*: Relatório sobre a COVID-19 no Brasil.
4. *analise_uf.Rmd*: Relatório sobre a COVID-19 a nível estadual.
