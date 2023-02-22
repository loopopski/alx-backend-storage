-- Creates a trigger that decreases the quantity of an item after adding a new order

CREATE TRIGGER decrement
AFTER INSERT
ON orders
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE NAME = NEW.item_name;-- SQL script that creates a trigger that resets 
-- the attribute valid_email only when the email has been changed.
DELIMITER $$
CREATE TRIGGER reset 
BEFORE UPDATE
ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END $$

DELIMITER;
