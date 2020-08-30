-- challenge 1
SELECT
    username,
    created_at
FROM users
ORDER BY created_at 
lIMIT 5;

-- challenge 2
SELECT 
    DAYNAME(created_at) AS DAY,
    COUNT(*) AS total
FROM users
GROUP BY DAY
ORDER BY total DESC
LIMIT 3;

--challenge 3
SELECT
    username,
    CASE
        WHEN image_url IS NULL THEN 'Inactive'
    END AS 'status'
FROM users
LEFT JOIN photos
    ON users.id=photos.user_id
WHERE photos.image_url IS NULL
GROUP BY username;

--challenge 4
SELECT 
    username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
ON photos.id=likes.photo_id
INNER JOIN users
ON photos.user_id=users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 3;

--challenge 5
--total no of photos / total no of users -->gives average post of single user
SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users) AS 'average';

--challenge 6
SELECT
    tags.tag_name,
    COUNT(*) AS total
FROM tags
INNER JOIN photo_tags
ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

--challenge 7
SELECT
    user_id,
    username,
    count(*) AS total
FROM likes
INNER JOIN users
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING  total = (SELECT COUNT(*) FROM photos) ;