CREATE DATABASE videos
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS video;

CREATE TABLE video
(
  video_id integer NOT NULL,
  video_title text,
  video_length integer,
  video_url text,
  CONSTRAINT pk_video_id PRIMARY KEY (video_id)
)
;

INSERT INTO video( video_id, video_title, video_length, video_url)
    VALUES (1, 'Steal the moon', 180,'https://www.youtube.com/watch?v=YITu1rwWLyY&list=PL11C80D00828D34EF&index=1');

INSERT INTO video( video_id, video_title, video_length, video_url)
    VALUES (2, 'Ground rules', 120,'https://www.youtube.com/watch?v=_dP7gkKXTs8&list=PL11C80D00828D34EF&index=4');

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews
(
  review_id integer NOT NULL,
  video_id integer NOT NULL,
  user_name text,
  review_text text,
  video_rating integer,
  CONSTRAINT pk_review_id PRIMARY KEY (review_id),
  CONSTRAINT fk_video_id FOREIGN KEY (video_id)
      REFERENCES video (video_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;

INSERT INTO reviews(review_id, video_id, user_name, review_text, video_rating)
    VALUES (1, 1, 'Arun Kumar', 'ha ha ha', 5);
INSERT INTO reviews(review_id, video_id, user_name, review_text, video_rating)
    VALUES (2, 1, 'Megan', 'funny', 4);
INSERT INTO reviews(review_id, video_id, user_name, review_text, video_rating)
    VALUES (3, 2, 'Leo', 'Awesome', 5);
