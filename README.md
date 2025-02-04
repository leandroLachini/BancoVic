## Projeto BancoVic | ELT com Snowflake/DBT e BI com POWER BI
#### Objetivo do projeto
Este projeto tem como objetivo usar Modern Data Stack para criar um dashboard dinâmico no Power BI usando o conjunto de dados do BancoVic. A análise desenvolvido foi um estudo para aprimorar os conchecimentos na área de Engenhria de Analytcs. A solução integra o Data Warehouse Snowflake para armazenamento de dados, DBT para transformação de dados e Power BI para visualização.

#### Estrutura do Projeto
1. Fonte de dados.
Sistema ERP do BancoVic, no formato .CSV.

2. Camada de ingestão.
Realizada através dos arquivos fornecidos de forma manual através das seeds.

3. Camada de transformação.
Responsável por processar e armazenar dados extraídos de fontes de dados originais em seu formato final para consumo por produtos de dados. Utilizei o data warehouse Snowflake com integração DBT para transformação de dados.

4. Camada de produtos.
Camada que expõe produtos de dados a consumidores externos à plataforma de dados, como analistas de dados. Conectado o Power BI ao banco de dados Snowflake para desenvolvido dos dashboards interativos.

#### Criado um painel interativo com:
- Informações das agências do banco.
- Análise dos clientes.
- Análise dos colaboradores.
- Informações das contas registradas no banco e seu perfil.
- Análise das propostas.
- Análise das transações.

### Principais recursos
- Modern Data Stack: Arquitetura em nuvem mais flexível e capaz de lidar com a grande quantidade de dados que as empresas recebem atualmente.
- Data Warehouse: Um repositório grande e centralizado que armazena dados estruturados e semiestruturados. Ele fornece uma fonte única para analistas e cientistas de dados.
- Business Inteligence: Business intelligence (BI) e ferramentas analíticas são usadas para visualizar e analisar dados.

### Tecnologias Utilizadas
- Snowflake: armazenamento de banco de dados.
- DBT: Transformação de dados.
- Power BI: Visualização de dados e criação de dashboards.