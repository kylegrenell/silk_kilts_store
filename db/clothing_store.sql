DROP TABLE IF EXISTS clothes;
DROP TABLE IF EXISTS clothing_stores;

CREATE TABLE clothing_stores(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
address VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE clothes(
id SERIAL4 PRIMARY KEY,
type VARCHAR(255),
clothing_store_id INT4 REFERENCES 
clothing_stores(id)
);