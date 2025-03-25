USE HMBANK

1. Retrieve the customer(s) with the highest account balance.

SELECT customer_id, first_name, last_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Accounts
    WHERE balance = (SELECT MAX(balance) FROM Accounts)
);




2. Calculate the average account balance for customers who have more than one account.
SELECT AVG(balance) AS avg_balance
FROM Accounts
WHERE customer_id IN (
    SELECT customer_id FROM Accounts 
    GROUP BY customer_id 
    HAVING COUNT(account_id) > 1
);


3.Retrieve accounts with transactions whose amounts exceed the average transaction amount
SELECT account_id, transaction_id, amount 
FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);


4. Identify customers who have no recorded transactions.
SELECT customer_id, first_name, last_name 
FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id 
    FROM Accounts 
    WHERE account_id IN (SELECT DISTINCT account_id FROM Transactions)
);


5. Calculate the total balance of accounts with no recorded transactions
SELECT SUM(balance) AS total_balance
FROM Accounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);


6. Retrieve transactions for accounts with the lowest balance.
SELECT * FROM Transactions
WHERE account_id IN (
    SELECT account_id FROM Accounts 
    WHERE balance = (SELECT MIN(balance) FROM Accounts)
);


7. Identify customers who have accounts of multiple types.
SELECT customer_id 
FROM Accounts 
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;


8. Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type, 
       COUNT() * 100.0 / (SELECT COUNT() FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;


9. Retrieve all transactions for a customer with a given customer_id.
SELECT T.* 
FROM Transactions T
WHERE T.account_id IN (
    SELECT account_id FROM Accounts WHERE customer_id = 1
);


10. Calculate the total balance for each account type, including a subquery within the SELECT clause
SELECT account_type, 
       (SELECT SUM(balance) FROM Accounts A2 WHERE A2.account_type = A1.account_type) AS total_balance
FROM Accounts A1
GROUP BY account_type;