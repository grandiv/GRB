-- Muhammad Grandiv Lava Putra
-- 22/493242/TK/54023

-- Transaction Control Language (TCL) for Good Reading Bookstore

-- COMMIT TCL Example
-- @block
BEGIN TRANSACTION; 
UPDATE "Staff" SET "Salary" = 50000 WHERE "Position" = 'Sales';
COMMIT; 


-- ROLLBACK TCL Example
-- @block
BEGIN TRANSACTION; 
UPDATE "Staff" SET "Salary" = 40000 WHERE "Position" = 'Sales';
-- @block
ROLLBACK; 


-- SAVEPOINT TCL Example
-- @block
BEGIN TRANSACTION; 
UPDATE "Staff" SET "Salary" = 30000 WHERE "Position" = 'Sales';
SAVEPOINT salary_change; 
UPDATE "Staff" SET "Salary" = 35000 WHERE "Position" = 'Sales';
ROLLBACK TO SAVEPOINT salary_change; 
COMMIT; 