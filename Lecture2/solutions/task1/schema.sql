-- Creating Authors Table
CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birthdate NUMERIC
);

-- Creating Books Table
CREATE TABLE Books(
book_id INTEGER PRIMARY KEY,
ISBN TEXT UNIQUE, 
TEXT title NOT NULL,
publication_year NUMERIC,
genre TEXT,
authro_id INTEGER,
FOREIGN KEY author_id REFERENCES TO Authors(author_id)
);

-- Creating Members Table
CREATE TABLE Members(
member_id INTEGER  PRIMARY KEY,
name TEXT NOT NULL,
address TEXT  UNIQUE,
contact_number NUMERIC UNIQUE
);

-- Creating Loan_records Table
CREATE TABLE Loan_records(
loan_id INTEGER PRIMARY KEY,
book_id INTEGER, 
member_id INTEGER, 
borrow_date NUMERIC,
return_date NUMERIC,
FOREIGN KEY (book_id) REFERENCES TO Books(book_id),
FOREIGN KEY (member_id) REFERENCES TO Members(book_id)
);