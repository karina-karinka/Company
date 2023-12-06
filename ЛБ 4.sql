-- Завдання 4.1: Показати список всіх співробітників та наявної інформації про них 
-- Вивести всі атрибути (поля) працівника.
USE company;
SELECT * FROM employee;


-- Завдання 4.2: Показати список всіх співробітників та наявної інформації про них.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду. 
SELECT 
employee_id,
first_name, 
last_name, 
position
FROM 
employee;


-- Завдання 4.3: Показати список перших семи співробітників та наявної інформації про них.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду. 
SELECT 
employee_id,
first_name,
last_name, 
position
FROM 
employee
LIMIT 7;


-- Завдання 4.4: Показати список уніальних посад.
-- Деталі: Вивести перелік унікальних значень для поля посада (position).
SELECT DISTINCT
position
FROM 
employee;


-- Завдання 4.5: Показати список уніальних посад відсортувавши їх.
-- Деталі: Вивести перелік унікальних значень для поля посада (position) відсортованих в алфавітному та зворотньому порядку.
SELECT DISTINCT
position
FROM 
employee
ORDER By
position ASC;

SELECT DISTINCT
position
FROM
employee
ORDER By
position DESC;


-- Завдання 4.6: Показати список працівників що займають посаду Seller відсортованих по даті прийому на роботу.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в алфавітному.
SELECT
employee_id, 
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
position = 'Seller'
ORDER By
employment_date ASC;


-- Завдання 4.7: Показати список працівників що займають посади Seller і Consultant які були прийняті на роботу після 1 січня 2013 року відсортованих по даті прийому на роботу.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в зворотньому порядку.
SELECT
employee_id,
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position = 'Seller'
OR
position = 'Consultant'
)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;


-- Завдання 4.8: Показати список працівників що займають посади Seller, Consultant і Senior Consultant) які були прийняті на роботу після 1 січня 2013 року відсортованих по даті прийому на роботу.
-- Деталі: Вивести імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в зворотньому порядку.

-- Solution 1
SELECT
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position LIKE 'Seller'
OR 
position IN ('Senior Consultant', 'Consultant')

)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

-- Solution 2
SELECT
-- employee_id, 
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
( position LIKE 'S_____'
OR
( position LIKE '%Consultant'
AND 
position NOT LIKE 'A%'
))
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;


-- Завдання 4.9: Показати список працівників які належать до певного департаменту і вклучити до переліку таких що не мають прямого підпорядкування(не мають менеджера).
-- Деталі: Вивести імя, прізвище працівника ідинтифікаційний номер керівника та департаменту відсортованих по ідинтифікаційному номеру керівника.
SELECT
employee_id, 
last_name, 
first_name, 
position, 
manager_id, 
department_id
FROM 
employee
WHERE 
manager_id IS NULL
OR 
department_id IS NOT NULL
ORDER By
manager_id ASC;


-- Завдання 4.10: Показати список співробітників, які отримали премію та були прийняті на роботу в 2016 році.
-- Деталі: Вивести імя, прізвище, посада, дата прийняття на роботу, премія.

-- Solution 1
SELECT 
last_name,
first_name, 
position, 
employment_date,
bonus
FROM 
employee
WHERE
bonus IS NOT NULL
AND 
(
employment_date > '2015-12-31'
and 
employment_date < '2016-12-31'

)
ORDER By 
last_name ASC;

-- Solution 2
SELECT
last_name, 
first_name, 
position, 
employment_date, 
bonus
FROM 
employee
WHERE
bonus IS NOT NULL
AND 
employment_date
BETWEEN '2015-12-31'
AND '2016-12-31'
ORDER By 
last_name ASC;


-- Завдання 4.11: Відобразити залученість до процесу продажу за посадою співробітника.
-- Деталі: Вивести імя, прізвище, посада, Взаємодія з клієнтом.
SELECT
-- employee_id, 
last_name, 
first_name, 
position,
CASE
WHEN position = 'Senior Consultant' THEN 'Can Seles, Consulting and Lead'
WHEN position IN ('Senior Consultant', 'Consultant') THEN 'Can Seles and Consulting'
WHEN position like 'Assistant Consultant' THEN 'Can only Consulting'
WHEN position LIKE 'Seller' THEN 'Can only Sale'
ELSE 'Service Roles'
END AS 'Relation to Customer'
FROM 
employee
ORDER By 
last_name;


-- Завдання 4.12: Відобразити звіт про працівників змінивши назву колонок .
-- Деталі: Вивести імя, прізвище, посада, дата прийому на роботу.
-- Rename headings of column in report.
-- last_name -> Last Name
-- first_name -> First Name
-- position -> Title
-- employment_date -> Hire Date

SELECT
-- employee_id, 
last_name "Last Name", 
first_name 'First Name', 
position 'Title',
employment_date AS 'Hire Date'
FROM 
employee;


-- Завдання 1. Дізнайтеся, які клієнти були зареєстровані в нашій компанії (показати всі доступні поля). Відсортуйте список за Прізвищем.
SELECT * FROM customer
ORDER By 
last_name;


-- Завдання 2. Вивести унікальні назви виробників (manufacture ) з таблиці продуктів в одному запиті, впорядкованому за алфавітом.
SELECT DISTINCT
manufacture
FROM
product
ORDER By 
manufacture ASC; 


-- Завдання 3. Отримати коротку інформацію про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна), 
-- вироблені компанією 'DELL', з таблиці продуктів в одному запиті, впорядкованому за назвою продукту в алфавітному порядку.
SELECT 
product_name,
manufacture,
category,
product_type,
price
FROM 
product
WHERE 
manufacture = 'DELL'
ORDER By
product_name ASC;


-- Завдання 4. Отримати інформацію про клієнтів-жінок 1990-2000 років народження (ім'я, прізвище, стать, дата народження, номер телефону) 
-- з таблиці customer в одному запиті, відсортовану за прізвищем в алфавітному порядку.
SELECT
  first_name,
  last_name,
  gender,
  birth_date,
  phone_number
FROM
  customer
WHERE
  gender = 'F'
AND
  birth_date
  BETWEEN '1990-01-01' 
  AND '2000-12-31'
ORDER By
last_name ASC;


-- Завдання 5. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими накопичувачами об'ємом 512 ГБ.
SELECT * FROM product
WHERE
  category = 'NOTEBOOK'
AND 
  product_description LIKE '%512GB%';
  
  
-- Завдання 6. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які оснащені дисковими накопичувачами 512 ГБ або 1 ТБ.
SELECT * FROM product
WHERE
 (
 category = 'NOTEBOOK'
 OR
 category = 'Desktops'
 )
AND 
  (
  product_description LIKE '%512GB%'
  OR 
product_description LIKE '%1TB%'
);


-- Завдання 7. Отримати інформацію з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими покупцями (customer_id NULL).
SELECT * FROM invoice
WHERE
	customer_id IS NULL;





