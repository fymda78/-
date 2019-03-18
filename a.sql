create database Celebrities
go
use Celebrities;

create table celebritiesinfos (
		DateofBirth date,
		Cname varchar(100),
		Nationalities varchar(100),
		Gender varchar(50),
		Amountofvisit bigint,
		Bio varchar(max),
		PlaceofBirth varchar(100),
		Mostfamousquote varchar(MAX),
		CID		int identity (1,1) NOT NULL primary key
)

create table Agents(
		Aname varchar(100) NOT NULL,
		Startdate date NOT NULL,
		Enddate date
)
alter table Agents
add constraint pkAgents primary key (Aname) 

create table CelebritiesAgents(
		CID int identity (1,1) NOT NULL,
		Agentname varchar(100) NOT NULL 
		primary key (CID, Agentname),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (Agentname) references Agents (Aname)
)

create table Figures(
		CID int NOT NULL primary key,
		CWeight smallint,
		Height smallint,
		Bust smallint,
		Waist smallint,
		Hips smallint
)
alter table Figures
add constraint fkcelebritiesinfos foreign key (CID) references celebritiesinfos (CID)

create table News(
		NewsID int NOT NULL primary key,
		Amountofvisit bigint,
		Dateofnews date,
		Title varchar(100),
		Newscontent varchar(MAX)
)

create table CelebritiesNews(
		CID int NOT NULL,
		NewsID int NOT NULL 
		primary key (CID, NewsID),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (NewsID) references News (NewsID)
)

create table Typesinfo(
		TypesID int NOT NULL primary key,
		Typesname varchar(100)
)

create table CelebritiesTypes(
		CID int NOT NULL,
		TypesID int NOT NULL 
		primary key (CID, TypesID),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (TypesID) references Typesinfo (TypesID)
)

create table Awards(
		AwardsID int NOT NULL primary key,
		Awname varchar(100),
		Awdate date,
		Awardwinningtimes int
)

create table CelebritiesAward(
		CID int NOT NULL,
		AwardsID int NOT NULL 
		primary key (CID, AwardsID),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (AwardsID) references Awards (AwardsID)
)

create table Partners(
		PID int NOT NULL primary key,
		Bio varchar(MAX),
		Pname varchar(100),
		Relationship varchar(50)
)

create table PartnersWhoAreCelebrities(
		CID int NOT NULL,
		PID int NOT NULL 
		primary key (CID, PID),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (PID) references Partners (PID)
)

create table Works(
		WorkID int NOT NULL primary key,
		Wname varchar(100),
		Wdescription varchar(100),
		DateofPublished date,
		Review varchar(MAX),
		Amountofvisit bigint
)

create table Formats(
		Ftype varchar(100) NOT NULL primary key
)

create table Publishers(
		Pname varchar(100) NOT NULL primary key
)

create table WorkFormats(
		WorkID int NOT NULL,
		Ftype varchar(100) NOT NULL 
		primary key (WorkID, Ftype),
		foreign key (WorkID) references Works (WorkID),
		foreign key (Ftype) references Formats (Ftype)
)

create table WorkPublishers(
		WorkID int NOT NULL,
		Pname varchar(100) NOT NULL 
		primary key (WorkID, Pname),
		foreign key (WorkID) references Works (WorkID),
		foreign key (Pname) references Publishers (Pname)
)

create table RelatedCelebrities(
		CID int NOT NULL,
		WorkID int NOT NULL 
		primary key (CID, WorkID),
		foreign key (CID) references celebritiesinfos (CID),
		foreign key (WorkID) references Works (WorkID)
)

alter table Agents
add Lastcommercialadspaid money 
alter table Agents
drop column Lastcommercialadspaid 

INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Angelina Jolie', '06/04/1975', 'USA', 'FEMALE', 100999, 'Angelina Jolie is an Academy Award-winning actress who became popular after playing the title role in the "Lara Croft" blockbuster movies, as well as Mr. & Mrs. Smith (2005), Wanted (2008), Salt (2010) and Maleficent (2014). Off-screen, Jolie has become prominently involved in international charity projects, especially those involving refugees', 'LA, CA, USA', 'You are young, you are drunk, you are in bed, you have knives; shit happens.')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Emma Stone', '11/06/1988', 'USA', 'FEMALE', 1009998, 'Emily Jean "Emma" Stone was born in Scottsdale, Arizona, to Krista (Yeager), a homemaker, and Jeffrey Charles Stone, a contracting company founder and CEO. She is completely of Swedish descent.', 'Scottsdale, Arizona, USA', 'I like Yiming Fan')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Emma Watson', '04/05/1990', 'British', 'FEMALE', 1019998, 'Emma Charlotte Duerre Watson was born in Paris, France, to British parents, Jacqueline Luesby and Chris Watson, both lawyers. ', 'Paris, France', 'I like Yiming Fan more')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Kate Upton', '06/10/1992', 'USA', 'FEMALE', 101998, 'Upton always knew she wanted to be a model.', 'St. Joseph, Michigan, USA', 'I like Yiming Fan most')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Alexandra Daddario', '03/16/1986', 'USA', 'FEMALE', 1011998, 'She has Italian, Irish, Hungarian/Slovak, German, and English ancestry.', 'New York City, New York, USA', 'We like Yiming Fan')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Katy Perry', '10/25/1984', 'USA', 'FEMALE', 1111998, 'She has English, Portuguese, German, Irish, and Scottish ancestry.', 'Santa Barbara, California, USA', 'Who does not like Yiming Fan?')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth)
VALUES('Gisele Bündchen', '07/20/1980', 'Brazil', 'FEMALE', 10111998, 'Gisele Bündchen is a Brazilian model and actress', 'Brazil')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Kendall Jenner', '11/03/1995', 'USA', 'FEMALE', 101111998, 'Gisele Bündchen is a instagrammer too', 'USA', 'I like sandwiches')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth)
VALUES('Victoria Beckham', '04/17/1974', 'British', 'FEMALE', 11111998, 'Fashion designer and former singer', 'England')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth)
VALUES('Victoria Beckham', '04/17/1974', 'British', 'FEMALE', 11111998, 'Fashion designer and former singer', 'England')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Kobe Bryant', '08/23/1978', 'USA', 'MALE', 111111998, 'BEST BASKETBALL PLAYER AFTER JORDAN', 'Philly, PA, USA','4 a.m. of LA')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Yang Mi', '09/12/1986', 'China', 'FEMALE', 111998, 'Famous Chinese Actress', 'China','Wait, where is my husband')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Gülnezer Bextiyar', '05/02/1986', 'China', 'FEMALE', 151998, 'Famous Chinese Actress', 'China','I love you, Yiming Fan')
INSERT celebritiesinfos (Cname, DateofBirth, Nationalities, Gender, Amountofvisit, Bio, PlaceofBirth, Mostfamousquote)
VALUES('Li Landi', '09/02/1999', 'China', 'FEMALE', 11998, 'Young Chinese Actress', 'China','I love you, Yiming Fan')

alter table celebritiesinfos
add Lastcommercialadspaid money

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 12000000
WHERE CID = 1

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 4000000
WHERE CID = 2

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 300000
WHERE CID = 3

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 6000000
WHERE CID = 4

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 9000000
WHERE CID = 5

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 11000000
WHERE CID = 6

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 15000000
WHERE CID = 7

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 100000
WHERE CID = 8

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 1200000
WHERE CID = 9

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 200000000, Cname = 'David Beckham', DateofBirth = '05/02/1975', Nationalities = 'British', Gender = 'MALE', Amountofvisit = 111111111, Bio = 'His wife is Victoria Beckham', PlaceofBirth = 'London, England'
WHERE CID = 10

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 100000000
WHERE CID = 11

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 2000000
WHERE CID = 12

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 1000000
WHERE CID = 13

UPDATE celebritiesinfos
SET Lastcommercialadspaid = 5000000
WHERE CID = 14

INSERT Agents (Aname, Startdate)
VALUES ('Richard Lovett', '06/01/2004')
INSERT Agents (Aname, Startdate)
VALUES ('Kevin Huvane', '06/11/1995')
INSERT Agents (Aname, Startdate)
VALUES ('Ari Emanuel', '06/01/1992')
INSERT Agents (Aname, Startdate)
VALUES ('Tracey Jacobs', '01/01/2002')
INSERT Agents (Aname, Startdate)
VALUES ('Patrick Whitesell', '01/01/2008')
INSERT Agents (Aname, Startdate)
VALUES ('Sharon Sheinwold', '01/01/2018')
INSERT Agents (Aname, Startdate)
VALUES ('Jim Wiatt', '01/01/2010')
INSERT Agents (Aname, Startdate)
VALUES ('Patty Wells', '01/01/2010')
INSERT Agents (Aname, Startdate)
VALUES ('Rob Pelinka', '01/01/1997')
INSERT Agents (Aname, Startdate)
VALUES ('Simon Fuller', '01/01/1997')
INSERT Agents (Aname, Startdate)
VALUES ('Zeng Jia', '10/01/2010')
INSERT Agents (Aname, Startdate)
VALUES ('Dong Jinning', '10/12/2001')

INSERT CelebritiesAgents (Agentname)
VALUES('Richard Lovett')
INSERT CelebritiesAgents (Agentname)
VALUES('Patty Wells')
INSERT CelebritiesAgents (Agentname)
VALUES('Kevin Huvane')
INSERT CelebritiesAgents (Agentname)
VALUES('Kevin Huvane')
INSERT CelebritiesAgents (Agentname)
VALUES('Ari Emanuel')
INSERT CelebritiesAgents (Agentname)
VALUES('Tracey Jacobs')
INSERT CelebritiesAgents (Agentname)
VALUES('Patrick Whitesell')
INSERT CelebritiesAgents (Agentname)
VALUES('Sharon Sheinwold')
INSERT CelebritiesAgents (Agentname)
VALUES('Jim Wiatt')
INSERT CelebritiesAgents (Agentname)
VALUES('Simon Fuller')
INSERT CelebritiesAgents (Agentname)
VALUES('Rob Pelinka')
INSERT CelebritiesAgents (Agentname)
VALUES('Zeng Jia')
INSERT CelebritiesAgents (Agentname)
VALUES('Dong Jinning')
INSERT CelebritiesAgents (Agentname)
VALUES('Dong Jinning')

UPDATE CelebritiesAgents
set Agentname = 'Patty Wells'
Where CID = 2
UPDATE CelebritiesAgents
set Agentname = 'Kevin Huvane'
Where CID = 3
UPDATE CelebritiesAgents
set Agentname = 'Ari Emanuel'
Where CID = 5
UPDATE CelebritiesAgents
set Agentname = 'Tracey Jacobs'
Where CID = 6
UPDATE CelebritiesAgents
set Agentname = 'Patrick Whitesell'
Where CID = 7
UPDATE CelebritiesAgents
set Agentname = 'Sharon Sheinwold'
Where CID = 8
UPDATE CelebritiesAgents
set Agentname = 'Jim Wiatt'
Where CID = 9
UPDATE CelebritiesAgents
set Agentname = 'Simon Fuller'
Where CID = 10
UPDATE CelebritiesAgents
set Agentname = 'Rob Pelinka'
Where CID = 11
UPDATE CelebritiesAgents
set Agentname = 'Zeng Jia'
Where CID = 12
UPDATE CelebritiesAgents
set Agentname = 'Dong Jinning'
Where CID = 13

alter table Agents
drop column Enddate 

INSERT Awards (AwardsID, Awname, Awdate, Awardwinningtimes)
VALUES (1, 'OSCAR ACADEMY AWARD', '2000', 1)
UPDATE Awards
set Awdate = '2000'
where AwardsID = 1

INSERT Awards (AwardsID, Awname, Awardwinningtimes)
VALUES (2, 'Golden Globes', 2)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (3, 'OSCAR ACADEMY AWARD', 1)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (4, 'Golden Globes', 1)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (5, 'BAFTA/LA Britannia Awardss', 1)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)
VALUES (6, 'Style Awards-Model of the Year', 1)            
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (7, 'People Magazine Awards-Sexiest Woman', 1)
INSERT Awards (AwardsID, Awname)							
VALUES (8, 'NONE') 
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (9, 'MTV Video Music Awards', 2)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (10, 'Model of the Year', 2)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (11, 'Choice Model', 4)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (12, 'The Stinkers Bad Movie Awards', 1)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (13, 'European Champion', 1)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)
VALUES (14, 'Premier League Champion', 6)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)			
VALUES (15, 'NBA Champion', 5)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)
VALUES (16, 'NBA Final MVP', 2)
INSERT Awards (AwardsID, Awname, Awardwinningtimes)
VALUES (17, 'NBA SEASON MVP', 1)

ALTER TABLE Awards
drop column Awdate 
alter table Awards
add Awyear smallint
ALTER TABLE Awards
drop column Awyear

INSERT CelebritiesAward (CID, AwardsID)
VALUES (1,1)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (1,2)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (2,3)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (2,4)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (3,5)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (4,6)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (4,7)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (5,8)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (6,9)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (7,10)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (8,11)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (9,12)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (10,13)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (10,14)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (11,15)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (11,16)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (11,17)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (12,8)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (13,8)
INSERT CelebritiesAward (CID, AwardsID)
VALUES (14,8)

INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(1, 123456789, '11/26/2018', 'Angelina Jolie Had a Royal Meeting Over the Weekend and We Missed It', 'She and a member of the royal family attended a film festival fighting sexual violence.')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(2, 1223456789, '11/25/2018', 'Brad Pitt NOT Dishing About Angelina Jolie On Jada Pinkett Smith Podcast, Despite Reports', 'Brad Pitt is not going to dish about Angelina Jolie on Jada Pinkett Smith’s Facebook podcast, “Red Table Talk,” or anywhere else for that matter, despite a bogus report that was picked up by a few untrustworthy sites. Gossip Cop can exclusively shoot down this phony claim. We’re exclusively told will “never” happen.')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(3, 13456789, '11/23/2018', 'Emma Stone, Beyonce and more unexpected stars whose careers first began on reality TV', 'Reality TV can launch nobodies into superstardom -- just look at the Kardashians, Carrie Underwood or Chip and Jo Gaines.')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(4, 123456789, '11/26/2018', 'TOM FELTON REVEALS HE AND ‘HARRY POTTER’ COSTAR EMMA WATSON REUNITE “ALL THE TIME”', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(5, 1234567890, '11/23/2018', 'Katy Perry Is The Highest Paid Female Music Artist of 2018', 'Forbes has released their list of the highest-paid women in music for this year, with Katy Perry beating Beyonce and Taylor Swift for the top spot. She earned $83 million for the year. You can see the top ten below.')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(6, 1334567890, '11/26/2018', 'Katy Perry, Blake Shelton Participate in eBay For Charity', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(7, 123456789, '11/25/2018', 'Katy Perry tries to go unnoticed as she sports form-fitting sweatsuit out for a coffee', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(8, 3456789, '09/26/2018', 'Why Gisele Bündchen’s Honest Conversation About Suicide Is So Important Now', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(9, 823456789, '11/26/2018', 'Kendall Jenner Was Very Much on Girlfriend Duty for Ben Simmons This Weekend', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(10, 423456789, '11/26/2018', 'Victoria Beckham on secret first sex with David - and hiding their lusty romance from Simon Fuller', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(11, 923456789, '11/26/2018', 'Beckham £6m country mansion is raided again', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(12, 1023456789, '11/26/2018', 'Kobe Bryant Accuses Pharma Company of Slander After His Lawyer Compared NBA Star to Lil Wayne', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(13, 11456789, '11/26/2018', 'Yang Mi cannot find her husband', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(14, 3456789, '11/26/2018', 'She proposed to Yiming Fan', 'Same as title')
INSERT News (NewsID, Amountofvisit, Dateofnews, Title, Newscontent)
VALUES(15, 823456789, '11/26/2018', 'Li Landi fought with Gülnezer Bextiyar to be wife of some guy', 'Same as title')

INSERT CelebritiesNews (CID, NewsID)
VALUES(1,1)
INSERT CelebritiesNews (CID, NewsID)
VALUES(1,2)
INSERT CelebritiesNews (CID, NewsID)
VALUES(2,3)
INSERT CelebritiesNews (CID, NewsID)
VALUES(3,4)
INSERT CelebritiesNews (CID, NewsID)
VALUES(6,5)
INSERT CelebritiesNews (CID, NewsID)
VALUES(6,6)
INSERT CelebritiesNews (CID, NewsID)
VALUES(6,7)
INSERT CelebritiesNews (CID, NewsID)
VALUES(7,8)
INSERT CelebritiesNews (CID, NewsID)
VALUES(8,9)
INSERT CelebritiesNews (CID, NewsID)
VALUES(9,10)
INSERT CelebritiesNews (CID, NewsID)
VALUES(10,11)
INSERT CelebritiesNews (CID, NewsID)
VALUES(11,12)
INSERT CelebritiesNews (CID, NewsID)
VALUES(12,13)
INSERT CelebritiesNews (CID, NewsID)
VALUES(13,14)
INSERT CelebritiesNews (CID, NewsID)
VALUES(14,15)

INSERT Typesinfo (TypesID, Typesname)
VALUES(1, 'Actress')
INSERT Typesinfo (TypesID, Typesname)
VALUES(2, 'Actor')
INSERT Typesinfo (TypesID, Typesname)
VALUES(3, 'Model')
INSERT Typesinfo (TypesID, Typesname)
VALUES(4, 'Super Model')
INSERT Typesinfo (TypesID, Typesname)
VALUES(5, 'Singer')
INSERT Typesinfo (TypesID, Typesname)
VALUES(6, 'Fashion Designer')
INSERT Typesinfo (TypesID, Typesname)
VALUES(7, 'Soccer Player')
INSERT Typesinfo (TypesID, Typesname)
VALUES(8, 'Basketball Player')
INSERT Typesinfo (TypesID, Typesname)
VALUES(9, 'Instagrammer')
INSERT Typesinfo (TypesID, Typesname)
VALUES(10, 'filmmaker')

INSERT CelebritiesTypes (CID, TypesID)
VALUES (1,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (1,10)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (2,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (3,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (3,3)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (4,3)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (4,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (5,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (5,3)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (6,5)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (6,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (7,4)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (8,4)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (8,9)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (9,5)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (9,6)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (10,7)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (10,3)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (11,8)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (12,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (13,1)
INSERT CelebritiesTypes (CID, TypesID)
VALUES (14,1)

INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (1, 130, 173, 85, 50, 86)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (2, 115, 168, 81, 60, 84)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (3, 110, 165, 84, 59, 86)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (4, 145, 178, 97, 66, 94)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (5, 136, 173, 96, 66, 91)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (6, 130, 173, 91, 64, 91)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (7, 125, 180, 91, 69, 89)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (8, 118, 178, 81, 60, 86)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (9, 115, 163, 86, 58, 84)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (10, 165, 183, 107, 81.28, 100)
INSERT Figures (CID, CWeight, Height)
VALUES (11, 212, 198)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (12, 99, 168, 85, 63, 80)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (13, 100, 172, 80, 50, 81)
INSERT Figures (CID, CWeight, Height, Bust, Waist, Hips)
VALUES (14, 100, 163, 91, 55, 91)

INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (1, '', 'Brad Pitt', 'Ex-Husband')
INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (2, '', 'David Beckham', 'Husband')
INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (3, '', 'Vanessa Bryant', 'Wife')
INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (4, '', 'Ben Simmons', 'Boyfriend')
INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (5, '', 'Tom Brady', 'Husband')
INSERT Partners (PID, Bio, Pname, Relationship)
VALUES (6, '', 'David Fan', 'Boyfriend')

INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (1,1)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (9,2)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (11,3)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (8,4)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (7,5)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (12,6)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (13,6)
INSERT PartnersWhoAreCelebrities (CID, PID)
VALUES (14,6)

ALTER TABLE Works
drop column Review 
alter table Works
add Review decimal(2,1)
ALTER TABLE Works
drop column Wdescription 
alter table Works
add Wdescription varchar(MAX)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (1, 'SALT', 'A CIA agent goes on the run after a defector accuses her of being a Russian spy', '2010', 6.4, 995959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (2, 'Mr. & Mrs. Smith ', 'A bored married couple is surprised to learn that they are both assassins hired by competing agencies to kill each other.', '2005', 6.5, 99995959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (3, 'La La Land', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', '2016', 8.1, 9995959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (4, 'Saturday Night Live ', 'A famous guest host stars in parodies and sketches created by the cast of this witty show.', '1975', 8.1, 9999995959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (5, 'Harry Potter and the Sorcerer Stone', 'An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.', '2001', 7.6, 11995959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (6, 'Exposure: Sports Illustrated Swimsuit 2011', 'Exposure gives you a behind the scenes look into the creation of the highly anticipated SI Swimsuit Issue.', '2011', 8.0, 95959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (7, 'Roar', 'After a plane crash in the Amazon, Katy Perry befriends the animals and out-roars a tiger to become Queen of the Jungle.', '2013', 6.6, 8888888)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Amountofvisit)
VALUES (8, 'Versace: Spring/Summer 2019 at Milan Fashion Week', '', '', 95959)
INSERT Works (WorkID, Wname, Wdescription, DateofPublished, Review, Amountofvisit)
VALUES (9, 'Learning to Fly', 'Discover the truth behind the headlines in Victoria Beckham fascinating memoir', '08/03/2014', 8.2, 12123)
UPDATE Works
set Review = 6.4
Where WorkID = 1
UPDATE Works
set Review = 6.5
Where WorkID = 2
UPDATE Works
set Review = 8.1
Where WorkID = 3
UPDATE Works
set Review = 8.4
Where WorkID = 4
UPDATE Works
set Review = 7.6
Where WorkID = 5
UPDATE Works
set Review = 8.0
Where WorkID = 6
UPDATE Works
set Review = 6.6
Where WorkID = 7
UPDATE Works
set Review = 8.2
Where WorkID = 9
INSERT RelatedCelebrities (CID, WorkID)
VALUES (1, 1)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (1, 2)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (2, 3)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (2, 4)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (3, 5)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (4, 6)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (6, 7)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (8, 8)
INSERT RelatedCelebrities (CID, WorkID)
VALUES (9, 9)

INSERT Formats(Ftype)
VALUES('MOVIE')
INSERT Formats(Ftype)
VALUES('TV SHOWS')
INSERT Formats(Ftype)
VALUES('DOCUMENTARY')
INSERT Formats(Ftype)
VALUES('SONG')
INSERT Formats(Ftype)
VALUES('SHORT VIDEO')
INSERT Formats(Ftype)
VALUES('BOOK')

INSERT Publishers(Pname)
VALUES('Columbia Pictures Corporation')
INSERT Publishers(Pname)
VALUES('Regency Enterprises')
INSERT Publishers(Pname)
VALUES('Summit Entertainment')
INSERT Publishers(Pname)
VALUES('NBC Studios')
INSERT Publishers(Pname)
VALUES('Warner Bros')
INSERT Publishers(Pname)
VALUES('Chaos Films')
INSERT Publishers(Pname)
VALUES('Motion Theory')
INSERT Publishers(Pname)
VALUES('Penguin Global')

INSERT WorkFormats(WorkID,Ftype)
VALUES(1,'MOVIE')
INSERT WorkFormats(WorkID,Ftype)
VALUES(2,'MOVIE')
INSERT WorkFormats(WorkID,Ftype)
VALUES(3,'MOVIE')
INSERT WorkFormats(WorkID,Ftype)
VALUES(4,'TV SHOWS')
INSERT WorkFormats(WorkID,Ftype)
VALUES(5,'MOVIE')
INSERT WorkFormats(WorkID,Ftype)
VALUES(6,'DOCUMENTARY')
INSERT WorkFormats(WorkID,Ftype)
VALUES(7,'SONG')
INSERT WorkFormats(WorkID,Ftype)
VALUES(8,'SHORT VIDEO')
INSERT WorkFormats(WorkID,Ftype)
VALUES(9,'BOOK')

INSERT WorkPublishers(WorkID,Pname)
VALUES (1,'Columbia Pictures Corporation')
INSERT WorkPublishers(WorkID,Pname)
VALUES (2,'Regency Enterprises')
INSERT WorkPublishers(WorkID,Pname)
VALUES (3,'Summit Entertainment')
INSERT WorkPublishers(WorkID,Pname)
VALUES (4,'NBC Studios')
INSERT WorkPublishers(WorkID,Pname)
VALUES (5,'Warner Bros')
INSERT WorkPublishers(WorkID,Pname)
VALUES (6,'Chaos Films')
INSERT WorkPublishers(WorkID,Pname)
VALUES (7,'Motion Theory')
INSERT WorkPublishers(WorkID,Pname)
VALUES (9,'Penguin Global')

alter table Agents
drop column Startdate
alter table CelebritiesAgents
add Startdate date 

UPDATE CelebritiesAgents
SET Startdate = '06/01/2014'
WHERE CID = 1
UPDATE CelebritiesAgents
SET Startdate = '01/01/2001'
WHERE CID = 2
UPDATE CelebritiesAgents
SET Startdate = '06/22/2004'
WHERE CID = 3
UPDATE CelebritiesAgents
SET Startdate = '11/01/1994'
WHERE CID = 4
UPDATE CelebritiesAgents
SET Startdate = '10/22/1991'
WHERE CID = 5
UPDATE CelebritiesAgents
SET Startdate = '10/17/2011'
WHERE CID = 6
UPDATE CelebritiesAgents
SET Startdate = '06/01/1992'
WHERE CID = 7
UPDATE CelebritiesAgents
SET Startdate = '12/01/2017'
WHERE CID = 8
UPDATE CelebritiesAgents
SET Startdate = '05/01/1999'
WHERE CID = 9
UPDATE CelebritiesAgents
SET Startdate = '03/01/2015'
WHERE CID = 10
UPDATE CelebritiesAgents
SET Startdate = '11/01/2018'
WHERE CID = 11
UPDATE CelebritiesAgents
SET Startdate = '04/11/2008'
WHERE CID = 12
UPDATE CelebritiesAgents
SET Startdate = '06/01/2009'
WHERE CID = 13
UPDATE CelebritiesAgents
SET Startdate = '02/14/2016'
WHERE CID = 14

alter table CelebritiesAgents
alter column Startdate date not null
alter table Partners
drop column Relationship
alter table PartnersWhoAreCelebrities
add Relationship varchar(50) 

UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Ex-Husband'
WHERE PID = 1
UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Husband'
WHERE PID = 2
UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Wife'
WHERE PID = 3
UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Boyfriend'
WHERE PID = 4
UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Husband'
WHERE PID = 5
UPDATE PartnersWhoAreCelebrities
SET Relationship = 'Boyfriend'
WHERE PID = 6

alter table PartnersWhoAreCelebrities
alter column Relationship varchar(50) not null

INSERT Partners(PID,Pname)     
VALUES(7, 'MC.HOT DOG')
INSERT Partners(PID,Pname)
VALUES(8, 'Katy Upton')
INSERT Partners(PID,Pname)
VALUES(9, 'Frank Banana')

INSERT PartnersWhoAreCelebrities(PID,CID,Relationship) 
VALUES(7,1, 'Husband')
INSERT PartnersWhoAreCelebrities(PID,CID,Relationship)
VALUES(8,2, 'Girlfriend')
INSERT PartnersWhoAreCelebrities(PID,CID,Relationship)
VALUES(9,8, 'Husband')

alter table Awards
drop column Awardwinningtimes
alter table CelebritiesAward
add Awardwinningtimes smallint

UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 1
UPDATE CelebritiesAward
SET Awardwinningtimes = 2
WHERE AwardsID = 2
UPDATE CelebritiesAward
SET Awardwinningtimes = 3
WHERE AwardsID = 3
UPDATE CelebritiesAward
SET Awardwinningtimes = 4
WHERE AwardsID = 4
UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 5
UPDATE CelebritiesAward
SET Awardwinningtimes = 5
WHERE AwardsID = 6
UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 7
UPDATE CelebritiesAward
SET Awardwinningtimes = ''
WHERE AwardsID = 8
UPDATE CelebritiesAward
SET Awardwinningtimes = 2
WHERE AwardsID = 9
UPDATE CelebritiesAward
SET Awardwinningtimes = 2
WHERE AwardsID = 10
UPDATE CelebritiesAward
SET Awardwinningtimes = 4
WHERE AwardsID = 11
UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 12
UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 13
UPDATE CelebritiesAward
SET Awardwinningtimes = 6
WHERE AwardsID = 14
UPDATE CelebritiesAward
SET Awardwinningtimes = 5
WHERE AwardsID = 15
UPDATE CelebritiesAward
SET Awardwinningtimes = 2
WHERE AwardsID = 16
UPDATE CelebritiesAward
SET Awardwinningtimes = 1
WHERE AwardsID = 17

alter table CelebritiesAward
alter column Awardwinningtimes smallint not null
alter table celebritiesinfos
add Dateaddinsystem date

UPDATE celebritiesinfos
SET Dateaddinsystem = '06/01/1992'
WHERE CID = 1
UPDATE celebritiesinfos
SET Dateaddinsystem = '01/01/2002'
WHERE CID = 2
UPDATE celebritiesinfos
SET Dateaddinsystem = '07/01/1996'
WHERE CID = 3
UPDATE celebritiesinfos
SET Dateaddinsystem = '12/11/2012'
WHERE CID = 4
UPDATE celebritiesinfos
SET Dateaddinsystem = '03/31/2008'
WHERE CID = 5
UPDATE celebritiesinfos
SET Dateaddinsystem = '09/22/2004'
WHERE CID = 6
UPDATE celebritiesinfos
SET Dateaddinsystem = '08/13/1998'
WHERE CID = 7
UPDATE celebritiesinfos
SET Dateaddinsystem = '10/22/2005'
WHERE CID = 8
UPDATE celebritiesinfos
SET Dateaddinsystem = '03/31/1980'
WHERE CID = 9
UPDATE celebritiesinfos
SET Dateaddinsystem = '09/01/1990'
WHERE CID = 10
UPDATE celebritiesinfos
SET Dateaddinsystem = '09/11/1996'
WHERE CID = 11
UPDATE celebritiesinfos
SET Dateaddinsystem = '06/01/2012'
WHERE CID = 12
UPDATE celebritiesinfos
SET Dateaddinsystem = '06/01/2013'
WHERE CID = 13
UPDATE celebritiesinfos
SET Dateaddinsystem = '06/01/2018'
WHERE CID = 14

alter table celebritiesinfos
alter column Dateaddinsystem date not null

alter table News
add Amountofread bigint
alter table Works
add Amountofviews bigint

UPDATE News
SET Amountofread = 12345678934	
WHERE NewsID = 1
UPDATE News
SET Amountofread = 1234567890
WHERE NewsID = 2
UPDATE News
SET Amountofread = 123456784545
WHERE NewsID = 3
UPDATE News
SET Amountofread = 3446677674
WHERE NewsID = 4
UPDATE News
SET Amountofread = 287428379
WHERE NewsID = 5
UPDATE News
SET Amountofread = 67893748539
WHERE NewsID = 6
UPDATE News
SET Amountofread = 23429837324
WHERE NewsID = 7
UPDATE News
SET Amountofread = 83758473898302
WHERE NewsID = 8
UPDATE News
SET Amountofread = 4534837584
WHERE NewsID = 9
UPDATE News
SET Amountofread = 2323902909
WHERE NewsID = 10
UPDATE News
SET Amountofread = 13246567676
WHERE NewsID = 11
UPDATE News
SET Amountofread = 43534534543453
WHERE NewsID = 12
UPDATE News
SET Amountofread = 2342343253
WHERE NewsID = 13
UPDATE News
SET Amountofread = 232345454545454
WHERE NewsID = 14
UPDATE News
SET Amountofread = 12123434343434
WHERE NewsID = 15

alter table News
alter column Amountofread bigint not null
alter table News
drop column Amountofvisit

UPDATE Works
SET Amountofviews = 2342734827
WHERE WorkID = 1
UPDATE Works
SET Amountofviews = 4552342432234
WHERE WorkID = 2
UPDATE Works
SET Amountofviews = 5453453455
WHERE WorkID = 3
UPDATE Works
SET Amountofviews = 34523242342
WHERE WorkID = 4
UPDATE Works
SET Amountofviews = 4545456233443
WHERE WorkID = 5
UPDATE Works
SET Amountofviews = 24234234
WHERE WorkID = 6
UPDATE Works
SET Amountofviews = 23232234212313
WHERE WorkID = 7
UPDATE Works
SET Amountofviews = 4545233
WHERE WorkID = 8
UPDATE Works
SET Amountofviews = 234124
WHERE WorkID = 9

ALTER TABLE Works
alter column Amountofviews bigint not null
alter table Works
drop column Amountofvisit

INSERT News(NewsID,Dateofnews,Title,Amountofread)
VALUES(16,'11/29/2018','Kate Upton likes to drink ice coffee to lose weight', 5421214587)
INSERT CelebritiesNews (CID,NewsID)
VALUES (4,16)

select COUNT(CID) Count_of_celebrities_visit_amout_over_avg, Amountofvisit
from celebritiesinfos c
where Amountofvisit > (select AVG(Amountofvisit) from celebritiesinfos)
group by Amountofvisit

select Nationalities, COUNT(CID) Amount   
from celebritiesinfos
group by Nationalities

SELECT Cname, Typesname, Awname, Awardwinningtimes
from celebritiesinfos ci
join CelebritiesAward ca on ci.CID = ca.CID
join Awards a on ca.AwardsID = a.AwardsID
join CelebritiesTypes ct on ct.CID = ci.CID
join Typesinfo t on t.TypesID = ct.TypesID
WHERE Awname <> 'NONE'
AND Typesname = 'Actress'
order by Awardwinningtimes desc

select	c.Cname, c.Nationalities, n.Title, n.Amountofread  
from CelebritiesNews cn
INNER JOIN celebritiesinfos c ON cn.CID = c.CID
INNER Join News n ON cn.NewsID = n.NewsID
where Nationalities = 'china'
order by Amountofread DESC

select	Cname,
		Title,
		Amountofread,
		Lastcommercialadspaid
FROM celebritiesinfos c
right join CelebritiesNews cn on cn.CID = c.CID
right join News n on n.NewsID = cn.NewsID
where Title like '%coffee%'
ORDER BY Amountofread DESC

SELECT Cname, Lastcommercialadspaid
FROM celebritiesinfos c
inner join (select CID from Figures where Bust > 85) B
on B.CID = c.CID
inner join CelebritiesTypes ct on ct.CID = c.CID
inner join Typesinfo t on t.TypesID = ct.TypesID
where Typesname = 'actress'
order by Lastcommercialadspaid ASC


select	Cname,
		Dateaddinsystem,
		DATEDIFF(day, Dateaddinsystem, GETDATE()) Days_to_be_a_celebrities,
		Amountofvisit,
		Amountofvisit / DATEDIFF(day, Dateaddinsystem, GETDATE()) Career_hot_remain
from celebritiesinfos c
ORDER BY Career_hot_remain DESC

select Cname,
	   Amountofread 
from celebritiesinfos c
right join CelebritiesNews cn on cn.CID = c.CID
right join News n on n.NewsID = cn.NewsID
where Amountofread > (select AVG(Amountofread) from News)
order by Amountofread desc

