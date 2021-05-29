<img src="https://d3043uog1ad1l6.cloudfront.net/uploads/2020/03/photo-1584118624012-df056829fbd0.jpeg" width="500">

# PainelCOVID (Atualizado em 29/05/21)
Trabalho realizado na disciplina de Ciência de Dados I - Estatística - UFMG, 2020.  

## Requisitos
- Para executar o painel certifique-se de ter instalado todos os pacotes do arquivo *principal.Rmd*.
- É recomendado que se tenha ao menos 4gb de memória RAM para executar o painel localmente.

## Versão Web
Uma versão resumida pode ser acessada pela web [aqui](https://luckermos.shinyapps.io/covidmundo/).
Esta versão pode apresentar algum problema de limite de memória RAM excedido pela limitação da versão gratuita do *shinyapps*.

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

## Arquivos .Rmd
O painel executa os arquivos .Rmd na seguinte ordem:
1. *principal.Rmd*: Contém as configurações básicas do relatório, chama as principais funções, carrega os pacotes e, por fim, chama os relatórios do painel.
2. *analise_mundo.Rmd*: Relatório sobre a COVID-19 a nível mundial.
3. *analise_brasil.Rmd*: Relatório sobre a COVID-19 no Brasil.
4. *analise_uf.Rmd*: Relatório sobre a COVID-19 a nível estadual.

## Contribuidores

<table>
  <tr>
    <td align="center"><a href="https://github.com/luckermos"><img src="https://avatars.githubusercontent.com/u/49843691?s=100" width="100px;" alt=""/><br /><sub><b>Lucas Emanuel</b></sub></a><br /><a href="https://github.com/luckermos" title="Github"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/git.png" width="20"></a> <a href="https://www.linkedin.com/in/luckermos/" title="LinkedIn"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/linkedin.png" width="20"></a> <a href="mailto:luckermos19@gmail.com" title="E-mail"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/email.png" width="20"></a></td>

<td align="center"><a href="https://github.com/sjlva"><img src="https://avatars.githubusercontent.com/u/63989100?s=100" width="100px;" alt=""/><br /><sub><b>Rafael T. Silva</b></sub></a><br /><a href="https://github.com/sjlva" title="Github"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/git.png" width="20"></a> <a href="https://www.linkedin.com/in/rafael-silva-807a07115/" title="LinkedIn"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/linkedin.png" width="20"></a> <a href="mailto:rafaelsilva@posteo.net" title="E-mail"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/email.png" width="20"></a></td>

<td align="center"><a href="https://github.com/anacps"><img src="https://avatars.githubusercontent.com/u/71646132?s=100" width="100px;" alt=""/><br /><sub><b>Ana Silveira</b></sub></a><br /><a href="https://github.com/anacps" title="Github"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/git.png" width="20"></a> <a href="https://www.linkedin.com/in/ana-clara-pereira-silveira-313065188/" title="LinkedIn"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/linkedin.png" width="20"></a> <a href="mailto::ana.clara_ps@hotmail.com" title="E-mail"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/email.png" width="20"></a></td>

<td align="center"><a href="https://github.com/gabr-md"><img src="https://avatars.githubusercontent.com/u/62065832?s=100" width="100px;" alt=""/><br /><sub><b>Gabriel Maciel</b></sub></a><br /><a href="https://github.com/gabr-md" title="Github"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/git.png" width="20"></a> <a href="https://www.linkedin.com/in/gabriel-maciel-717552158/" title="LinkedIn"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/linkedin.png" width="20"></a> <a href="mailto::gabrielmacieldias@hotmail.com" title="E-mail"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/email.png" width="20"></a></td>

<td align="center"><a href="https://github.com/LuisHVelasquez"><img src="https://avatars.githubusercontent.com/u/62065832?s=100" width="100px;" alt=""/><br /><sub><b>Luis Henrique V.</b></sub></a><br /><a href="https://github.com/LuisHVelasquez" title="Github"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/git.png" width="20"></a> <a href="https://www.linkedin.com/in/luis-henrique-velasquez-3681a6187/" title="LinkedIn"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/linkedin.png" width="20"></a> <a href="mailto::luisvelasquez@ufmg.br" title="E-mail"><img src="https://raw.githubusercontent.com/luckermos/logos/main/social/email.png" width="20"></a></td>

  </tr>
</table>
