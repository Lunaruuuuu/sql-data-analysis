CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    city TEXT,
    age INTEGER
);

CREATE TABLE transactions (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    product TEXT NOT NULL,
    amount REAL NOT NULL,
    transaction_date TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, city, age) VALUES
(1, 'Andi Pratama', 'andi@gmail.com', 'Jakarta', 21),
(2, 'Budi Santoso', 'budi@gmail.com', 'Bandung', 23),
(3, 'Citra Lestari', 'citra@gmail.com', 'Jakarta', 20),
(4, 'Dina Permata', 'dina@gmail.com', 'Surabaya', 25),
(5, 'Eko Wijaya', 'eko@gmail.com', 'Bandung', 22),
(6, 'Fajar Nugroho', 'fajar@gmail.com', 'Jakarta', 24),
(7, 'Gita Maharani', 'gita@gmail.com', 'Yogyakarta', 21),
(8, 'Hadi Setiawan', 'hadi@gmail.com', 'Surabaya', 26),
(9, 'Indah Sari', 'indah@gmail.com', 'Jakarta', 22),
(10, 'Joko Saputra', 'joko@gmail.com', 'Bandung', 24);

INSERT INTO transactions
(id, user_id, product, amount, transaction_date) VALUES
(1, 1, 'Laptop', 8500000, '2026-09-01'),
(2, 2, 'Mouse', 250000, '2026-09-02'),
(3, 3, 'Keyboard', 750000, '2026-09-03'),
(4, 1, 'Headset', 500000, '2026-09-04'),
(5, 4, 'Monitor', 3000000, '2026-09-05'),
(6, 5, 'Mouse', 300000, '2026-09-06'),
(7, 6, 'Laptop', 9000000, '2026-09-07'),
(8, 7, 'Keyboard', 800000, '2026-09-08'),
(9, 8, 'Webcam', 1200000, '2026-09-09'),
(10, 9, 'Monitor', 3500000, '2026-09-10');

SELECT *
FROM users
WHERE city = 'Jakarta';

SELECT *
FROM users
WHERE name LIKE 'A%';


SELECT
    users.name,
    users.city,
    transactions.product,
    transactions.amount,
    transactions.transaction_date
FROM users
INNER JOIN transactions
    ON users.id = transactions.user_id;


SELECT
    users.name,
    COUNT(transactions.id) AS total_transactions
FROM users
INNER JOIN transactions
    ON users.id = transactions.user_id
GROUP BY users.id, users.name;


SELECT
    users.name,
    SUM(transactions.amount) AS total_spending
FROM users
INNER JOIN transactions
    ON users.id = transactions.user_id
GROUP BY users.id, users.name;


SELECT
    product,
    AVG(amount) AS average_amount
FROM transactions
GROUP BY product;


SELECT *
FROM transactions
ORDER BY amount DESC;


SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 5;


SELECT
    users.name,
    users.city,
    COUNT(transactions.id) AS total_transactions,
    SUM(transactions.amount) AS total_spending,
    AVG(transactions.amount) AS average_transaction
FROM users
INNER JOIN transactions
    ON users.id = transactions.user_id
GROUP BY users.id, users.name, users.city
ORDER BY total_spending DESC;