# Aula - Introdução ao Neo4j

Prof. Neylson Crepalde

Este repositório contém os códigos para uma aula introdutória sobre o Neo4j. Passo a passo:

## 1 - Instalação do docker

Existem várias formas de executar o Neo4j localmente. Pra mim, a mais eficiente delas é executar via docker. Por isso, vamos adotar este método nessa aula.

## 2 - Subir o cluster Neo4j

Um código bash para subir o Neo4j versão 5.1.0 está no arquivo `cluster_up.sh`. Para executá-lo, 

1. Crie uma pasta `neo4j` dentro de sua pasta HOME.
2. Dentro da pasta `neo4j`, crie 4 pastas com os respectivos nomes: `data`, `logs`, `import` e `plugins`.
3. Execute o comando abaixo substituindo <MINHA_SENHA> por uma senha escolhida por você para acessar a database. **ATENÇÃO**: a senha deve ser escolhida na primeira vez que você subir a database.

```bash
sh cluster_up.sh <MINHAS_SENHA>
```

## 3 - Acessar a interface

Após o comando docker no passo anterior terminar de executar, podemos acessar a interface do Neo4j em http://localhost:7474/.

No primeiro acesso, coloque o usuário `neo4j` e a senha escolhida.

## 4 - Verificar o dataset escolhido

Vamos trabalhar com o famoso dataset Titanic e 

## 5 - Construir o modelo de dados com **arrows.app**

Visite https://arrows.app.

Vamos trabalhar com a modelagem do Titanic da seguinte forma:

![modelo_de_dados](/img/Titanic-2.png)

## 6 - Leitura dos dados

Para fazer a leitura dos dados direto da internet, copie o conteúdo do código `read_titanic_data.cypher`, cole no console do Neo4j e execute.

## 7 - Fazendo consultas nos dados

Alguns exemplos de consultas que podemos fazer:

Selecionando apenas os passageiros da 3 classe que embarcaram pelo portão S:

```sql
MATCH (p:Passenger)-[r:IN_CLASS]->(c:Class)
MATCH (p)-[e:EMBARKED_IN]->(g:Gate)
WHERE c.id = '3' AND g.id = 'S'
RETURN p, r, c, e, g;
```
