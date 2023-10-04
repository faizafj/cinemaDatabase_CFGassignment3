DROP DATABASE IF EXISTS Cinema;
CREATE DATABASE Cinema;

USE Cinema;

-- Movies table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT,
    movie_name VARCHAR(50),
    run_time INT,
    description VARCHAR(200),
    standard_tickets BOOLEAN,
    premium_tickets BOOLEAN,
	PRIMARY KEY (movie_id)
);

INSERT INTO movies (movie_name, run_time, description, standard_tickets, premium_tickets) VALUES
("The Little Mermaid", 90, "The story of the little Mermaid", TRUE, FALSE),
("Frozen", 60, "The story of Elsa and Anna", TRUE, FALSE),
("Avatar", 180, "The story of Avatar", TRUE, TRUE);

-- ticket details table
CREATE TABLE ticket_details (
    ticket_id INT AUTO_INCREMENT,
    ticket_name VARCHAR(50),
    ticket_description VARCHAR(150),
    ticket_price DOUBLE,
    PRIMARY KEY (ticket_Id)
);

INSERT INTO ticket_details (ticket_name, ticket_description, ticket_price) VALUES 
("Standard ticket", "Standard seating with no access to back row seating  - All viewings are in 4k", 5.50),
("Premium ticket", "Premium seating with access to back row seating - All viewings are in 4k", 7.00);
 


-- Snack table
CREATE TABLE snack_details(
 snack_id INT AUTO_INCREMENT,
 snack_name VARCHAR (140),
 price DOUBLE,
 PRIMARY KEY(snack_id));

INSERT INTO snack_details (snack_name, price) VALUES 
("Coca Cola - 250ml bottle", 2.50),
("Sprite- 275ml bottle", 2.50),
("Nachos with cheese and salsa dip", 4.50);


-- Order table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    movie_id INT,
    total_price DOUBLE,
    time_of_order TIME,
    date_of_order DATE,
    PRIMARY KEY (order_id),
    FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
);


-- Order details table
 CREATE TABLE order_snacks_details (
    order_snacks_details INT AUTO_INCREMENT,
    order_id INT,
    snack_id INT,
    snack_quantity INT,
    PRIMARY KEY (order_snacks_details),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (snack_id)
        REFERENCES snack_details (snack_id)
);

 
  
   CREATE TABLE order_ticket_details (
    order_ticket_id INT AUTO_INCREMENT,
    order_id INT,
    ticket_id INT,
    ticket_quantity INT,
    PRIMARY KEY (order_ticket_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (ticket_id)
        REFERENCES ticket_details (ticket_id)
);

  
  
INSERT INTO orders (movie_id, time_of_order, date_of_order) VALUES
 (1, now(), now());

 INSERT INTO order_ticket_details (order_id, ticket_id, ticket_quantity) VALUES 
 (1, 1, 3);
 
INSERT INTO order_snacks_details (order_id, snack_id, snack_quantity) VALUES 
 (1, 2, 3);
 
 -- Order_ticket_details
SELECT * FROM movies;
SELECT * FROM ticket_details;
SELECT * FROM snack_details;
SELECT * FROM orders;
SELECT * FROM order_ticket_details;
SELECT * FROM order_snacks_details;


  