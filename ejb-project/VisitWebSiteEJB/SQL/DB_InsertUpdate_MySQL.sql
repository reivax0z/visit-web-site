DROP TABLE TOPFIVE;
DROP TABLE VIDEOS;
DROP TABLE CITY;
DROP TABLE COUNTRY;


CREATE TABLE COUNTRY (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        NAME VARCHAR(50),
        INFO VARCHAR(500),
        LATITUDE DECIMAL(10,7),
        LONGITUDE DECIMAL(10, 7),
		PRIMARY KEY (ID)
    );
CREATE UNIQUE INDEX COUNTRY_NAME_IDX ON COUNTRY(NAME);
CREATE TABLE CITY (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        COUNTRY_ID INTEGER NOT NULL,
        NAME VARCHAR(50),
        LATITUDE DECIMAL(10,7),
        LONGITUDE DECIMAL(10, 7),
        INFO VARCHAR(500),
        DIDYOUKNOW VARCHAR(500),
        ESTABLISHED VARCHAR(50),
        AREA NUMERIC(10),
        TIMEZONE VARCHAR(50),
        CURRENCY VARCHAR(50),
        POPULATION VARCHAR(20),
        LANGUAGES VARCHAR(100),
		PRIMARY KEY (ID)
    );
ALTER TABLE CITY ADD CONSTRAINT CITY_FOREIGNKEY_COUNTRY_ID FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRY (ID);
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


INSERT INTO COUNTRY (NAME, LATITUDE, LONGITUDE, INFO) VALUES ('Australia', -25.136856, 133.281323, 'A continent and a country, as big as Europe and with only 22 million inhabitants!');
INSERT INTO COUNTRY (NAME, LATITUDE, LONGITUDE, INFO) VALUES ('France', 46.688486, 2.422229, 'The country of baguette, red wine, romance... and some other normal stuff too');
INSERT INTO COUNTRY (NAME, LATITUDE, LONGITUDE, INFO) VALUES ('Italy', 43.010873, 12.551638, 'A country known for its cuisine, culture and love for coffee');
INSERT INTO CITY (COUNTRY_ID, NAME, LATITUDE, LONGITUDE, INFO, DIDYOUKNOW,
        ESTABLISHED, AREA, TIMEZONE, CURRENCY, POPULATION, LANGUAGES)
    VALUES (
	(SELECT ID FROM COUNTRY WHERE NAME = 'Australia'), 
	'Sydney',
	-33.870501, 
	151.210824,
	'Sydney is the state capital of New South Wales and the most populous city in Australia. It is on Australia''s south-east coast, on the Tasman Sea.
	Inhabitants of Sydney are called Sydneysiders, comprising a cosmopolitan and international population.
	The site of the first British colony in Australia, Sydney was established in 1788 at Sydney Cove by Arthur Phillip, commodore of the First Fleet, as a penal colony.', 
    'Canberra was born from the war between Sydney and Melbourne over capital city!',
    '01/26/1788',
    121,
    'AEST (UTC+10)',
    'Australian Dollar ($ AUD)', 
    '4.6 million',
    'English'
	);
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'The Blue Mountains', 
    'The Blue Mountains are mountains within 2h drive from Sydney.',
    'Their names come from the color of the rocks: they are blue!');
INSERT INTO TOPFIVE (CITY_ID, NAME, INBRIEF, DESCRIPTION)
    VALUES ((SELECT ID FROM CITY WHERE NAME = 'Sydney'), 
    'Opera House', 
    'One of the symbol of Australia, known all over the world, like the Eiffel Tower!',
    'Created in 1973 and designed by Danish architect JÃ¸rn Utzon. 
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


-- BLOG PART
CREATE TABLE ARTICLE (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        DATE VARCHAR(50) NOT NULL,
        TITLE VARCHAR(50),
        INTRO TEXT,
        CONCLUSION TEXT,
		PRIMARY KEY (ID)
    );
CREATE UNIQUE INDEX ARTICLE_NAME_IDX ON ARTICLE(DATE);
CREATE TABLE ARTICLE_PART (
        ID INTEGER NOT NULL AUTO_INCREMENT,
        ARTICLE_ID INTEGER NOT NULL,
        TITLE VARCHAR(50),
        BODY TEXT,
		PRIMARY KEY (ID)
    );
ALTER TABLE ARTICLE_PART ADD CONSTRAINT ARTICLE_PART_FOREIGNKEY_ARTICLE_ID FOREIGN KEY (ARTICLE_ID)
    REFERENCES ARTICLE (ID);
CREATE UNIQUE INDEX ARTICLE_PART_TITLE_IDX ON ARTICLE_PART(TITLE);

INSERT INTO ARTICLE (DATE, TITLE, INTRO, CONCLUSION)
    VALUES ( 
    '2014-03-12', 
    '1 mois en Australie', 
    'Nous sommes donc le 13 Mars 2014, et cela fait depuis hier 1 mois que je suis arrivé en Australie !',
    'A très vite pour la suite des aventures de Xavier downunder ;)'
    );
INSERT INTO ARTICLE_PART (ARTICLE_ID, TITLE, BODY)
    VALUES (
	(SELECT ID FROM ARTICLE WHERE DATE = '2014-03-12'), 
	'Arrivée en Australie',
	'Tout a commencé par un séjour de 4 jours sur Sydney, histoire de faire un peu vacances. Je suis resté en auberge de jeunesse et retrouvé quelques Australiens rencontrés presque 1 an auparavant à Paris. Bref, un beau temps, la ville, les potes, les plages, le décalage horaire, la fatigue... Autant dire que les 4 jours sont passés très vites !');
	INSERT INTO ARTICLE_PART (ARTICLE_ID, TITLE, BODY)
    VALUES (
	(SELECT ID FROM ARTICLE WHERE DATE = '2014-03-12'), 
	'Arrivée sur Melbourne',
	'Et me voilà dans le premier avion de la journée en partance pour Melbourne. Il est 4h du matin quand je quitte l''auberge de jeunesse... Et me voilà quelques heures plus tard à Melbourne. Histoire d''être bien accueilli, il pleut des trombes d''eau ! J''arrive à trouver la maison en colocation que je devais visiter. Autant dire que je suis choqué par l''état de la maison : très sale, peu accueillant, pourriture de partout. Et pourtant, le jeune étudiant Chinois qui loue l''endroit (pour sa tante) parrait très gentil. Il me dit que les autres locataires (tous Australiens) vont bientôt arriver. Alors suite à cette gentillesse et la fatigue, je signe le bail...
');
	INSERT INTO ARTICLE_PART (ARTICLE_ID, TITLE, BODY)
    VALUES (
	(SELECT ID FROM ARTICLE WHERE DATE = '2014-03-12'), 
	'Installation',
	'Quelle erreur ! Mais heureusement, je me retrouve avec 3 autres super colocataires dans ce pétrin. 3 d''entre nous décident d''aller chez une association de locataires de Melbourne pour voir si l''on peut se sortir de cette situation. Et oui ! La maison n''étant pas enregirstée auprès des autorités, on peut quitter les lieux ! Quel soulagement ! J''aide le colocataire Australien à mettre ses affaires en dépôt, et on se retrouve tous les 2 à la case départ : en auberge de jeunesse, sans logement, et avec la rentrée approchant... Mais en même temps, on devient super potes ! On profite aussi de l''auberge pour rencontrer des gens sympa et visiter la ville.

Quelques jours plus tard et quelques visites plus loin, me voici dans mon vrai chez moi ! Une town house, ou appartement sur 2 étages. On se répartit un étage avec 2 autres colocataires. C''est propre, et surtout, assez proche de l''université : banlieue de Brunswick, seulement 4km au nord de l''université. Bref, parfait !
');

	INSERT INTO ARTICLE_PART (ARTICLE_ID, TITLE, BODY)
    VALUES (
	(SELECT ID FROM ARTICLE WHERE DATE = '2014-03-12'), 
	'L''université',
	'Puis l''université commence. Superbe campus, batiments magnifiques, des gens entousiastes, des gros événements (grosses entreprises venant promouvoir leurs bénéfices, sports en tous genre, toutes les cuisines du monde directement sur le campus, ...). Le rêve d''un master d''un an en Australie commence ! Et c''est dans la 32ème meilleure université du monde, 15ème en Informatique et Ingénierie, et 1ère en Australie, rien que ça...');
	
		INSERT INTO ARTICLE_PART (ARTICLE_ID, TITLE, BODY)
    VALUES (
	(SELECT ID FROM ARTICLE WHERE DATE = '2014-03-12'), 
	'Premières remarques',
	'Les premières semaines s''enchaines, et je n''ai pas beaucoup de temps libre : je me déplace en vélo, recontre des gens via les cours et le tennis, je recherche des boulots, je visite la ville et les environs, je sors avec quelques bons amis que je me suis faits, et commence à faire les groupes pour les différents projets que nous avons dans les différents cours...

Le temps de Melbourne est bien ce que l''on entend : très variable ! La température peut passer de 33°C à 20°C en quelques heures, d''un superbe soleil à une pluie battante en quelques minutes... Bref, il faut savoir s''adapter et toujours avoir un Kway avec nous !'
	);
	
	
	drop table ARTICLE_PART;
	drop table ARTICLE;
	
	select * from ARTICLE;
	update ARTICLE SET DATE = '2014-03-15' where ID = 3;