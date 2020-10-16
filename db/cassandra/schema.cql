-- cassandra schema
-- cassandra doesn't have join/ groupby etc

DROP KEYSPACE IF EXISTS dishes_service_keyspace;
CREATE KEYSPACE dishes_service_keyspace WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1 };

USE dishes_service_keyspace;

CREATE TABLE restaurant_by_id (
  restaurant_id int PRIMARY KEY,
  name text
);

CREATE TABLE user_by_id (
  user_id int PRIMARY KEY,
  name TEXT,
  avatar_url TEXT,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE dishes_by_restaurant (
  restaurant_id int,
  dish_id int,
  name text,
  ingredients text,
  picture text,
  PRIMARY KEY (restaurant_id, dish_id)
)

--  one dish to many reviews (one to many)
CREATE TABLE reviews_by_dish (
  restaurant_id int,
  dish_id int,
  review_id int,
  user_id int,
  review varchar,
  dined_on date,
  stars decimal,
  user_status boolean
  PRIMARY KEY (restaurant_id, dish_id, review_id, user_id)
)

