USE HMBank;
GO

INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, address) 
VALUES 
(3, 'Karan', 'P', 'karan@example.com', '9876543201', 'Adugodi'),
(4, 'Nisha', 'G', 'nisha@example.com', '8765432108', 'Mylapore'),
(5, 'Ravi', 'Kumar', 'ravi@example.com', '7654321097', 'T Nagar'),
(6, 'Anjali', 'S', 'anjali@example.com', '6543210986', 'Nandanam'),
(7, 'Vishal', 'J', 'vishal@example.com', '5432109875', 'Royapettah'),
(8, 'Ishita', 'D', 'ishita@example.com', '4321098764', 'Kotturpuram'),
(9, 'Amit', 'V', 'amit@example.com', '3210987653', 'Ekkatuthangal'),
(10, 'Simran', 'K', 'simran@example.com', '2109876542', 'Anna Nagar');


INSERT INTO Accounts (customer_id, account_type, balance) 
VALUES
(2, 'savings', 2000.00),
(2, 'current', 1500.00),
(3, 'savings', 5000.00),
(4, 'current', 2200.00),
(5, 'savings', 3500.00),
(6, 'current', 1800.00),
(7, 'savings', 4000.00),
(8, 'current', 2500.00);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) 
VALUES
(3, 3, 'deposit', 2000.00, '2025-03-03'),
(4, 4, 'withdrawal', 500.00, '2025-03-04'),
(5, 5, 'deposit', 3000.00, '2025-03-05'),
(6, 6, 'withdrawal', 700.00, '2025-03-06'),
(7, 7, 'deposit', 2500.00, '2025-03-07'),
(8, 8, 'withdrawal', 400.00, '2025-03-08'),
(9, 9, 'deposit', 1500.00, '2025-03-09'),
(10, 10, 'withdrawal', 600.00, '2025-03-10');

SELECT first_name, last_name, account_type, email
FROM Customers, Accounts
WHERE Customers.customer_id = Accounts.customer_id;

SELECT * 
FROM Transactions 
WHERE account_id IN (SELECT account_id FROM Accounts);

UPDATE Accounts 
SET balance = balance + 800  
WHERE account_id = 3; 

SELECT first_name + ' ' + last_name AS full_name 
FROM Customers;

DELETE FROM Accounts 
WHERE balance = 0 AND account_type = 'savings';

SELECT * 
FROM Customers 
WHERE address LIKE '%Shastri Nagar%';

SELECT balance 
FROM Accounts 
WHERE account_id = 2; 

SELECT * 
FROM Accounts 
WHERE account_type = 'current' AND balance > 1000;

SELECT * 
FROM Transactions 
WHERE account_id = 3;  

SELECT account_id, balance * 0.03 AS interest_accrued 
FROM Accounts 
WHERE account_type = 'savings';

SELECT * 
FROM Accounts 
WHERE balance < 500;

SELECT * 
FROM Customers 
WHERE address NOT LIKE '%Shastri Nagar%';
