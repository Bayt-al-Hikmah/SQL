-- Use the `ALTER TABLE` command to add a new column named `email` (TEXT) with `UNIQUE` constraint (to ensure that each employee has a unique email address) to the "Employees" table.
ALTER TABLE Employees ADD COLUMN email TEXT UNIQUE;

-- Use the `ALTER TABLE` command to rename the `department` column to `dept_name`.
ALTER TABLE Employees RENAME COLUMN department TO dept_name;

--- Create a test table called "TestTable", and then use the `DROP TABLE` command to remove it from your database.
CREATE TABLE TestTable(
    id INTEGER PRIMARY KEY,
    name TEXT;
)
DROP TABLE TestTable;


