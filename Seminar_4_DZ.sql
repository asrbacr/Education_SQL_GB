-- Подсчитать общее количество лайков, которые получили пользователи младше 12 лет
SELECT pr.birthday, COUNT(*) FROM likes AS l
JOIN users AS u ON u.id = l.user_id
JOIN profiles AS pr ON pr.user_id = u.id
WHERE pr.birthday > '2011-08-18'
GROUP BY pr.birthday;

-- Определить кто больше поставил лайков (всего): мужчины или женщины
SELECT pr.gender AS "Пол пользователя", count(*) AS "кол-во лайков"
FROM likes AS l
JOIN users AS u ON u.id = l.user_id
JOIN profiles AS pr ON pr.user_id = u.id
GROUP BY pr.gender;

-- Вывести всех пользователей, которые не отправляли сообщения
SELECT id, lastname, firstname 
FROM users 
WHERE id NOT IN 
(SELECT DISTINCT mes.to_user_id
FROM messages AS mes
ORDER BY from_user_id ASC);
