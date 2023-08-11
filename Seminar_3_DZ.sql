SELECT * FROM seminar3.staff;

-- в порядке убывания
SELECT * FROM seminar3.staff
ORDER BY salary DESC;

-- в порядке возростания
SELECT * FROM seminar3.staff
ORDER BY salary ASC;
-- или моожно было ASC не писать, результат тот же

-- 5 максимальных зароботных плат
-- Двоякое задание можно понять как 5 строк сверху если отсортировать по убывания з/п, но уникальных значений 4
SELECT * FROM seminar3.staff
ORDER BY salary DESC
LIMIT 5;

-- Либо отсортировать по уникальности з/п и вывести всех с этими значениями, тогда строк получится больше
SELECT DISTINCT seminar3.staff.salary
FROM seminar3.staff
LIMIT 5;
-- но я не знаю как вывести эти данные, потому что если применяется DISTINCT, то он занимает все значения и понимаю как добавить столбец, чтобы были поля не уникальные рядом

-- Посчитать суммарную з/п по каждой специальности
SELECT seminar3.staff.post AS "Должность", SUM(seminar3.staff.salary) AS "Сумма з/п"
FROM seminar3.staff
GROUP BY post;
