DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;



CREATE TABLE users(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NUll,
    created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO users (username)
VALUES ('Blue the cat'),('Abdul Mufeez'),('Abdul Muneeb'),('Abdul Moazzim');



CREATE TABLE photos(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NUll,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE
);
INSERT INTO photos (image_url,user_id)
VALUES ('/jkandwidn',1),('/fkfnainn',1),('/cnasdklcnweui',3);



CREATE TABLE comments(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NUll,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON DELETE CASCADE
);
INSERT INTO comments (comment_text,user_id,photo_id)
VALUES ('Its a nice cat',1,1),('Its him',1,2),('i also bought it',2,1),('i dont know',4,3);



CREATE TABLE likes(
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON DELETE CASCADE,
    PRIMARY KEY (user_id,photo_id)
);
INSERT INTO likes (user_id,photo_id)
VALUES (1,1),(2,1),(1,2),(2,3);



CREATE TABLE follows(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES users(id)
    ON DELETE CASCADE,
    PRIMARY KEY (follower_id,followee_id)
);
INSERT INTO follows(follower_id,followee_id)
VALUES (1,2),(4,2),(1,3),(2,1),(3,1);



CREATE TABLE tags(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags(
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id)
    ON DELETE CASCADE,
    PRIMARY KEY (photo_id,tag_id)
);
INSERT INTO tags(tag_name)
VALUES ('awesome'),('chutiya'),('hrami');
INSERT INTO photo_tags(photo_id,tag_id)
VALUES (2,1),(1,2);