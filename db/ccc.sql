DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT,
  ticket_limit INT
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  film_id SERIAL4 REFERENCES films(id) ON DELETE CASCADE,
  customer_id SERIAL4 REFERENCES customers(id) ON DELETE CASCADE
);
