create database bank_schema;

use bank_schema;

-- 1. Client Table
CREATE TABLE `bank_schema`.`client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) NOT NULL,
  `Aadhar` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.client AUTO_INCREMENT=10000;

-- 2 Login_Account Table
CREATE TABLE `bank_schema`.`login_account` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(12) NOT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_id_UNIQUE` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.login_account AUTO_INCREMENT=60000;

-- 3 Employee Table
CREATE TABLE `bank_schema`.`employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) NOT NULL,
  `job` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  KEY `login_id_idx` (`login_id`),
  CONSTRAINT `login_id` FOREIGN KEY (`login_id`) REFERENCES `login_account` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.employee AUTO_INCREMENT=20000;

-- 4 Card Table
CREATE TABLE `bank_schema`.`card` (
  `card_num` int NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `Status` char(1) NOT NULL,
  `Pin_code` varchar(4) NOT NULL,
  `Issue_date` date NOT NULL,
  PRIMARY KEY (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.card AUTO_INCREMENT=40000;

-- 5 Bank_Account table
CREATE TABLE `bank_schema`.`bank_account` (
  `acc_num` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `login_id` int DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `balance` int NOT NULL,
  `status` int NOT NULL,
  `opening_date` date NOT NULL,
  `closing_date` date DEFAULT NULL,
  `card_num` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acc_num`),
  UNIQUE KEY `acc_num_UNIQUE` (`acc_num`),
  KEY `client_id` (`client_id`),
  KEY `login_id` (`login_id`),
  KEY `card_num` (`card_num`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `bank_account_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login_account` (`login_id`),
  CONSTRAINT `bank_account_ibfk_3` FOREIGN KEY (`card_num`) REFERENCES `card` (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.bank_account AUTO_INCREMENT=500000;

-- 6 Transaction_History Table
CREATE TABLE `bank_schema`.`transaction_history` (
  `serial_no` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(45) NOT NULL,
  `account_num` int NOT NULL,
  `recv_acc_num` int DEFAULT NULL,
  `cheque_num` int DEFAULT NULL,
  PRIMARY KEY (`serial_no`),
  KEY `account_num` (`account_num`),
  CONSTRAINT `transaction_history_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `bank_account` (`acc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.transaction_history AUTO_INCREMENT=70000;

-- 7 Cardless Withdrawal Table
CREATE TABLE `bank_schema`.`cardless_withdrawl` (
  `serial_no` int NOT NULL AUTO_INCREMENT,
  `card_no` int NOT NULL,
  `amount` int NOT NULL,
  `OTC` varchar(13) NOT NULL,
  `temp_pin` varchar(4) NOT NULL,
  `Status` char(1) NOT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serial_no`),
  UNIQUE KEY `serial_no_UNIQUE` (`serial_no`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `cardless_withdrawl_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE bank_schema.cardless_withdrawl AUTO_INCREMENT=80000;



-- Client Table
INSERT INTO bank_schema.client (client_id, f_name, l_name, father_name, mother_name, Aadhar, DOB, phone, email, address) VALUES
(10001, 'John', 'Doe', 'Michael Doe', 'Emily Doe', '123456789012', '2000-01-15', '1234567890', 'john.doe@example.com', '123 Main St'),
(10002, 'Alice', 'Smith', 'James Smith', 'Emma Smith', '987654321098', '1995-05-20', '9876543210', 'alice.smith@example.com', '456 Elm St'),
(10003, 'Michael', 'Johnson', 'David Johnson', 'Sarah Johnson', '456789012345', '1988-11-10', '4567890123', 'michael.johnson@example.com', '789 Oak St'),
(10004, 'Emily', 'Brown', 'Matthew Brown', 'Olivia Brown', '321098765432', '1976-09-25', '3210987654', 'emily.brown@example.com', '101 Pine St'),
(10005, 'David', 'Wilson', 'Christopher Wilson', 'Sophia Wilson', '654321098765', '1999-03-30', '6543210987', 'david.wilson@example.com', '202 Maple St'),
(10006, 'Sarah', 'Davis', 'Michael Davis', 'Jessica Davis', '789012345678', '1990-07-12', '7890123456', 'sarah.davis@example.com', '303 Cedar St'),
(10007, 'James', 'Taylor', 'Richard Taylor', 'Jennifer Taylor', '890123456789', '1985-12-05', '8901234567', 'james.taylor@example.com', '404 Walnut St'),
(10008, 'Sophia', 'Martinez', 'Daniel Martinez', 'Elizabeth Martinez', '901234567890', '1982-04-18', '9012345678', 'sophia.martinez@example.com', '505 Pineapple St'),
(10009, 'Daniel', 'Thomas', 'John Thomas', 'Mary Thomas', '012345678901', '1978-08-22', '0123456789', 'daniel.thomas@example.com', '606 Cherry St'),
(10010, 'Olivia', 'Jackson', 'William Jackson', 'Laura Jackson', '234567890123', '1973-02-14', '2345678901', 'olivia.jackson@example.com', '707 Peach St'),
(10011, 'William', 'White', 'George White', 'Susan White', '345678901234', '1965-06-30', '3456789012', 'william.white@example.com', '808 Lemon St'),
(10012, 'Emma', 'Harris', 'Charles Harris', 'Michelle Harris', '456789012345', '1960-10-11', '4567890123', 'emma.harris@example.com', '909 Lime St'),
(10013, 'Christopher', 'Brown', 'Brian Brown', 'Donna Brown', '567890123456', '1955-04-01', '5678901234', 'christopher.brown@example.com', '1010 Grape St'),
(10014, 'Elizabeth', 'Young', 'Joseph Young', 'Patricia Young', '678901234567', '1950-08-17', '6789012345', 'elizabeth.young@example.com', '1111 Berry St'),
(10015, 'Matthew', 'Clark', 'Steven Clark', 'Karen Clark', '789012345678', '1945-12-29', '7890123456', 'matthew.clark@example.com', '1212 Mango St'),
(10016, 'Jessica', 'Lewis', 'Timothy Lewis', 'Angela Lewis', '890123456789', '1940-03-07', '8901234567', 'jessica.lewis@example.com', '1313 Apple St'),
(10017, 'Andrew', 'King', 'Thomas King', 'Rebecca King', '901234567890', '1935-07-20', '9012345678', 'andrew.king@example.com', '1414 Orange St'),
(10018, 'Madison', 'Wright', 'Jeffrey Wright', 'Amy Wright', '012345678901', '1930-11-02', '0123456789', 'madison.wright@example.com', '1515 Banana St'),
(10019, 'Abigail', 'Nelson', 'Edward Nelson', 'Cynthia Nelson', '123456789012', '1925-05-15', '1234567890', 'abigail.nelson@example.com', '1616 Coconut St'),
(10020, 'Ethan', 'Roberts', 'Frank Roberts', 'Kathleen Roberts', '234567890123', '1920-09-08', '2345678901', 'ethan.roberts@example.com', '1717 Kiwi St');

-- Login_Account Table
INSERT INTO bank_schema.login_account (login_id, username, password, type) VALUES
(60001, 'manager1', 'pass1234', 'M'),
(60002, 'accountant1', 'pass5678', 'A'),
(60003, 'accountant2', 'pass4321', 'A'),
(60004, 'accountant3', 'pass2468', 'A');

-- Employee Table 
INSERT INTO bank_schema.employee (employee_id, f_name, l_name, father_name, mother_name, job, phone_no, email, login_id) VALUES
(20001, 'Robert', 'Martinez', 'William Martinez', 'Patricia Martinez', 'Manager', '1112223333', 'robert.martinez@example.com', 60001),
(20002, 'Jennifer', 'Clark', 'Daniel Clark', 'Carol Clark', 'Accountant', '2223334444', 'jennifer.clark@example.com', 60002),
(20003, 'Daniel', 'Young', 'Richard Young', 'Linda Young', 'Teller', '3334445555', 'daniel.young@example.com', NULL),
(20004, 'Patricia', 'Lewis', 'Joseph Lewis', 'Maria Lewis', 'Teller', '4445556666', 'patricia.lewis@example.com', NULL),
(20005, 'Matthew', 'Walker', 'Thomas Walker', 'Karen Walker', 'Teller', '5556667777', 'matthew.walker@example.com', NULL),
(20006, 'Jessica', 'Hall', 'Kevin Hall', 'Dorothy Hall', 'Teller', '6667778888', 'jessica.hall@example.com', NULL),
(20007, 'Brian', 'Garcia', 'David Garcia', 'Susan Garcia', 'Accountant', '7778889999', 'brian.garcia@example.com', 60003),
(20008, 'Lauren', 'Lee', 'Christopher Lee', 'Laura Lee', 'Teller', '8889990000', 'lauren.lee@example.com', NULL),
(20009, 'Kevin', 'Harris', 'Brian Harris', 'Donna Harris', 'Teller', '9990001111', 'kevin.harris@example.com', NULL),
(20010, 'Sarah', 'Turner', 'James Turner', 'Margaret Turner', 'Teller', '1112223334', 'sarah.turner@example.com', NULL),
(20011, 'Mark', 'Allen', 'Robert Allen', 'Jennifer Allen', 'Accountant', '2223334445', 'mark.allen@example.com', 60004),
(20012, 'Rachel', 'Parker', 'Matthew Parker', 'Rebecca Parker', 'Teller', '3334445556', 'rachel.parker@example.com', NULL),
(20013, 'Justin', 'Morris', 'Steven Morris', 'Karen Morris', 'Teller', '4445556667', 'justin.morris@example.com', NULL),
(20014, 'Heather', 'Wright', 'Jeffrey Wright', 'Amy Wright', 'Teller', '5556667778', 'heather.wright@example.com', NULL),
(20015, 'Keith', 'Lopez', 'George Lopez', 'Nancy Lopez', 'Teller', '6667778889', 'keith.lopez@example.com', NULL),
(20016, 'Stephanie', 'Gonzalez', 'Christopher Gonzalez', 'Laura Gonzalez', 'Teller', '7778889990', 'stephanie.gonzalez@example.com',NULL),
(20017, 'Jordan', 'Evans', 'Timothy Evans', 'Angela Evans', 'Teller', '8889990001', 'jordan.evans@example.com', NULL),
(20018, 'Megan', 'Hill', 'Thomas Hill', 'Rebecca Hill', 'Teller', '9990001112', 'megan.hill@example.com', NULL),
(20019, 'Trevor', 'Flores', 'Edward Flores', 'Cynthia Flores', 'Teller', '1112223335', 'trevor.flores@example.com', NULL),
(20020, 'Caroline', 'Reed', 'Frank Reed', 'Kathleen Reed', 'Teller', '2223334446', 'caroline.reed@example.com', NULL);

-- Card Table
INSERT INTO bank_schema.card (card_num, type, Status, Pin_code, Issue_date) VALUES
(40001, 'D', 'A', '1234', '2023-01-01'),
(40002, 'C', 'A', '5678', '2023-02-15'),
(40003, 'D', 'A', '9876', '2023-03-10'),
(40004, 'C', 'A', '5432', '2023-04-20'),
(40005, 'D', 'A', '1111', '2023-05-05'),
(40006, 'C', 'A', '2222', '2023-06-15'),
(40007, 'D', 'A', '3333', '2023-07-25'),
(40008, 'C', 'A', '4444', '2023-08-30'),
(40009, 'D', 'A', '5555', '2023-09-10'),
(40010, 'C', 'A', '6666', '2023-10-20'),
(40011, 'D', 'A', '7777', '2023-11-05'),
(40012, 'C', 'A', '8888', '2023-12-15'),
(40013, 'D', 'A', '9999', '2024-01-02'),
(40014, 'C', 'A', '0000', '2024-02-25'),
(40015, 'D', 'A', '1357', '2024-03-12'),
(40016, 'C', 'A', '2468', '2024-04-05'),
(40017, 'D', 'A', '3698', '2024-05-20'),
(40018, 'C', 'A', '9753', '2024-06-10'),
(40019, 'D', 'A', '7539', '2024-07-15'),
(40020, 'C', 'A', '8520', '2024-08-30');

-- Bank_Account table 
INSERT INTO bank_schema.bank_account (acc_num, client_id, login_id, type, balance, status, opening_date, closing_date, card_num) VALUES
(50001, 10001, NULL, 'Savings', 5000, 1, '2023-01-01', NULL, 40001),
(50002, 10002, NULL, 'Checking', 7000, 1, '2023-02-15', NULL, 40002),
(50003, 10003, NULL, 'Savings', 3000, 1, '2023-03-10', NULL, 40003),
(50004, 10004, NULL, 'Checking', 10000, 1, '2023-04-20', NULL, 40004),
(50005, 10005, NULL, 'Savings', 2000, 1, '2023-05-05', NULL, 40005),
(50006, 10006, NULL, 'Checking', 6000, 1, '2023-06-15', NULL, 40006),
(50007, 10007, NULL, 'Savings', 4000, 1, '2023-07-25', NULL, 40007),
(50008, 10008, NULL, 'Checking', 8000, 1, '2023-08-30', NULL, 40008),
(50009, 10009, NULL, 'Savings', 2500, 1, '2023-09-10', NULL, 40009),
(50010, 10010, NULL, 'Checking', 5500, 1, '2023-10-20', NULL, 40010),
(50011, 10011, NULL, 'Savings', 3500, 1, '2023-11-05', NULL, 40011),
(50012, 10012, NULL, 'Checking', 9000, 1, '2023-12-15', NULL, 40012),
(50013, 10013, NULL, 'Savings', 1500, 1, '2024-01-02', NULL, 40013),
(50014, 10014, NULL, 'Checking', 7500, 1, '2024-02-25', NULL, 40014),
(50015, 10015, NULL, 'Savings', 2700, 1, '2024-03-12', NULL, 40015),
(50016, 10016, NULL, 'Checking', 6250, 1, '2024-04-05', NULL, 40016),
(50017, 10017, NULL, 'Savings', 4300, 1, '2024-05-20', NULL, 40017),
(50018, 10018, NULL, 'Checking', 8100, 1, '2024-06-10', NULL, 40018),
(50019, 10019, NULL, 'Savings', 2900, 1, '2024-07-15', NULL, 40019),
(50020, 10020, NULL, 'Checking', 5800, 1, '2024-08-30', NULL, 40020);

-- Transaction_History Table
INSERT INTO bank_schema.transaction_history (serial_no, amount, type, date, time, account_num, recv_acc_num, cheque_num) VALUES
(70001, 1000, 'Deposit', '2023-01-01', '08:30:00', 50001, NULL, NULL),
(70002, 2000, 'Withdrawal', '2023-01-02', '10:45:00', 50002, NULL, NULL),
(70003, 1500, 'Transfer', '2023-01-03', '12:15:00', 50003, 94321, NULL),
(70004, 3000, 'Withdrawal', '2023-01-04', '09:00:00', 50004, NULL, NULL),
(70005, 500, 'Deposit', '2023-01-05', '11:20:00', 50005, NULL, NULL),
(70006, 1200, 'Deposit', '2023-01-06', '14:30:00', 50006, NULL, NULL),
(70007, 2500, 'Withdrawal', '2023-01-07', '16:00:00', 50007, NULL, NULL),
(70008, 1800, 'Transfer', '2023-01-08', '09:45:00', 50008, 94322, NULL),
(70009, 4000, 'Withdrawal', '2023-01-09', '12:10:00', 50009, NULL, NULL),
(70010, 700, 'Deposit', '2023-01-10', '14:50:00', 50010, NULL, NULL),
(70011, 1600, 'Deposit', '2023-01-11', '17:30:00', 50011, NULL, NULL),
(70012, 3000, 'Withdrawal', '2023-01-12', '10:15:00', 50012, NULL, NULL),
(70013, 800, 'Transfer', '2023-01-13', '11:40:00', 50013, 94323, NULL),
(70014, 2000, 'Withdrawal', '2023-01-14', '13:20:00', 50014, NULL, NULL),
(70015, 1000, 'Deposit', '2023-01-15', '15:00:00', 50015, NULL, NULL),
(70016, 1700, 'Deposit', '2023-01-16', '16:45:00', 50016, NULL, NULL),
(70017, 3500, 'Withdrawal', '2023-01-17', '09:20:00', 50017, NULL, NULL),
(70018, 900, 'Transfer', '2023-01-18', '10:55:00', 50018, 94324, NULL),
(70019, 2800, 'Withdrawal', '2023-01-19', '12:25:00', 50019, NULL, NULL),
(70020, 600, 'Deposit', '2023-01-20', '14:15:00', 50020, NULL, NULL);


-- Cardless Withdrawal Table 
INSERT INTO bank_schema.cardless_withdrawl (serial_no, card_no, amount, OTC, temp_pin, Status, date, time) VALUES
(80001, 40001, 2000, '1234567890123', '4321', 'A', '2023-01-01', '10:00:00'),
(80002, 40002, 3000, '9876543210987', '1234', 'A', '2023-01-02', '11:30:00'),
(80003, 40003, 1500, '6543210987654', '5678', 'A', '2023-01-03', '14:45:00'),
(80004, 40004, 4000, '3210987654321', '9876', 'A', '2023-01-04', '16:20:00'),
(80005, 40005, 1000, '1234567890123', '1111', 'A', '2023-01-05', '09:10:00'),
(80006, 40006, 2500, '9876543210987', '2222', 'A', '2023-01-06', '10:40:00'),
(80007, 40007, 1800, '6543210987654', '3333', 'A', '2023-01-07', '13:55:00'),
(80008, 40008, 3000, '3210987654321', '4444', 'A', '2023-01-08', '15:30:00'),
(80009, 40009, 700, '1234567890123', '5555', 'A', '2023-01-09', '08:45:00'),
(80010, 40010, 1600, '9876543210987', '6666', 'A', '2023-01-10', '11:15:00'),
(80011, 40011, 3000, '6543210987654', '7777', 'A', '2023-01-11', '14:30:00'),
(80012, 40012, 800, '3210987654321', '8888', 'A', '2023-01-12', '16:05:00'),
(80013, 40013, 2000, '1234567890123', '9999', 'A', '2023-01-13', '09:20:00'),
(80014, 40014, 1000, '9876543210987', '0000', 'A', '2023-01-14', '10:50:00'),
(80015, 40015, 1700, '6543210987654', '1357', 'A', '2023-01-15', '13:15:00'),
(80016, 40016, 3500, '3210987654321', '2468', 'A', '2023-01-16', '15:45:00'),
(80017, 40017, 900, '1234567890123', '3698', 'A', '2023-01-17', '08:30:00'),
(80018, 40018, 2800, '9876543210987', '9753', 'A', '2023-01-18', '11:00:00'),
(80019, 40019, 600, '6543210987654', '7539', 'A', '2023-01-19', '13:35:00'),
(80020, 40020, 1200, '3210987654321', '8520', 'A', '2023-01-20', '16:10:00');


-- FUNCTIONS
-- 1. Function to Calculate Account Balance:
-- This function calculates the current balance of a bank account based on the transactions.
DELIMITER //
CREATE FUNCTION get_account_balance(account_num INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE balance DECIMAL(10, 2);
    SELECT SUM(amount) INTO balance FROM bank_schema.transaction_history WHERE account_num = account_num;
    RETURN balance;
END//
DELIMITER ;

-- 2. Function to Generate Random Temporary PIN:
-- This function generates a random temporary PIN for cardless withdrawal
 DELIMITER //
CREATE FUNCTION generate_temp_pin() RETURNS VARCHAR(4)
READS SQL DATA
BEGIN
    DECLARE temp_pin VARCHAR(4);
    SET temp_pin = LPAD(FLOOR(RAND() * 10000), 4, '0');
    RETURN temp_pin;
END//
DELIMITER ;


-- Procedures:
-- 1. Procedure to Perform Cardless Withdrawal:
-- This procedure facilitates cardless withdrawal by generating a temporary PIN and updating the transaction history.
DELIMITER //
CREATE PROCEDURE perform_cardless_withdrawal(
    IN card_num INT,
    IN amount DECIMAL(10, 2)
)
READS SQL DATA
BEGIN
    DECLARE otc VARCHAR(13);
    DECLARE temp_pin VARCHAR(4);
    SET otc = LPAD(FLOOR(RAND() * 10000000000000), 13, '0');
    SET temp_pin = generate_temp_pin();
    INSERT INTO bank_schema.cardless_withdrawl (card_no, amount, OTC, temp_pin, Status, date, time) 
    VALUES (card_num, amount, otc, temp_pin, 'A', CURDATE(), CURTIME());
END //
DELIMITER ;

-- 2. Procedure to Close Bank Account:
-- This procedure closes a bank account by updating its status and closing date.
DELIMITER //
CREATE PROCEDURE close_bank_account(
    IN account_num INT
)
READS SQL DATA
BEGIN
    UPDATE bank_schema.bank_account SET status = 0, closing_date = CURDATE() 
    WHERE acc_num = account_num;
END //
DELIMITER ;


-- Triggers:
-- 1. Trigger to Block Card on Failed PIN Attempts:
-- This trigger blocks a card if there are multiple failed attempts to enter the correct PIN during cardless withdrawal. 
DELIMITER //
CREATE TRIGGER block_card_on_failed_attempts BEFORE INSERT ON bank_schema.cardless_withdrawl
FOR EACH ROW
BEGIN
    DECLARE attempt_count INT;
    SELECT COUNT(*) INTO attempt_count FROM bank_schema.cardless_withdrawl 
    WHERE card_no = NEW.card_no AND Status = 'F' AND DATE(date) = CURDATE();
    IF attempt_count >= 3 THEN
        UPDATE bank_schema.card SET Status = 'B' WHERE card_num = NEW.card_no;
    END IF;
END //
DELIMITER ;

-- TRIGGER IMPLEMENTATION
INSERT INTO bank_schema.cardless_withdrawl (card_no, amount, OTC, temp_pin, Status, date, time) 
VALUES (40001, 2000, '1234567890123', '4321', 'F', CURDATE(), '10:00:00'),
       (40001, 3000, '1234567890123', '4321', 'F', CURDATE(), '11:00:00'),
       (40001, 1500, '1234567890123', '4321', 'F', CURDATE(), '12:00:00');

-- This will trigger the block_card_on_failed_attempts trigger
INSERT INTO bank_schema.cardless_withdrawl (card_no, amount, OTC, temp_pin, Status, date, time) 
VALUES (40001, 4000, '1234567890123', '4321', 'F', CURDATE(), '13:00:00');

SELECT * FROM bank_schema.card WHERE card_num = 40001;


-- Views:
-- 1. View to Display Account Details with Client Information:
-- This view joins the bank account table with the client table to display account details along with client information.

CREATE VIEW account_client_details AS
SELECT ba.acc_num, ba.type, ba.balance, ba.status, ba.opening_date, ba.closing_date,
       c.f_name, c.l_name, c.phone, c.email, c.address
FROM bank_schema.bank_account ba
JOIN bank_schema.client c ON ba.client_id = c.client_id;

-- 2. View to Show Transaction History with Client Names:
-- This view joins the transaction history table with the client table to display transaction details along with client names. 

CREATE VIEW transaction_with_clients AS
SELECT th.serial_no, th.amount, th.type, th.date, th.time,
       CONCAT(c.f_name, ' ', c.l_name) AS client_name
FROM bank_schema.transaction_history th
JOIN bank_schema.bank_account ba ON th.account_num = ba.acc_num
JOIN bank_schema.client c ON ba.client_id = c.client_id;