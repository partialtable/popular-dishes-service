-- cassandra schema
-- cassandra doesn't have join/ groupby etc
-- cassandra - Primary key(partition key, clustering key-orderby)

DROP KEYSPACE IF EXISTS dishes_service;
CREATE KEYSPACE dishes_service WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1 };

USE dishes_service;

-- Query1: show all popular dishes of each restaurant (one to many)
CREATE TABLE dishes_by_restaurant (
  restaurant_id int,
  dish_id int,
  dish_name text,
  ingredients text,
  picture text,
  PRIMARY KEY (restaurant_id, dish_id)
)

-- Query2: show all reviwes of each popular dish (one to many)
CREATE TABLE reviews_by_dish (
  dish_id int,
  review_id int,
  user_id int,
  review varchar,
  dined_on date,
  stars decimal,
  user_status boolean
  PRIMARY KEY (dish_id, dined_on)
)
WITH CLUSTERING ORDER BY (dined_on DESC);
