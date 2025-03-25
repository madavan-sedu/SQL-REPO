USE HMBank

1. Find the average account balance for all customers
SELECT AVG(balance) AS avg_balance FROM Accounts;

2. Retrieve the top 10 highest account balances:
SELECT TOP 10 * FROM Accounts 
ORDER BY balance DESC;

3. Calculate Total Deposits for All Customers on a specific date:
 SELECT SUM(amount) AS total_deposits 
FROM Transactions 
WHERE transaction_type = 'deposit' 
AND transaction_date = '2025-04-02';

4. Find the Oldest and Newest Customers:
SELECT TOP 1 * FROM Customers 
ORDER BY customer_id ASC;

5. Retrieve transaction details along with the account type:

SELECT TOP 1 * FROM Customers 
ORDER BY customer_id DESC;

6. Get a list of customers along with their account details:

SELECT C.customer_id, C.first_name, C.last_name, A.account_id, A.account_type, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;


7. Retrieve transaction details along with customer information for a specific account:
SELECT T.transaction_id, T.transaction_type, T.amount, T.transaction_date, 
       C.customer_id, C.first_name, C.last_name
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
JOIN Customers C ON A.customer_id = C.customer_id
WHERE A.account_id = 1;  


8. Identify customers who have more than one account:
SELECT customer_id, COUNT(account_id) AS account_count
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;
  

9.Calculate the difference in transaction amounts between deposits and withdrawals:

SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) 
       AS balance_difference
FROM Transactions
GROUP BY account_id;


10. Calculate the average daily balance for each account over a specified period
SELECT account_id, AVG(balance) AS avg_daily_balance
FROM Accounts
WHERE account_id IN (
    SELECT account_id FROM Transactions
    WHERE transaction_date BETWEEN '2025-03-01' AND '2025-03-10'
)
GROUP BY account_id;


11.Calculate the total balance for each account type:
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;


12. Identify accounts with the highest number of transactions ordered by descending order:
SELECT account_id, COUNT(transaction_id) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC;


13.List customers with high aggregate account balances, along with their account types:
SELECT C.customer_id, C.first_name, C.last_name, A.account_type, SUM(A.balance) AS total_balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name, A.account_type
HAVING SUM(A.balance) > 5000;  


14.Identify and list duplicate transactions based on transaction amount, date, and account:
SELECT account_id, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1;












