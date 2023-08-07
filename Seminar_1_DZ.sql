# Создал через графический интерфейс:
CREATE TABLE `seminar1`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` INT NULL,
  `price` INT NULL,
  PRIMARY KEY (`id`));

# Заполнил данными:
INSERT INTO mobile_phones (product_name, manufacturer, product_count, price) 
VALUES ("iPhone X", "Apple", 3, 76000),
	("iPhone 8", "Apple", 2, 51000),
	("Galaxy S9", "Sumsung", 2, 56000),
	("Galaxy S8", "Sumsung", 1, 41000),
	("P20 Pro", "Huawei", 5, 36000);
SELECT * FROM mobile_phones;

# Выведите название, производителя и цену для товаров, количество которых превышает 2:
SELECT product_name, manufacturer, price FROM mobile_phones 
WHERE product_count > 2;

# Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones 
WHERE manufacturer LIKE "Sumsung";

# Товары в которых есть упоминание "iphone"
SELECT * FROM mobile_phones 
WHERE product_name REGEXP "iPhone" OR manufacturer REGEXP "iPhone";

# Товары в которых есть упоминание "Sumsung"
SELECT * FROM mobile_phones 
WHERE product_name REGEXP "Sumsung" OR manufacturer REGEXP "Sumsung";


