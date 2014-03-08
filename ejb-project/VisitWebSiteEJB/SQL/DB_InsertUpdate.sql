DROP TABLE FACTS
DROP TABLE ABOUT
DROP TABLE TOPFIVE
DROP TABLE VIDEOS
DROP TABLE CITY
DROP TABLE COUNTRY
CREATE TABLE COUNTRY (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        NAME VARCHAR(50),
        INFO VARCHAR(500)
    )
ALTER TABLE COUNTRY ADD CONSTRAINT COUNTRY_PRIMARY_KEY PRIMARY KEY (ID)
CREATE UNIQUE INDEX COUNTRY_NAME_IDX ON COUNTRY(NAME)
CREATE TABLE CITY (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        COUNTRY_ID INTEGER NOT NULL,
        NAME VARCHAR(50)
    )
ALTER TABLE CITY ADD CONSTRAINT CITY_PRIMARY_KEY PRIMARY KEY (ID)
ALTER TABLE CITY ADD CONSTRAINT CITY_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRY (ID)
CREATE UNIQUE INDEX CITY_NAME_IDX ON CITY(NAME)
CREATE TABLE FACTS (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        ESTABLISHED VARCHAR(50),
        AREA NUMERIC(3),
        TIMEZONE VARCHAR(50),
        CURRENCY VARCHAR(50),
        POPULATION VARCHAR(20),
        LANGUAGES VARCHAR(100)
    )
ALTER TABLE FACTS ADD CONSTRAINT FACTS_PRIMARY_KEY PRIMARY KEY (ID)
ALTER TABLE FACTS ADD CONSTRAINT FACTS_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID)
CREATE UNIQUE INDEX FACTS_NAME_IDX ON FACTS(NAME)
CREATE TABLE ABOUT (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        INFO VARCHAR(500),
        DIDYOUKNOW VARCHAR(150)
    )
ALTER TABLE ABOUT ADD CONSTRAINT ABOUT_PRIMARY_KEY PRIMARY KEY (ID)
ALTER TABLE ABOUT ADD CONSTRAINT ABOUT_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID)
CREATE UNIQUE INDEX ABOUT_NAME_IDX ON ABOUT(NAME)
CREATE TABLE TOPFIVE (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        INBRIEF VARCHAR(150),
        DESCRIPTION VARCHAR(500)
    )
ALTER TABLE TOPFIVE ADD CONSTRAINT TOPFIVE_PRIMARY_KEY PRIMARY KEY (ID)
ALTER TABLE TOPFIVE ADD CONSTRAINT TOPFIVE_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID)
CREATE UNIQUE INDEX TOPFIVE_NAME_IDX ON TOPFIVE(NAME)
CREATE TABLE VIDEOS (
        ID INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
        CITY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        LINK VARCHAR(150),
        DESCRIPTION VARCHAR(500)
    )
ALTER TABLE VIDEOS ADD CONSTRAINT VIDEOS_PRIMARY_KEY PRIMARY KEY (ID)
ALTER TABLE VIDEOS ADD CONSTRAINT VIDEOS_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (CITY_ID)
    REFERENCES CITY (ID)
CREATE UNIQUE INDEX VIDEOS_NAME_IDX ON VIDEOS(NAME)
INSERT INTO COUNTRY (NAME, INFO) VALUES ('Australia', 'Blablabla')
INSERT INTO COUNTRY (NAME, INFO) VALUES ('France', 'Blablabla')
INSERT INTO COUNTRY (NAME, INFO) VALUES ('USA', 'Blablabla')
INSERT INTO CITY (COUNTRY_ID, NAME)
    VALUES ((SELECT ID FROM COUNTRY WHERE NAME = 'Australia'), 'Sydney')
INSERT INTO CITY (COUNTRY_ID, NAME)
    VALUES ((SELECT ID FROM COUNTRY WHERE NAME = 'Australia'), 'Melbourne')
INSERT INTO CITY (COUNTRY_ID, NAME)
    VALUES ((SELECT ID FROM COUNTRY WHERE NAME = 'France'), 'Paris')
INSERT INTO CITY (COUNTRY_ID, NAME)
    VALUES ((SELECT ID FROM COUNTRY WHERE NAME = 'France'), 'Nice')
INSERT INTO CITY (COUNTRY_ID, NAME)
    VALUES ((SELECT ID FROM COUNTRY WHERE NAME = 'USA'), 'New York')
INSERT INTO FACTS (CITY_ID, NAME, ESTABLISHED, AREA, TIMEZONE, CURRENCY, POPULATION, LANGUAGES)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Sydney in a Noteshell', 
    '01/26/1788',
    121,
    'AEST (UTC+10)',
    'Australian Dollar ($ AUD)', 
    '4.6 million',
    'English')
INSERT INTO ABOUT (CITY_ID, NAME, INFO, DIDYOUKNOW)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'About Sydney', 
    'Sydney is the state capital of New South Wales and the most populous city in Australia. It is on Australia''s south-east coast, on the Tasman Sea.
	Inhabitants of Sydney are called Sydneysiders, comprising a cosmopolitan and international population.
	The site of the first British colony in Australia, Sydney was established in 1788 at Sydney Cove by Arthur Phillip, commodore of the First Fleet, as a penal colony.', 
    'Canberra was born from the war between Sydney and Melbourne over capital city!')
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'The Blue Mountains', 
    'The Blue Mountains are mountains within 2h drive from Sydney.',
    'Their names come from the color of the rocks: they are blue!')
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Opera House', 
    'One of the symbol of Australia, known all over the world, like the Eiffel Tower!',
    'Created in 1973 and designed by Danish architect Jørn Utzon. 
	Described as an "artistic monument", it is one of the most recognisable landmarks in both Sydney and Australia and is a UNESCO World Heritage Site.')
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Bondi to Coogee Beach', 
    'A great walk along the shore of 2h is waiting for you.',
    'Superb views, superb beaches, superb weather, superb swimming pools... but sharks!')
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Manly Beach', 
    'One of the most famous beach for surfers in the world!',
    'Access it via a ferry from the Sydney CBD (approx. 30 min). 
	Some surfing schools are here, so... it is time to try!')
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Taronga Zoo', 
    'Situated at the top of a hill, you''ll have a great point of view on Sydney!',
    'You''ll discover girafs, dolphins, koalas, kangaroos, ...but also some very dangerous predators!')
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'NYE Fireworks', 
    '//www.youtube.com/embed/d6lWArihfm0',
    'Every year, for New Year''s Eve, fireworks are fired from the bay of Sydney, near the Harbour Bridge and the Opera House.
	Australians are known to produce the best possible fireworks.
	Have a look at this video to make up your own mind.')
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Sydney Ad', 
    '//www.youtube.com/embed/weYGChQ1g5Q',
    'Here is the official ad made by Tourism Australia.
	If you''re not convinced after that, well, we can''t do anything for you...')
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'John Butler Trio', 
    '//www.youtube.com/embed/jdYJf_ybyVo',
    'He is one of the most talented Australian guiratists of its generation. Check him out!')
INSERT INTO VIDEOS (CITY_ID, NAME, LINK, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Carlton Draught Ad', 
    '//www.youtube.com/embed/F2O7oGtpBIY',
    'Australians are known be to heavy beer drinkers.
	But they also make great ads about it!')
SELECT * FROM COUNTRY
delete from COUNTRY c where c.ID = 11