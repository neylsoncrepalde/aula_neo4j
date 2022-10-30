// Read Data and register Passenger Nodes
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neylsoncrepalde/titanic_data_with_semicolon/main/titanic.csv' 
    AS row FIELDTERMINATOR ';'
WITH row WHERE row.PassengerId IS NOT NULL
MERGE (p:Passenger {id: toInteger(row.PassengerId)})
SET p.name = row.Name
SET p.sex = row.Sex
SET p.age = toFloat(row.Age);

// Register Class Nodes
MERGE (c:Class {id: '1'});
MERGE (c:Class {id: '2'});
MERGE (c:Class {id: '3'});

// Read Data and register :IN_CLASS relations
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neylsoncrepalde/titanic_data_with_semicolon/main/titanic.csv' 
    AS row FIELDTERMINATOR ';'
WITH row WHERE row.PassengerId IS NOT NULL
MATCH (p:Passenger {id: toInteger(row.PassengerId)})
MATCH (c:Class {id: row.Pclass})
MERGE (p)-[:IN_CLASS]-> (c);

// Read Data and register Gate nodes
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neylsoncrepalde/titanic_data_with_semicolon/main/titanic.csv' 
    AS row FIELDTERMINATOR ';'
WITH row WHERE row.PassengerId IS NOT NULL
MERGE (g:Gate {id: coalesce(row.Embarked, 'Unknown')});

// Read Data and register :EMBARKED_IN relations
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neylsoncrepalde/titanic_data_with_semicolon/main/titanic.csv' 
    AS row FIELDTERMINATOR ';'
WITH row WHERE row.PassengerId IS NOT NULL
MATCH (p:Passenger {id: toInteger(row.PassengerId)})
MATCH (g:Gate {id: coalesce(row.Embarked, 'Unknown')})
MERGE (p)-[:EMBARKED_IN]-> (g);
