
-- Step 1:
CREATE DATABASE HMBank;
-- Step 2: Use the HMBank database
USE HMBank;

-- Step 3: Create the 'Customers' table
CREATE TABLE Customers (
    customer_id INT  ,     -- Unique customer identifier
    first_name VARCHAR(100) NOT NULL,               -- Customer's first name
    last_name VARCHAR(100) NOT NULL,                -- Customer's last name
    email VARCHAR(100) UNIQUE NOT NULL,             -- Customer's email (unique constraint)
    phone_number VARCHAR(15),                       -- Customer's phone number
    address TEXT
);
-- step 4: Create the 'accounts' table
CREATE TABLE Accounts (
    account_id INT IDENTITY PRIMARY KEY,        -- Unique account identifier
    customer_id INT NOT NULL,                   -- Foreign Key referencing Customers table
    account_type VARCHAR(50) NOT NULL,           -- Account type (savings, current, etc.)
    balance DECIMAL(10, 2) NOT NULL,             -- Balance in the account -- Foreign Key constraint
);



-- Step 5: Create the 'Transactions' table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,  -- Unique transaction identifier
    account_id INT NOT NULL,                        -- Foreign Key referencing Accounts table
     transaction_type VARCHAR(50) NOT NULL,    
    amount DECIMAL(10, 2) NOT NULL,                 -- Amount for the transaction
    transaction_date DATE NOT NULL,                 -- Date of transaction
);

-- Inserting sample data into the 'Customers' table
INSERT INTO Customers (first_name, last_name, email, phone_number, address)
VALUES
('Suresh', 'J', 'suresh@example.com', '8825670912', 'Shastri nagar'),
('Ramesh', 'A', 'ramesh@example.com', '1234567891', 'Anna nagar');




-- -- Inserting sample data into the Accounts table
INSERT INTO Accounts (customer_id, account_type, balance) 
VALUES
(1, 'savings', 1500.00), -- Suresh's savings account
 (1, 'current', 200.00); -- Ramesh's current account

-- Step 8: Insert sample data into 'Transactions'
INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date) 
VALUES
-- Inserting data into the Transactions table
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) 
VALUES
(1, 1, 'deposit', 500.00, '2025-03-01'),   
(2, 2, 'withdrawal', 100.00, '2025-03-02');


select*from Customers;
 

