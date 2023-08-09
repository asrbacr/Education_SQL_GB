USE seminar2;

# Создаю таблицу (БД Seminar2 уже создана)
CREATE TABLE Seminar2.sales (
id INT UNIQUE AUTO_INCREMENT,
order_data DATE,
count_product INT);

# Заполняю таблицу данными
INSERT INTO seminar2.sales (order_data, count_product)
VALUE 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

# Указать тип заказа в зависимости от кол-ва
SELECT id AS "id заказа",
IF(count_product < 100, "Маленький заказ",
IF(count_product > 100 AND count_product <= 300, "Средний заказ",
IF(count_product > 300, "Большой заказ", "Нет данных"))) as "Тип заказа"
FROM seminar2.sales;

SELECT * FROM seminar2.sales;

# Создать таблицу и заполнить данными
CREATE TABLE Seminar2.orders (
    id INT UNIQUE AUTO_INCREMENT,
    employee_id INT,
    amount DECIMAL(3,2),
    order_status VARCHAR(11)
);

#Ошибся в типе данных у столбца employee_id
ALTER TABLE seminar2.orders
MODIFY COLUMN employee_id VARCHAR(3) NULL;

#Ошибся в типе данных у столбца amount
ALTER TABLE seminar2.orders
MODIFY COLUMN amount VARCHAR(10);


INSERT INTO seminar2.orders (employee_id, amount, order_status)
VALUE 
    ("e3", "15.00", "OPEN"),
    ("e1", "25.50", "OPEN"),
    ("e5", "100.70", "CLOSE"),
    ("e2", "22.18", "OPEN"),
    ("e4", "9.50", "CANCELLED");

SELECT * FROM seminar2.orders;

# Покажите “полный” статус заказа, используя оператор CASE
SELECT id, employee_id, amount,
CASE
    WHEN order_status = "OPEN"
        THEN "Order is in open status"
    WHEN order_status = "CLOSE"
        THEN "Order is close"
    WHEN order_status = "CANCELLED"
        THEN "Order is cancelled"
END AS "full_order_status"
FROM seminar2.orders;

/* 0 отличается от NULL, тем что 0 это значение, а NULL это отсутствие какого либо значения, можно сказать пустое поле.
По той же логике данные поля имеют разный вес в памяти. 
*/
