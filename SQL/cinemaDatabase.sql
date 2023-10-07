DROP DATABASE IF EXISTS Cinema;
CREATE DATABASE Cinema;
USE Cinema;


-- Movies table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT NOT NULL,
    movie_name VARCHAR(50) UNIQUE,
    run_time INT,
    movie_description VARCHAR(350),
    standard_tickets BOOLEAN,
    premium_tickets BOOLEAN,
	PRIMARY KEY (movie_id)
);

-- Movies Data: 
INSERT INTO movies (movie_name, run_time, movie_description, standard_tickets, premium_tickets) VALUES
("The Little Mermaid 2023", 90, "A young mermaid makes a deal with a sea witch to trade her beautiful voice for human legs so she can discover the world above water and impress a prince.", TRUE, FALSE),
("Frozen", 60, "When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.", TRUE, FALSE),
("Avatar", 180, "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.", TRUE, TRUE),
("Everything Everywhere All at Once", 139, "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance.", TRUE, TRUE),
("The Hobbit: An Unexpected Journey", 180, "A reluctant Hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home, and the gold within it from the dragon Smaug.", FALSE, TRUE),
("The Woman in Black", 125, "A young solicitor travels to a remote village where he discovers that the vengeful ghost of a scorned woman is terrorizing the locals.",TRUE, FALSE),
("Beauty and the Beast", 180, "A selfish Prince is cursed to become a monster for the rest of his life, unless he learns to fall in love with a beautiful young woman he keeps prisoner.",TRUE, TRUE),
("Barbie", 130, "Barbie suffers a crisis that leads her to question her world and her existence.",FALSE, TRUE),
("Oppenheimer", 180, "The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.",TRUE, TRUE),
("Spider-Man: Across the Spider-Verse", 200, "Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.",TRUE, TRUE),
("John Wick: Chapter 4", 180, "John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",TRUE, TRUE);

-- ticket details table
CREATE TABLE ticket_details (
    ticket_id INT AUTO_INCREMENT NOT NULL,
    ticket_type VARCHAR(50) UNIQUE,
    ticket_description VARCHAR(150),
    ticket_price DOUBLE,
    PRIMARY KEY (ticket_Id)
);

-- ticket types data: 
INSERT INTO ticket_details (ticket_type, ticket_description, ticket_price) VALUES 
("Standard ticket", "Standard seating with 4k viewing", 5.50),
("Premium ticket", "Premium seating with 8k viewing and DOLBY atmos", 7.00);
 

-- Snack table
CREATE TABLE snack_details(
 snack_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 snack_name VARCHAR (140) UNIQUE,
 price DOUBLE,
 type_of_snack VARCHAR (30));


-- Snacks Data: 
INSERT INTO snack_details (snack_name, price, type_of_snack) VALUES 
("Coca Cola - 250ml bottle", 2.50, "Drink"),
("Sprite- 275ml bottle", 2.50, "Drink"),
("Nachos with cheese and salsa dip", 4.50, "Miscellaneous"),
("Cheese and Onion Walkers 300g", 1.50, "Crisps"),
("Malteaser 150g", 2.50, "Chocolate"),
("Cadbury Buttons 150g", 2.50, "Chocolate"),
("Cadbury Mini Twirl Bites 150g", 2.50, "Chocolate"),
("Snickers Bar", 1.00, "Chocolate"),
("Water Bottle 250g", 1.25, "Drink"),
("Vanilla ice cream Scoop x1", 1.50, "Miscellaneous"),
("Large Popcorn - Sweet", 3.50, "Popcorn"),
("Large Popcorn - Sweet and Salted", 3.50, "Popcorn"),
("Large Popcorn - Salted", 3.50, "Popcorn"),
("Small Popcorn - Sweet", 1.50, "Popcorn"),
("Small Popcorn - Sweet and Salted", 1.50, "Popcorn"),
("Small Popcorn - Salted", 1.50, "Popcorn"),
("Medium Popcorn - Sweet and Salted", 2.50, "Popcorn"),
("Medium Popcorn - Sweet", 2.50, "Popcorn"),
("Medium Popcorn - Salted", 2.50, "Popcorn")
;


 -- Order table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    movie_id INT,
    total_price DOUBLE,
    time_of_order TIME,
    date_of_order DATE,
	ticket_id INT NOT NULL,
    ticket_quantity INT NOT NULL CHECK(ticket_quantity > 0),
    total_price_of_tickets DOUBLE ,
	total_price_of_snacks DOUBLE,
    FOREIGN KEY (ticket_id)
        REFERENCES ticket_details (ticket_id),
    FOREIGN KEY (movie_id)
        REFERENCES movies (movie_id)
);
  

-- Snacks in the orders table: 
   CREATE TABLE order_snacks_details (
    order_snacks_details_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    order_id INT NOT NULL,
    snack_id INT NOT NULL,
    snack_quantity INT NOT NULL CHECK(snack_quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (snack_id) REFERENCES snack_details (snack_id)
);

-- Orders Data: 
INSERT INTO orders (movie_id, time_of_order, date_of_order, ticket_id, ticket_quantity) VALUES
 (1, "11:22:27", "2023-09-30", 1, 3),
 (2, "10:35:23", "2023-10-01", 2, 2),
 (1, "12:40:19", "2023-10-02", 2, 4),
 (4, "12:49:58", "2023-10-02", 1, 5),
(8, "12:55:24", "2023-10-02", 2, 5),
(5, "12:59:24", "2023-10-02", 2, 2), 
(11, "13:01:39", "2023-10-02", 1, 3),
(9, "08:59:24", "2023-10-03", 1, 9)
;

 
-- Snacks ordered Data: 
INSERT INTO order_snacks_details (order_id, snack_id, snack_quantity ) VALUES 
 (1, 2, 3),
 (1, 3, 1),
 (1, 5, 2),
 (2, 1, 1),
 (3, 5, 2),
 (3, 14, 3),
 (3, 11, 1),
 (4, 1, 1),
(5, 19, 1),
(6, 5,  2),
(6, 1,  2),
(6, 3,  1),
(7, 13,  2),
(7, 14,  1),
(7, 8,  3),
(8, 11,  3),
(8, 2,  5),
(8, 6,  4),
(8, 8,  2),
(8, 9,  4),
(8, 1,  3),
(8, 10,  7);
 

DELIMITER //
CREATE FUNCTION is_correct_ticket(
    ticket_id INT,
    isAllowed BOOLEAN
) 
RETURNS INT
DETERMINISTIC
BEGIN
    IF ticket_id = 1 THEN
		 IF isAllowed = TRUE THEN
			SET ticket_id = 1;
		ELSEIF isAllowed = FALSE THEN
			SET ticket_id = 2;
		END IF;
    ELSEIF ticket_id = 2 THEN
		 IF isAllowed = TRUE THEN
			SET ticket_id = 2;
		ELSEIF isAllowed = FALSE THEN
			SET ticket_id = 1;
		END IF;
	END IF;
    RETURN (ticket_id);
END//
DELIMITER ; 


-- Update the ticket/snacks and total price for each order:
UPDATE orders, ticket_details SET orders.total_price_of_tickets 
= ticket_details.ticket_price * orders.ticket_quantity 
WHERE orders.ticket_id = ticket_details.ticket_id;

UPDATE orders o , order_snacks_details os , snack_details s
SET o.total_price_of_snacks = s.price * os.snack_quantity 
WHERE os.order_id = o.order_id;

UPDATE orders o SET o.total_price = o.total_price_of_tickets + o.total_price_of_snacks;
-- SELECT * FROM orders;

-- updates ticket so that users can only purchase tickets with correct ticket type options e.g cannot buy premimum tickets if it's not an option
UPDATE orders o, ticket_details t, movies m 
SET o.ticket_id = is_correct_ticket(o.ticket_id, m.premium_tickets) 
WHERE t.ticket_id = o.ticket_id AND o.movie_id = m.movie_id;

-- Retrieves complete ticket data for the end user 
CREATE VIEW all_orders AS 
SELECT CONCAT("Order No: #",o.order_id) AS order_id,  o.time_of_order, 
date_format(o.date_of_order,'%D %M %Y') AS date_of_order, m.movie_name,
sd.snack_name, CONCAT("x",os.snack_quantity) AS snack_quantity,
t.ticket_type, CONCAT("x",o.ticket_quantity) ticket_quantity, 
CONCAT("£", o.total_price) AS total_price
FROM movies m INNER JOIN orders o, order_snacks_details os, snack_details sd, ticket_details t
WHERE m.movie_id = o.movie_id  AND os.snack_id = sd.snack_id  AND o.ticket_id = t.ticket_id
AND os.order_id = o.order_id ORDER BY o.date_of_order, o.time_of_order;

SELECT * FROM all_orders;

-- Displays all movies with standard viewing options.
CREATE VIEW all_standard_viewing_movies AS SELECT m.movie_name , m.run_time, m.movie_description , m.standard_tickets FROM movies m INNER JOIN ticket_details t WHERE m.standard_tickets = TRUE AND t.ticket_type = "standard ticket";
SELECT * FROM all_standard_viewing_movies;

-- Displays all movies with premium viewing options.
CREATE VIEW all_premium_viewing_movies AS SELECT m.movie_name , m.run_time, m.movie_description , m.premium_tickets FROM movies m INNER JOIN ticket_details t WHERE m.premium_tickets = TRUE AND t.ticket_type = "premium ticket";
SELECT * FROM all_premium_viewing_movies;


-- View shows 10 of the most recent orders:
CREATE VIEW latest_orders AS SELECT CONCAT("Order No: #",o.order_id) AS order_number,  o.time_of_order, 
date_format(o.date_of_order,'%D %M %Y') AS date_of_order, m.movie_name,
sd.snack_name, CONCAT("x",os.snack_quantity) AS snack_quantity,
t.ticket_type, CONCAT("x",o.ticket_quantity) ticket_quantity, 
CONCAT("£", o.total_price) AS total_price
FROM movies m INNER JOIN orders o, order_snacks_details os, snack_details sd, ticket_details t
WHERE m.movie_id = o.movie_id  AND os.snack_id = sd.snack_id  AND o.ticket_id = t.ticket_id
AND os.order_id = o.order_id ORDER BY o.date_of_order, o.time_of_order DESC LIMIT 10;

SELECT * FROM latest_orders;


-- Retrieves all popcorn options and checks which is the best selling:
CREATE VIEW best_selling_popcorn AS SELECT s.snack_name, COUNT(o.snack_id) AS times_sold FROM order_snacks_details o 
INNER JOIN snack_details s WHERE type_of_snack LIKE "popcorn" AND o.snack_id = s.snack_id GROUP BY snack_name ORDER BY times_sold DESC;

SELECT * FROM best_selling_popcorn;


-- Retrieves all snack options and checks which is the best selling vs worst selling:
CREATE VIEW best_selling_snack AS SELECT s.snack_name, COUNT(o.snack_id) AS times_sold FROM order_snacks_details o 
INNER JOIN snack_details s WHERE o.snack_id = s.snack_id GROUP BY snack_name ORDER BY times_sold DESC;
SELECT * FROM best_selling_snack;



-- Displays the number of times a standard and premium ticket was purchased in October
CREATE VIEW total_tickets_sold_october AS SELECT t.ticket_type, COUNT(t.ticket_type) 
AS total_tickets_sold FROM orders o 
INNER JOIN ticket_details t WHERE o.ticket_id = t.ticket_id 
AND o.date_of_order LIKE '2023-10%' GROUP BY t.ticket_id;
SELECT * FROM total_tickets_sold_october;


-- Allows deletion and update of order_id as a foreign key
ALTER table order_snacks_details
ADD CONSTRAINT order_snacks_foreign_key
FOREIGN KEY (order_id)
REFERENCES orders (order_id)
ON DELETE CASCADE;


-- Deletes a specific order using the total price and date of order and ticket quantity - allows the user to delete 
-- orders which they no longer require. (E.g have been refunded / cancelled)
DELETE  o, os FROM orders o INNER JOIN  order_snacks_details os WHERE 
(SELECT o.date_of_order WHERE o.total_price = 37.50) 
AND (SELECT o.total_price  WHERE o.date_of_order = "2023-10-03")
AND (SELECT o.ticket_quantity  WHERE o.ticket_quantity = 5)
 AND (o.order_id = os.order_id) ;
-- SELECT * FROM all_orders;

-- All snack orders:
CREATE VIEW all_snack_orders AS 
SELECT CONCAT(" #",o.order_id) AS order_number , s.snack_name, os.snack_quantity, o.date_of_order, o.time_of_order, CONCAT(" £",os.snack_quantity * price) AS total_price_for_snacks FROM order_snacks_details os 
INNER JOIN snack_details s, orders o WHERE s.snack_id = os.snack_id AND os.order_id = o.order_id;
SELECT * FROM all_snack_orders;


SELECT * FROM snack_details;



