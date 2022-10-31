//ALGUMAS ANALISES
// ---------------
// Apenas passageiros da 3 classe que embarcaram pelo portao S
MATCH (p:Passenger)-[r:IN_CLASS]->(c:Class)
MATCH (p)-[e:EMBARKED_IN]->(g:Gate)
WHERE c.id = '3' AND g.id = 'S'
RETURN p, r, c, e, g;

// Média de idade por classe
MATCH (p:Passenger)-[r:IN_CLASS]->(c:Class)
RETURN c, AVG(p.age) as idade_media

// Média de valor da tarifa e contagem de pessoas por classe apenas para 2 e 3 classe
MATCH (p:Passenger)-[r:IN_CLASS]->(c:Class)
WHERE c.id IN ['1', '3']
RETURN c, AVG(p.fare) as tarifa_media, COUNT(p) as npessoas;
