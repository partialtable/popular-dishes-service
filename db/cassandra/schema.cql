-- cassandra schema
-- cassandra doesn't have foreign key/join/ groupby etc

DROP KEYSPACE IF EXISTS dishes_service;
CREATE KEYSPACE dishes_service WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1 };

USE dishes_service_keyspace;

CREATE TABLE restaurant_by_id (
  restaurant_id int PRIMARY KEY,
  name text,
  city text,
  state text,
  zip_code text,
  phone text,
  email text
);

CREATE TABLE user_by_id (
  user_id int PRIMARY KEY,
  name text,
  avatar_url text,
  first_name text,
  last_name text,
  phone text,
  email text,
);

CREATE TABLE dishes_by_restaurant (
  restaurant_id int,
  dish_id int,
  restaurant_name text,
  ingredients text,
  picture text,
  -- PRIMARY KEY (restaurant_name, dish_id)
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
-- WITH CLUSTERING ORDER BY (empno ASC);
