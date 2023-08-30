USE semimar_4;

SELECT * FROM profiles;
SELECT * FROM users;
SELECT * FROM messages;

-- Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
SELECT lastname, firstname, hometown, gender FROM profiles
JOIN users ON profiles.user_id = users.id
WHERE 20 >= TIMESTAMPDIFF(YEAR, birthday, CURDATE());

/* Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, 
указав имя и фамилию пользователя, количество отправленных сообщений и 
место в рейтинге (первое место у пользователя с максимальным количеством сообщений). */
SELECT lastname, firstname,
    COUNT(users.id) AS "Кол-во отправленных сообщений"
FROM users
JOIN messages ON messages.from_user_id = users.id
GROUP BY users.id
ORDER BY COUNT(users.id) DESC;

/* Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления
(created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося
списка. (используйте LEAD или LAG) */
SELECT from_user_id, to_user_id, created_at, body,
    LEAD (created_at) OVER (ORDER BY created_at ASC) next_mess
FROM messages;
