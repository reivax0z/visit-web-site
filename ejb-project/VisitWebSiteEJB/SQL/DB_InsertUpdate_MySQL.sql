DROP TABLE TOPFIVE;
DROP TABLE VIDEOS;
DROP TABLE CITY;
DROP TABLE FACTS;
DROP TABLE ABOUT;
DROP TABLE COUNTRY;
CREATE TABLE COUNTRY (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        NAME VARCHAR(50),
        INFO VARCHAR(500),
		PRIMARY KEY (ID)
    );
CREATE UNIQUE INDEX COUNTRY_NAME_IDX ON COUNTRY(NAME);
CREATE TABLE FACTS (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        NAME VARCHAR(50),
        ESTABLISHED VARCHAR(50),
        AREA NUMERIC(10),
        TIMEZONE VARCHAR(50),
        CURRENCY VARCHAR(50),
        POPULATION VARCHAR(20),
        LANGUAGES VARCHAR(100),
		PRIMARY KEY (ID)
    );
CREATE UNIQUE INDEX FACTS_NAME_IDX ON FACTS(NAME);
CREATE TABLE ABOUT (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        NAME VARCHAR(50),
        INFO VARCHAR(500),
        DIDYOUKNOW VARCHAR(500),
		PRIMARY KEY (ID)
    );
CREATE UNIQUE INDEX ABOUT_NAME_IDX ON ABOUT(NAME);
CREATE TABLE CITY (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        COUNTRY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        FACT_ID INTEGER NOT NULL,
        ABOUT_ID INTEGER NOT NULL,
		PRIMARY KEY (ID)
    );
ALTER TABLE CITY ADD CONSTRAINT CITY_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRY (ID);
ALTER TABLE CITY ADD CONSTRAINT CITY_FOREIGNKEY_FACT_ID FOREIGN KEY (FACT_ID)
    REFERENCES FACTS (ID);
ALTER TABLE CITY ADD CONSTRAINT CITY_FOREIGNKEY_ABOUT_ID FOREIGN KEY (ABOUT_ID)
    REFERENCES ABOUT (ID);
CREATE UNIQUE INDEX CITY_NAME_IDX ON CITY(NAME);
CREATE TABLE TOPFIVE (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        INBRIEF VARCHAR(150),
        DESCRIPTION VARCHAR(500),
		PRIMARY KEY (ID)
    );
ALTER TABLE TOPFIVE ADD CONSTRAINT TOPFIVE_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID);
CREATE UNIQUE INDEX TOPFIVE_NAME_IDX ON TOPFIVE(NAME);
CREATE TABLE VIDEOS (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        LINK VARCHAR(150),
        DESCRIPTION VARCHAR(500),
		PRIMARY KEY (ID)
    );
ALTER TABLE VIDEOS ADD CONSTRAINT VIDEOS_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID);
CREATE UNIQUE INDEX VIDEOS_NAME_IDX ON VIDEOS(NAME);
INSERT INTO COUNTRY (NAME, INFO) VALUES ('Australia', 'A continent and a country, as big as Europe and with only 22 million inhabitants!');
INSERT INTO COUNTRY (NAME, INFO) VALUES ('France', 'The country of baguette, red wine, romance... and some other normal stuff too');
INSERT INTO COUNTRY (NAME, INFO) VALUES ('Italy', 'A country known for its cuisine, culture and love for coffee');
INSERT INTO FACTS (NAME, ESTABLISHED, AREA, TIMEZONE, CURRENCY, POPULATION, LANGUAGES)
    VALUES(
	'Sydney', 
    '01/26/1788',
    121,
    'AEST (UTC+10)',
    'Australian Dollar ($ AUD)', 
    '4.6 million',
    'English');
INSERT INTO ABOUT (NAME, INFO, DIDYOUKNOW)
    VALUES ( 
    'Sydney', 
    'Sydney is the state capital of New South Wales and the most populous city in Australia. It is on Australia''s south-east coast, on the Tasman Sea.
	Inhabitants of Sydney are called Sydneysiders, comprising a cosmopolitan and international population.
	The site of the first British colony in Australia, Sydney was established in 1788 at Sydney Cove by Arthur Phillip, commodore of the First Fleet, as a penal colony.', 
    'Canberra was born from the war between Sydney and Melbourne over capital city!');
INSERT INTO CITY (COUNTRY_ID, NAME, FACT_ID, ABOUT_ID)
    VALUES (
	(SELECT ID FROM COUNTRY WHERE NAME = 'Australia'), 
	'Sydney',
	(SELECT ID FROM FACTS WHERE NAME = 'Sydney'),
	(SELECT ID FROM ABOUT WHERE NAME = 'Sydney'));
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'The Blue Mountains', 
    'The Blue Mountains are mountains within 2h drive from Sydney.',
    'Their names come from the color of the rocks: they are blue!');
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Opera House', 
    'One of the symbol of Australia, known all over the world, like the Eiffel Tower!',
    'Created in 1973 and designed by Danish architect Jørn Utzon. 
	Described as an "artistic monument", it is one of the most recognisable landmarks in both Sydney and Australia and is a UNESCO World Heritage Site.');
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Bondi to Coogee Beach', 
    'A great walk along the shore of 2h is waiting for you.',
    'Superb views, superb beaches, superb weather, superb swimming pools... but sharks!');
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Manly Beach', 
    'One of the most famous beach for surfers in the world!',
    'Access it via a ferry from the Sydney CBD (approx. 30 min). 
	Some surfing schools are here, so... it is time to try!');
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Taronga Zoo', 
    'Situated at the top of a hill, you''ll have a great point of view on Sydney!',
    'You''ll discover girafs, dolphins, koalas, kangaroos, ...but also some very dangerous predators!');
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'NYE Fireworks', 
    '//www.youtube.com/embed/d6lWArihfm0',
    'Every year, for New Year''s Eve, fireworks are fired from the bay of Sydney, near the Harbour Bridge and the Opera House.
	Australians are known to produce the best possible fireworks.
	Have a look at this video to make up your own mind.');
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Sydney Ad', 
    '//www.youtube.com/embed/weYGChQ1g5Q',
    'Here is the official ad made by Tourism Australia.
	If you''re not convinced after that, well, we can''t do anything for you...');
-- INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
--    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
--   'John Butler Trio', 
--   '//www.youtube.com/embed/jdYJf_ybyVo',
--   'He is one of the most talented Australian guiratists of its generation. Check him out!');
-- INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
--    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
--    'Carlton Draught Ad', 
--    '//www.youtube.com/embed/F2O7oGtpBIY',
--    'Australians are known be to heavy beer drinkers.
-- 	  But they also make great ads about it!');
SELECT * FROM COUNTRY;
SELECT c.NAME, co.NAME AS COUNTRY, f.CURRENCY, a.INFO, v.LINK, t.NAME AS TOP FROM CITY c, COUNTRY co, FACTS f, ABOUT a, VIDEOS v, TOPFIVE t
where c.COUNTRY_ID = co.ID
and c.NAME = f.NAME
and c.NAME = a.NAME
and c.ID = v.CITY_ID
and c.ID = t.CITY_ID
and c.NAME = 'Sydney';
