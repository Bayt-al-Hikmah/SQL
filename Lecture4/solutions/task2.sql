You manage a **Library Database** with these tables:
1. **Books**:
    - Columns: `book_id`, `title`, `author`, `genre`.
2. **Members**:
    - Columns: `member_id`, `name`, `email`.
3. **Loans**:
    - Columns: `loan_id`, `book_id`, `member_id`, `loan_date`, `return_date`.
 **Using Joins**:
- Perform an `INNER JOIN` to list all books currently on loan with member details.    
- Use a `LEFT JOIN` to show all members and their loaned books (include members with no loans).
**Using Set Operations**:
- Use `UNION` to combine a list of all book titles and member names.    
- Find books in the "Fiction" genre that have never been loaned using `EXCEPT`.
**Using Transactions**:
- Simulate a book return process:  
    1. Begin a transaction.
    2. Update the `return_date` for a specific loan.
    3. Check for errors; rollback if the book was never loaned.        
    4. Commit the transaction if successful.        
- Use nested transactions to handle bulk book returns and ensure atomicity.
-- Perform an `INNER JOIN` to list all books currently on loan with member details
SELECT title ,author,name,email,loan_date FROM Books
INNER JOIN Loans ON Loans.book_id=Books.book_id
INNER JOIN Members ON Members.member_id=Loans.member_id
WHERE l.return_date IS NULL;

-- Use a `LEFT JOIN` to show all members and their loaned books (include members with no loans).
SELECT name,email,title, loan_date FROM Members 
LEFT JOIN Loans ON Members.member_id=Loans.member_id
LEFT JOIN Books ON Loans.book_id=Books.book_id;

-- Use `UNION` to combine a list of all book titles and member names.  
SELECT name FROM Members
UNION
SELECT title AS name from Books;  

-- Find books in the "Fiction" genre that have never been loaned using `EXCEPT`.
SELECT title FROM Books WHERE genre='Finction'
EXCEPT
SELECT title FROM Books
JOIN Loans ON Loans.book_id=Books.book_id;

--Using Transactions simulate a book return process
BEGIN TRANSACTION;
UPDATE Loans
SET return_date = DATE('now')
WHERE loan_id = 123;
IF (SELECT changes() = 0) THEN
    ROLLBACK;
ELSE
    COMMIT;
END IF;

-- Use nested transactions to handle bulk book returns and ensure atomicity.
BEGIN TRANSACTION;
SAVEPOINT return_book_1;
UPDATE Loans
SET return_date = DATE('now')
WHERE loan_id = 123;
IF (SELECT changes() = 0) THEN
    ROLLBACK TO return_book_1;
END IF;

SAVEPOINT return_book_2;
UPDATE Loans
SET return_date = DATE('now')
WHERE loan_id = 456; 

-- Check for errors
IF (SELECT changes() = 0) THEN
    ROLLBACK TO return_book_2;
END IF;

COMMIT;