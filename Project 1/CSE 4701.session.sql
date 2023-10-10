
-- PROJECT 1 PART 1 -- CREATE TABLES AND INSERT DATA

CREATE TABLE PUBLISHER (
    Name VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE BOOK (
    Book_id VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(255),
    Publisher_name VARCHAR(255),
    FOREIGN KEY (Publisher_name) REFERENCES PUBLISHER(Name)
);

CREATE TABLE BOOK_AUTHORS (
    Book_id VARCHAR(10),
    Author_name VARCHAR(255),
    PRIMARY KEY (Book_id, Author_name),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE BOOK_COPIES (
    Book_id VARCHAR(10),
    Branch_id VARCHAR(10),
    No_of_copies VARCHAR(10),
    PRIMARY KEY (Book_id, Branch_id),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id)
);

CREATE TABLE LIBRARY_BRANCH (
    Branch_id VARCHAR(10) PRIMARY KEY,
    Branch_name VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE BORROWER (
    Card_no VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE BOOK_LOANS (
    Book_id VARCHAR(10),
    Branch_id VARCHAR(10),
    Card_no VARCHAR(10),
    Date_out DATE,
    Due_date DATE,
    PRIMARY KEY (Book_id, Branch_id, Card_no),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id),
    FOREIGN KEY (Card_no) REFERENCES BORROWER(Card_no)
);

INSERT INTO PUBLISHER (Name, Address, Phone)
VALUES
    ('Picador', '4300 Turkey Pen Road', '(233) 444-5521'),
    ('Simon & Schuster', '4096 Emerson Road', '(421) 540-1675'),
    ('Tom Doherty Assoc Llc', '4321 Walnut Hill Drive', '(345) 623-0356');

INSERT INTO BOOK (Book_id, Title, Publisher_name)
VALUES
    ('B1', 'The Lost Tribe', 'Picador'),
    ('B2', 'It', 'Simon & Schuster'),
    ('B3', 'Event Horizon', 'Tom Doherty Assoc Llc');

INSERT INTO BOOK_AUTHORS (Book_id, Author_name)
VALUES
    ('B1', 'Mark Lee'),
    ('B2', 'Stephen King'),
    ('B3', 'Steven McDonald');


INSERT INTO BOOK_COPIES (Book_id, Branch_id, No_of_copies)
VALUES
    ('B1', 'BR1', 15),
    ('B2', 'BR2', 10),
    ('B3', 'BR3', 20);

INSERT INTO LIBRARY_BRANCH (Branch_id, Branch_name, Address)
VALUES
    ('BR1', 'Sharpstown', '9 Bow Ridge Street Sharpstown'),
    ('BR2', 'Beloit', '3 West Rd. Beloit'),
    ('BR3', 'Drive Lake Charles', '824 Rock Maple Drive Lake Charles');

INSERT INTO BORROWER (Card_no, Name, Address, Phone)
VALUES
    ('C1', 'John Smith', '731 Fondren, Houston, TX', '(206) 342-8631'),
    ('C2', 'Franklin Wong', '638 Voss, Houston, TX', '(717) 550-1675'),
    ('C3', 'Alicia Zelaya', '3321 Castle, Spring, TX', '(248) 762-0356');


INSERT INTO BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES
    ('B1', 'BR1', 'C1', '2023-01-05', '2023-02-05'),
    ('B2', 'BR2', 'C2', '2022-12-06', '2023-01-06'),
    ('B3', 'BR3', 'C2', '2023-01-29', '2023-02-28');



-- PROJECT 1 PART 2 -- MODIFY TABLES AND LOAD DATA


-- Use ALTER to modify your existing PUBLISHER schema to add City attributefds
DESCRIBE PUBLISHER;
-- Use ALTER to modify your existing PUBLISHER schema to add City attribute
ALTER TABLE PUBLISHER ADD City VARCHAR(255);
-- Use “DESCRIBE” command to show the new schema for PUBLISHER. 
DESCRIBE PUBLISHER;
-- Use SELECT * statement to show the instance of your modified PUBLISHER table.
SELECT * FROM PUBLISHER;

-- Now empty each table in your database Book_loan_db
DELETE FROM BOOK_LOANS;
DELETE FROM BOOK_COPIES;
DELETE FROM BOOK_AUTHORS;
DELETE FROM BOOK;
DELETE FROM LIBRARY_BRANCH;
DELETE FROM BORROWER;
DELETE FROM PUBLISHER;
-- Use SELECT * statement to show each of your table is empty.
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;

-- Download data files available like BOOK.csv and PUBLISHER.csv and use LOAD DATA statement to "fill" this database
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/BOOK.csv' 
INTO TABLE BOOK 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/PUBLISHER.csv'
INTO TABLE PUBLISHER
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/BOOK_AUTHORS.csv'
INTO TABLE BOOK_AUTHORS
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/BOOK_COPIES.csv'
INTO TABLE BOOK_COPIES
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/LIBRARY_BRANCH.csv'
INTO TABLE LIBRARY_BRANCH
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/BORROWER.csv'
INTO TABLE BORROWER
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.1/Uploads/BOOK_LOANS.csv'
INTO TABLE BOOK_LOANS
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Question 5 










