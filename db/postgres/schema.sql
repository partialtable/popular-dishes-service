-- postgreSQL database schema

DROP DATABASE IF EXISTS dishes_service;

CREATE DATABASE dishes_service;

CREATE TABLE restaurants (
  restaurant_id SERIAL PRIMARY KEY NOT NULL,
  name CHAR(50),
  city text,
  state text,
  zip_code text,
  phone text,
  email text
);

CREATE TABLE dishes (
  dish_id SERIAL PRIMARY KEY NOT NULL,
  restaurant_id INT NOT NULL REFERENCES restaurants(restaurant_id),
  name TEXT,
  ingredients TEXT,
  picture TEXT
);

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY NOT NULL,
  dish_id INT NOT NULL REFERENCES dishes(dish_id),
  user_id INT NOT NULL REFERENCES users(user_id),
  review TEXT,
  dined_on DATE,
  stars INT,
  user_status BOOLEAN
);

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  avatar_url TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  email TEXT
);

