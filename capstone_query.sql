CREATE DATABASE express;

CREATE TABLE users(
    users_id serial PRIMARY KEY NOT NULL,
    user_username VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_pen_name VARCHAR(50) UNIQUE NOT NULL,
    user_first_name VARCHAR(50) NOT NULL,
    user_last_name VARCHAR(50) NOT NULL,
    user_birth_date VARCHAR(50) NOT NULL,
    user_email_address VARCHAR(50) NOT NULL
);

INSERT INTO users(users_id, user_username, user_password, user_pen_name, user_first_name, user_last_name, user_birth_date, user_email_address)
VALUES (1, '@shinmentakezo12', 'Password123', 'Bard of Sorrows', 'John', 'Smith', 'July 1995', 'johnsmith@gmail.com');

CREATE TABLE log_in(
    log_in_id serial PRIMARY KEY NOT NULL,
    user_username VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL
);

INSERT INTO log_in(log_in_id, user_username, user_password)
VALUES (1, '@shinmentakezo12', 'Password123');

CREATE TABLE homepage(
    homepage_id serial PRIMARY KEY NOT NULL,
    user_pen_name VARCHAR(20) NOT NULL,
    user_username VARCHAR(20) NOT NULL,
    homepage_time_stamp DATE NOT NULL,
    homepage_message TEXT NOT NULL,
    homepage_privacy VARCHAR(15) NOT NULL
);

INSERT INTO homepage(homepage_id, user_pen_name, user_username, homepage_time_stamp, homepage_message, homepage_privacy)
VALUES (1, 'Bard of Sorrows', '@shinmentakezo12', '1997-12-01', 'Hello', 'Public');

CREATE TABLE profiles(
    profile_id serial PRIMARY KEY NOT NULL,
    user_pen_name VARCHAR(20) NOT NULL,
    user_username VARCHAR(20) NOT NULL,
    profile_bio TEXT NOT NULL,
    profile_link VARCHAR(50) NOT NULL,
    profile_following INT,
    profile_followers INT
);

INSERT INTO profiles(profile_id, user_pen_name, user_username, profile_bio, profile_link, profile_following, profile_followers)
VALUES (1, 'Bard of Sorrows', '@shinmentakezo12', 'Male. Programmer. Edgy.', 'github/Ken1567', 1256, 1234);

SELECT log_in.*, homepage.*, profiles.*
FROM log_in
INNER JOIN homepage
ON log_in.log_in_id = homepage.homepage_id
INNER JOIN profiles
ON log_in.log_in_id = profiles.profile_id
