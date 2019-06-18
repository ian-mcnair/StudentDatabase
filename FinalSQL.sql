#Ian McNair
#Simple School Management Database
CREATE DATABASE school_db;
GRANT ALL PRIVILEGES ON school_db.* TO 'student'@'localhost';
FLUSH PRIVILEGES;
USE school_db;

CREATE TABLE users(
id varchar(255) PRIMARY KEY,
username varchar(255) NOT NULL,
pword longtext NOT NULL,
fname varchar(255),
lname varchar(255),
gender varchar(255),
address varchar(255),
city varchar(255),
stat varchar (255)
);

CREATE TABLE staff(
staffid varchar(255) PRIMARY KEY,
department varchar(255),
title varchar(255),
salary varchar(255),
FOREIGN KEY(staffid) references users(id)
ON DELETE CASCADE 
);

CREATE TABLE student(
studentid varchar(255) PRIMARY KEY,
gradDate varchar(255),
FOREIGN KEY(studentid) references users(id)
ON DELETE CASCADE 
);


CREATE TABLE enrollment(
id varchar(255),
courseid varchar(255),
period varchar(255),
grade varchar(255),
PRIMARY KEY(id,courseid),
FOREIGN KEY(id) references users(id)
ON DELETE CASCADE,
INDEX(id,courseid) 
);
######################################################
#This trigger creates an ID in the appropriate tables#
#after new person is added to user entity            #
######################################################
delimiter $$
CREATE TRIGGER new_person_creation
AFTER INSERT ON users FOR EACH ROW
BEGIN
	IF NEW.id > 899
    THEN INSERT INTO staff(staffid) VALUES (new.id);
    ELSE INSERT INTO student(studentid) VALUES(new.id);
    END IF;
END $$
delimiter ;;

#########################################
#THE BELOW CREATES ALL THE DATA IN ORDER#
#########################################
INSERT INTO users VALUE('999','jdoe',SHA('jdoe'),'John','Doe','M','123 Neiu Dr','Chicago','Staff');
INSERT INTO users VALUE('100','CJulius',SHA('8T1IAcsu'),'Cedric','Julius','M','2233 Cecil Street','Chicago','Student');
INSERT INTO users VALUE('101','CMclin',SHA('pGqk9A6W'),'Carlo','Mclin','M','4996 Horizon Circle','Chicago','Student');
INSERT INTO users VALUE('102','MEgbert',SHA('tDM3K216'),'Mozella','Egbert','F','2159 Hillview Drive','Chicago','Student');
INSERT INTO users VALUE('103','JHaygood',SHA('G21HyVT5'),'Joetta','Haygood','F','4045 Norma Avenue','Chicago','Student');
INSERT INTO users VALUE('104','JMaultsby',SHA('XtUf4wty'),'Jenine','Maultsby','F','998 Wolf Pen Road','Chicago','Student');
INSERT INTO users VALUE('105','MHoch',SHA('S5uXCqUw'),'Micheline','Hoch','F','1853 Edgewood Road','Chicago','Student');
INSERT INTO users VALUE('106','NThan',SHA('SMyO4NRt'),'Nieves','Than','M','2884 Wines Lane','Chicago','Student');
INSERT INTO users VALUE('107','MFarquharson',SHA('41JXcq0i'),'Millard','Farquharson','M','275 Pinewood Drive','Chicago','Student');
INSERT INTO users VALUE('108','EAxley',SHA('FYFkm5vV'),'Eufemia','Axley','F','2458 Custer Street','Chicago','Student');
INSERT INTO users VALUE('109','FEpstein',SHA('jm772wDz'),'Francesco','Epstein','M','1560 Gore Street','Chicago','Student');
INSERT INTO users VALUE('110','JPhair',SHA('fx9Nwasu'),'Juliann','Phair','F','3567 Hall Place','Chicago','Student');
INSERT INTO users VALUE('111','LBockman',SHA('c0nv5cAz'),'Liberty','Bockman','F','4319 August Lane','Chicago','Student');
INSERT INTO users VALUE('112','VDycus',SHA('yUcl1st1'),'Vina','Dycus','F','939 Briarhill Lane','Chicago','Student');
INSERT INTO users VALUE('113','SAvey',SHA('aMN5cvS0'),'Shonda','Avey','F','872 Davis Place','Chicago','Student');
INSERT INTO users VALUE('114','EDurrell',SHA('k3vc7TKK'),'Edda','Durrell','F','226 Junkins Avenue','Chicago','Student');
INSERT INTO users VALUE('115','GGillman',SHA('a5nIYPJP'),'Gaynelle','Gillman','M','3294 Capitol Avenue','Chicago','Student');
INSERT INTO users VALUE('116','STibbits',SHA('IcvCRcaL'),'Suzanne','Tibbits','F','1728 Kennedy Court','Chicago','Student');
INSERT INTO users VALUE('117','RBottomley',SHA('GZ7j2xYg'),'Rita','Bottomley','F','2656 Cunningham Court','Chicago','Student');
INSERT INTO users VALUE('118','GBlakeman',SHA('ZMB2HFj3'),'Garfield','Blakeman','M','4428 Lake Forest Drive','Chicago','Student');
INSERT INTO users VALUE('119','WCharlie',SHA('egv3PAto'),'Wade','Charlie','M','1071 Clay Lick Road','Chicago','Student');
INSERT INTO users VALUE('120','KJaggers',SHA('E2RWlf1L'),'Kareen','Jaggers','F','143 James Street','Chicago','Student');
INSERT INTO users VALUE('121','SPelzer',SHA('FRfP7DTn'),'Sierra','Pelzer','F','3756 Beeghley Street','Chicago','Student');
INSERT INTO users VALUE('122','DGood',SHA('r2Pv1h1R'),'Dorene','Good','M','270 Burke Street','Chicago','Student');
INSERT INTO users VALUE('123','BResendiz',SHA('TmuM3OwH'),'Boris','Resendiz','M','514 Little Acres Lane','Chicago','Student');
INSERT INTO users VALUE('124','JOrmsby',SHA('DSEVDdT9'),'Jimmy','Ormsby','M','4838 Kessla Way','Chicago','Student');
INSERT INTO users VALUE('125','KWaren',SHA('R53RPFTi'),'Kerrie','Waren','F','4462 Berkshire Circle','Chicago','Student');
INSERT INTO users VALUE('126','BSegovia',SHA('EGVa4i3R'),'Bert','Segovia','M','4876 Little Street','Chicago','Student');
INSERT INTO users VALUE('127','PPella',SHA('2ILwkIoS'),'Phyliss','Pella','F','1996 Sunburst Drive','Chicago','Student');
INSERT INTO users VALUE('128','ECarlon',SHA('ehjRweJQ'),'Esperanza','Carlon','F','1894 Ersel Street','Chicago','Student');
INSERT INTO users VALUE('129','BWishart',SHA('Mua02htD'),'Bonny','Wishart','F','799 Hickory Lane','Chicago','Student');
INSERT INTO users VALUE('130','LOgan',SHA('Ky6JZq6B'),'Luigi','Ogan','M','2720 Burnside Avenue','Chicago','Student');
INSERT INTO users VALUE('131','RWickert',SHA('YRCch7pB'),'Renaldo','Wickert','M','4391 Rubaiyat Road','Chicago','Student');
INSERT INTO users VALUE('132','ANay',SHA('gTnnsxhn'),'Annice','Nay','F','1154 Ryder Avenue','Chicago','Student');
INSERT INTO users VALUE('133','EAiken',SHA('bzvUnQ5j'),'Elaine','Aiken','F','1124 Hartway Street','Chicago','Student');
INSERT INTO users VALUE('134','RRedmond',SHA('pjpwUFvN'),'Raymonde','Redmond','M','3521 Freedom Lane','Chicago','Student');
INSERT INTO users VALUE('135','DBaumann',SHA('9Cjt93HJ'),'Dedra','Baumann','F','4133 Filbert Street','Chicago','Student');
INSERT INTO users VALUE('136','VKnapper',SHA('CL9PKx9D'),'Vikki','Knapper','F','2961 Wexford Way','Chicago','Student');
INSERT INTO users VALUE('137','ACrudup',SHA('sDaenigX'),'Alaine','Crudup','M','1436 Oakwood Circle','Chicago','Student');
INSERT INTO users VALUE('138','RWakeland',SHA('ZquOjiRt'),'Reynalda','Wakeland','F','3409 Thorn Street','Chicago','Student');
INSERT INTO users VALUE('139','ZKyle',SHA('wuLYJCim'),'Zula','Kyle','F','616 Oakmound Road','Chicago','Student');
INSERT INTO users VALUE('140','KPratt',SHA('oXGGkjnI'),'Kanisha','Pratt','F','2192 Chandler Drive','Chicago','Student');
INSERT INTO users VALUE('141','SElls',SHA('81fvpsJp'),'Shirley','Ells','F','3939 Monroe Avenue','Chicago','Student');
INSERT INTO users VALUE('142','MWalrath',SHA('diVzPlvJ'),'Merrilee','Walrath','F','528 Martha Street','Chicago','Student');
INSERT INTO users VALUE('143','ZErickson',SHA('1EFaBsuJ'),'Zada','Erickson','M','3938 Linden Avenue','Chicago','Student');
INSERT INTO users VALUE('144','MLande',SHA('JjUDuZJv'),'Marcos','Lande','M','2302 Shinn Street','Chicago','Student');
INSERT INTO users VALUE('145','LRouse',SHA('8TIoChwg'),'Louis','Rouse','M','4053 Reel Avenue','Chicago','Student');
INSERT INTO users VALUE('146','KPriestly',SHA('Tf5UE8gG'),'Katrina','Priestly','F','774 Agriculture Lane','Chicago','Student');
INSERT INTO users VALUE('147','SLambeth',SHA('g6IVUlsj'),'Stephan','Lambeth','M','1790 Lincoln Drive','Chicago','Student');
INSERT INTO users VALUE('148','NBurriss',SHA('kUgvy7lU'),'Nicola','Burriss','F','4978 American Drive','Chicago','Student');
INSERT INTO users VALUE('149','AGordon',SHA('1StlwArY'),'Adam','Gordon','M','3599 Aviation Way','Chicago','Student');
INSERT INTO users VALUE('911','IMcNair',SHA('c0nv5cAz'),'Ian','McNair','M','4066 Hillcrest Avenue','Chicago','Staff');
INSERT INTO users VALUE('912','SDemeo',SHA('yUcl1st1'),'Sharri','Demeo','F','3469 Beechwood Drive','Chicago','Staff');
INSERT INTO users VALUE('913','DDollins',SHA('aMN5cvS0'),'Doloris','Dollins','F','3082 Richards Avenue','Chicago','Staff');
INSERT INTO users VALUE('914','RHungerford',SHA('k3vc7TKK'),'Rigoberto','Hungerford','M','1150 Rainbow Drive','Chicago','Staff');
INSERT INTO users VALUE('915','KMorrone',SHA('a5nIYPJP'),'Kym','Morrone','F','1764 White Lane','Chicago','Staff');
INSERT INTO users VALUE('916','STillett',SHA('IcvCRcaL'),'Shaquana','Tillett','F','201 Burke Street','Chicago','Staff');
INSERT INTO users VALUE('917','CZhang',SHA('GZ7j2xYg'),'Cindy','Zhang','F','4066 Hillcrest Avenue','Chicago','Staff');
INSERT INTO users VALUE('918','AHardeman',SHA('ZMB2HFj3'),'Adan','Hardeman','M','201 Burke Street','Chicago','Staff');

INSERT INTO enrollment VALUE('100','S100','1','A');
INSERT INTO enrollment VALUE('101','S100','1','A');
INSERT INTO enrollment VALUE('102','S100','1','B');
INSERT INTO enrollment VALUE('103','S100','1','B');
INSERT INTO enrollment VALUE('104','S100','1','C');
INSERT INTO enrollment VALUE('105','S100','1','D');
INSERT INTO enrollment VALUE('106','S100','1','F');
INSERT INTO enrollment VALUE('107','S100','1','F');
INSERT INTO enrollment VALUE('108','S100','1','A');
INSERT INTO enrollment VALUE('109','S100','1','A');
INSERT INTO enrollment VALUE('110','S100','1','B');
INSERT INTO enrollment VALUE('111','S100','1','C');
INSERT INTO enrollment VALUE('112','S100','1','D');
INSERT INTO enrollment VALUE('113','S100','1','F');
INSERT INTO enrollment VALUE('114','S100','1','F');
INSERT INTO enrollment VALUE('115','S100','1','A');
INSERT INTO enrollment VALUE('116','S100','1','A');
INSERT INTO enrollment VALUE('117','S100','1','A');
INSERT INTO enrollment VALUE('118','S100','1','A');
INSERT INTO enrollment VALUE('119','S100','1','B');
INSERT INTO enrollment VALUE('120','S100','1','B');
INSERT INTO enrollment VALUE('121','S100','1','A');
INSERT INTO enrollment VALUE('122','S100','1','A');
INSERT INTO enrollment VALUE('123','S100','1','B');
INSERT INTO enrollment VALUE('124','S100','1','C');
INSERT INTO enrollment VALUE('125','S200','6','D');
INSERT INTO enrollment VALUE('126','S200','6','A');
INSERT INTO enrollment VALUE('127','S200','6','A');
INSERT INTO enrollment VALUE('128','S200','6','B');
INSERT INTO enrollment VALUE('129','S200','6','B');
INSERT INTO enrollment VALUE('130','S200','6','C');
INSERT INTO enrollment VALUE('131','S200','6','D');
INSERT INTO enrollment VALUE('132','S200','6','F');
INSERT INTO enrollment VALUE('133','S200','6','F');
INSERT INTO enrollment VALUE('134','S200','6','A');
INSERT INTO enrollment VALUE('135','S200','6','A');
INSERT INTO enrollment VALUE('136','S200','6','B');
INSERT INTO enrollment VALUE('137','S200','6','C');
INSERT INTO enrollment VALUE('138','S200','6','D');
INSERT INTO enrollment VALUE('139','S200','6','F');
INSERT INTO enrollment VALUE('140','S200','6','F');
INSERT INTO enrollment VALUE('141','S200','6','A');
INSERT INTO enrollment VALUE('142','S200','6','A');
INSERT INTO enrollment VALUE('143','S200','6','B');
INSERT INTO enrollment VALUE('144','S200','6','C');
INSERT INTO enrollment VALUE('145','S200','6','D');
INSERT INTO enrollment VALUE('146','S200','6','F');
INSERT INTO enrollment VALUE('147','S200','6','F');
INSERT INTO enrollment VALUE('148','S200','6','A');
INSERT INTO enrollment VALUE('149','S200','6','A');
INSERT INTO enrollment VALUE('100','E100','2','F');
INSERT INTO enrollment VALUE('101','E100','2','A');
INSERT INTO enrollment VALUE('102','E100','2','A');
INSERT INTO enrollment VALUE('103','E100','2','B');
INSERT INTO enrollment VALUE('104','E100','2','C');
INSERT INTO enrollment VALUE('105','E100','2','D');
INSERT INTO enrollment VALUE('106','E100','2','F');
INSERT INTO enrollment VALUE('107','E100','2','F');
INSERT INTO enrollment VALUE('108','E100','2','A');
INSERT INTO enrollment VALUE('109','E100','2','A');
INSERT INTO enrollment VALUE('110','E100','2','F');
INSERT INTO enrollment VALUE('111','E100','2','F');
INSERT INTO enrollment VALUE('112','E100','2','A');
INSERT INTO enrollment VALUE('113','E100','2','A');
INSERT INTO enrollment VALUE('114','E100','2','B');
INSERT INTO enrollment VALUE('115','E100','2','C');
INSERT INTO enrollment VALUE('116','E100','2','D');
INSERT INTO enrollment VALUE('117','E100','2','F');
INSERT INTO enrollment VALUE('118','E100','2','F');
INSERT INTO enrollment VALUE('119','E100','2','A');
INSERT INTO enrollment VALUE('120','E100','2','A');
INSERT INTO enrollment VALUE('121','E100','2','B');
INSERT INTO enrollment VALUE('122','E100','2','A');
INSERT INTO enrollment VALUE('123','E100','2','A');
INSERT INTO enrollment VALUE('124','E100','2','A');
INSERT INTO enrollment VALUE('125','E200','5','A');
INSERT INTO enrollment VALUE('126','E200','5','B');
INSERT INTO enrollment VALUE('127','E200','5','B');
INSERT INTO enrollment VALUE('128','E200','5','A');
INSERT INTO enrollment VALUE('129','E200','5','A');
INSERT INTO enrollment VALUE('130','E200','5','B');
INSERT INTO enrollment VALUE('131','E200','5','F');
INSERT INTO enrollment VALUE('132','E200','5','A');
INSERT INTO enrollment VALUE('133','E200','5','A');
INSERT INTO enrollment VALUE('134','E200','5','B');
INSERT INTO enrollment VALUE('135','E200','5','C');
INSERT INTO enrollment VALUE('136','E200','5','D');
INSERT INTO enrollment VALUE('137','E200','5','F');
INSERT INTO enrollment VALUE('138','E200','5','F');
INSERT INTO enrollment VALUE('139','E200','5','A');
INSERT INTO enrollment VALUE('140','E200','5','A');
INSERT INTO enrollment VALUE('141','E200','5','F');
INSERT INTO enrollment VALUE('142','E200','5','A');
INSERT INTO enrollment VALUE('143','E200','5','A');
INSERT INTO enrollment VALUE('144','E200','5','B');
INSERT INTO enrollment VALUE('145','E200','5','C');
INSERT INTO enrollment VALUE('146','E200','5','A');
INSERT INTO enrollment VALUE('147','E200','5','A');
INSERT INTO enrollment VALUE('148','E200','5','A');
INSERT INTO enrollment VALUE('149','E200','5','A');
INSERT INTO enrollment VALUE('100','M100','4','A');
INSERT INTO enrollment VALUE('101','M100','4','A');
INSERT INTO enrollment VALUE('102','M100','4','B');
INSERT INTO enrollment VALUE('103','M100','4','C');
INSERT INTO enrollment VALUE('104','M100','4','A');
INSERT INTO enrollment VALUE('105','M100','4','A');
INSERT INTO enrollment VALUE('106','M100','4','A');
INSERT INTO enrollment VALUE('107','M100','4','A');
INSERT INTO enrollment VALUE('108','M100','4','A');
INSERT INTO enrollment VALUE('109','M100','4','A');
INSERT INTO enrollment VALUE('110','M100','4','B');
INSERT INTO enrollment VALUE('111','M100','4','A');
INSERT INTO enrollment VALUE('112','M100','4','A');
INSERT INTO enrollment VALUE('113','M100','4','A');
INSERT INTO enrollment VALUE('114','M100','4','A');
INSERT INTO enrollment VALUE('115','M100','4','B');
INSERT INTO enrollment VALUE('116','M100','4','B');
INSERT INTO enrollment VALUE('117','M100','4','A');
INSERT INTO enrollment VALUE('118','M100','4','A');
INSERT INTO enrollment VALUE('119','M100','4','B');
INSERT INTO enrollment VALUE('120','M100','4','F');
INSERT INTO enrollment VALUE('121','M100','4','A');
INSERT INTO enrollment VALUE('122','M100','4','A');
INSERT INTO enrollment VALUE('123','M100','4','B');
INSERT INTO enrollment VALUE('124','M100','4','C');
INSERT INTO enrollment VALUE('100','Lunch3','3','');
INSERT INTO enrollment VALUE('101','Lunch3','3','');
INSERT INTO enrollment VALUE('102','Lunch3','3','');
INSERT INTO enrollment VALUE('103','Lunch3','3','');
INSERT INTO enrollment VALUE('104','Lunch3','3','');
INSERT INTO enrollment VALUE('105','Lunch3','3','');
INSERT INTO enrollment VALUE('106','Lunch3','3','');
INSERT INTO enrollment VALUE('107','Lunch3','3','');
INSERT INTO enrollment VALUE('108','Lunch3','3','');
INSERT INTO enrollment VALUE('109','Lunch3','3','');
INSERT INTO enrollment VALUE('110','Lunch3','3','');
INSERT INTO enrollment VALUE('111','Lunch3','3','');
INSERT INTO enrollment VALUE('112','Lunch3','3','');
INSERT INTO enrollment VALUE('113','Lunch3','3','');
INSERT INTO enrollment VALUE('114','Lunch3','3','');
INSERT INTO enrollment VALUE('115','Lunch3','3','');
INSERT INTO enrollment VALUE('116','Lunch3','3','');
INSERT INTO enrollment VALUE('117','Lunch3','3','');
INSERT INTO enrollment VALUE('118','Lunch3','3','');
INSERT INTO enrollment VALUE('119','Lunch3','3','');
INSERT INTO enrollment VALUE('120','Lunch3','3','');
INSERT INTO enrollment VALUE('121','Lunch3','3','');
INSERT INTO enrollment VALUE('122','Lunch3','3','');
INSERT INTO enrollment VALUE('123','Lunch3','3','');
INSERT INTO enrollment VALUE('124','Lunch3','3','');
INSERT INTO enrollment VALUE('100','CS100','5','A');
INSERT INTO enrollment VALUE('101','CS100','5','A');
INSERT INTO enrollment VALUE('102','CS100','5','A');
INSERT INTO enrollment VALUE('103','CS100','5','B');
INSERT INTO enrollment VALUE('104','CS100','5','B');
INSERT INTO enrollment VALUE('105','CS100','5','A');
INSERT INTO enrollment VALUE('106','CS100','5','A');
INSERT INTO enrollment VALUE('107','CS100','5','B');
INSERT INTO enrollment VALUE('108','CS100','5','F');
INSERT INTO enrollment VALUE('109','CS100','5','A');
INSERT INTO enrollment VALUE('110','CS100','5','A');
INSERT INTO enrollment VALUE('111','CS100','5','B');
INSERT INTO enrollment VALUE('112','CS100','5','C');
INSERT INTO enrollment VALUE('113','CS100','5','D');
INSERT INTO enrollment VALUE('114','CS100','5','F');
INSERT INTO enrollment VALUE('115','CS100','5','A');
INSERT INTO enrollment VALUE('116','CS100','5','A');
INSERT INTO enrollment VALUE('117','CS100','5','F');
INSERT INTO enrollment VALUE('118','CS100','5','A');
INSERT INTO enrollment VALUE('119','CS100','5','A');
INSERT INTO enrollment VALUE('120','CS100','5','B');
INSERT INTO enrollment VALUE('121','CS100','5','C');
INSERT INTO enrollment VALUE('122','CS100','5','A');
INSERT INTO enrollment VALUE('123','CS100','5','A');
INSERT INTO enrollment VALUE('124','CS100','5','A');
INSERT INTO enrollment VALUE('100','L100','6','A');
INSERT INTO enrollment VALUE('101','L100','6','A');
INSERT INTO enrollment VALUE('102','L100','6','A');
INSERT INTO enrollment VALUE('103','L100','6','B');
INSERT INTO enrollment VALUE('104','L100','6','C');
INSERT INTO enrollment VALUE('105','L100','6','A');
INSERT INTO enrollment VALUE('106','L100','6','A');
INSERT INTO enrollment VALUE('107','L100','6','A');
INSERT INTO enrollment VALUE('108','L100','6','A');
INSERT INTO enrollment VALUE('109','L100','6','A');
INSERT INTO enrollment VALUE('110','L100','6','A');
INSERT INTO enrollment VALUE('111','L100','6','B');
INSERT INTO enrollment VALUE('112','L100','6','A');
INSERT INTO enrollment VALUE('113','L100','6','A');
INSERT INTO enrollment VALUE('114','L100','6','A');
INSERT INTO enrollment VALUE('115','L100','6','A');
INSERT INTO enrollment VALUE('116','L100','6','B');
INSERT INTO enrollment VALUE('117','L100','6','B');
INSERT INTO enrollment VALUE('118','L100','6','A');
INSERT INTO enrollment VALUE('119','L100','6','A');
INSERT INTO enrollment VALUE('120','L100','6','B');
INSERT INTO enrollment VALUE('121','L100','6','F');
INSERT INTO enrollment VALUE('122','L100','6','A');
INSERT INTO enrollment VALUE('123','L100','6','A');
INSERT INTO enrollment VALUE('124','L100','6','B');
INSERT INTO enrollment VALUE('125','M200','3','A');
INSERT INTO enrollment VALUE('126','M200','3','A');
INSERT INTO enrollment VALUE('127','M200','3','A');
INSERT INTO enrollment VALUE('128','M200','3','A');
INSERT INTO enrollment VALUE('129','M200','3','B');
INSERT INTO enrollment VALUE('130','M200','3','C');
INSERT INTO enrollment VALUE('131','M200','3','A');
INSERT INTO enrollment VALUE('132','M200','3','A');
INSERT INTO enrollment VALUE('133','M200','3','A');
INSERT INTO enrollment VALUE('134','M200','3','A');
INSERT INTO enrollment VALUE('135','M200','3','A');
INSERT INTO enrollment VALUE('136','M200','3','A');
INSERT INTO enrollment VALUE('137','M200','3','B');
INSERT INTO enrollment VALUE('138','M200','3','A');
INSERT INTO enrollment VALUE('139','M200','3','A');
INSERT INTO enrollment VALUE('140','M200','3','A');
INSERT INTO enrollment VALUE('141','M200','3','A');
INSERT INTO enrollment VALUE('142','M200','3','B');
INSERT INTO enrollment VALUE('143','M200','3','B');
INSERT INTO enrollment VALUE('144','M200','3','A');
INSERT INTO enrollment VALUE('145','M200','3','A');
INSERT INTO enrollment VALUE('146','M200','3','B');
INSERT INTO enrollment VALUE('147','M200','3','F');
INSERT INTO enrollment VALUE('148','M200','3','A');
INSERT INTO enrollment VALUE('149','M200','3','A');
INSERT INTO enrollment VALUE('125','Lunch4','4','');
INSERT INTO enrollment VALUE('126','Lunch4','4','');
INSERT INTO enrollment VALUE('127','Lunch4','4','');
INSERT INTO enrollment VALUE('128','Lunch4','4','');
INSERT INTO enrollment VALUE('129','Lunch4','4','');
INSERT INTO enrollment VALUE('130','Lunch4','4','');
INSERT INTO enrollment VALUE('131','Lunch4','4','');
INSERT INTO enrollment VALUE('132','Lunch4','4','');
INSERT INTO enrollment VALUE('133','Lunch4','4','');
INSERT INTO enrollment VALUE('134','Lunch4','4','');
INSERT INTO enrollment VALUE('135','Lunch4','4','');
INSERT INTO enrollment VALUE('136','Lunch4','4','');
INSERT INTO enrollment VALUE('137','Lunch4','4','');
INSERT INTO enrollment VALUE('138','Lunch4','4','');
INSERT INTO enrollment VALUE('139','Lunch4','4','');
INSERT INTO enrollment VALUE('140','Lunch4','4','');
INSERT INTO enrollment VALUE('141','Lunch4','4','');
INSERT INTO enrollment VALUE('142','Lunch4','4','');
INSERT INTO enrollment VALUE('143','Lunch4','4','');
INSERT INTO enrollment VALUE('144','Lunch4','4','');
INSERT INTO enrollment VALUE('145','Lunch4','4','');
INSERT INTO enrollment VALUE('146','Lunch4','4','');
INSERT INTO enrollment VALUE('147','Lunch4','4','');
INSERT INTO enrollment VALUE('148','Lunch4','4','');
INSERT INTO enrollment VALUE('149','Lunch4','4','');
INSERT INTO enrollment VALUE('125','CS200','2','B');
INSERT INTO enrollment VALUE('126','CS200','2','A');
INSERT INTO enrollment VALUE('127','CS200','2','A');
INSERT INTO enrollment VALUE('128','CS200','2','A');
INSERT INTO enrollment VALUE('129','CS200','2','A');
INSERT INTO enrollment VALUE('130','CS200','2','B');
INSERT INTO enrollment VALUE('131','CS200','2','B');
INSERT INTO enrollment VALUE('132','CS200','2','A');
INSERT INTO enrollment VALUE('133','CS200','2','A');
INSERT INTO enrollment VALUE('134','CS200','2','B');
INSERT INTO enrollment VALUE('135','CS200','2','F');
INSERT INTO enrollment VALUE('136','CS200','2','A');
INSERT INTO enrollment VALUE('137','CS200','2','A');
INSERT INTO enrollment VALUE('138','CS200','2','B');
INSERT INTO enrollment VALUE('139','CS200','2','A');
INSERT INTO enrollment VALUE('140','CS200','2','A');
INSERT INTO enrollment VALUE('141','CS200','2','A');
INSERT INTO enrollment VALUE('142','CS200','2','A');
INSERT INTO enrollment VALUE('143','CS200','2','B');
INSERT INTO enrollment VALUE('144','CS200','2','C');
INSERT INTO enrollment VALUE('145','CS200','2','A');
INSERT INTO enrollment VALUE('146','CS200','2','A');
INSERT INTO enrollment VALUE('147','CS200','2','A');
INSERT INTO enrollment VALUE('148','CS200','2','A');
INSERT INTO enrollment VALUE('149','CS200','2','A');
INSERT INTO enrollment VALUE('125','L200','1','A');
INSERT INTO enrollment VALUE('126','L200','1','B');
INSERT INTO enrollment VALUE('127','L200','1','A');
INSERT INTO enrollment VALUE('128','L200','1','A');
INSERT INTO enrollment VALUE('129','L200','1','A');
INSERT INTO enrollment VALUE('130','L200','1','A');
INSERT INTO enrollment VALUE('131','L200','1','B');
INSERT INTO enrollment VALUE('132','L200','1','B');
INSERT INTO enrollment VALUE('133','L200','1','A');
INSERT INTO enrollment VALUE('134','L200','1','A');
INSERT INTO enrollment VALUE('135','L200','1','B');
INSERT INTO enrollment VALUE('136','L200','1','F');
INSERT INTO enrollment VALUE('137','L200','1','A');
INSERT INTO enrollment VALUE('138','L200','1','A');
INSERT INTO enrollment VALUE('139','L200','1','B');
INSERT INTO enrollment VALUE('140','L200','1','C');
INSERT INTO enrollment VALUE('141','L200','1','D');
INSERT INTO enrollment VALUE('142','L200','1','F');
INSERT INTO enrollment VALUE('143','L200','1','A');
INSERT INTO enrollment VALUE('144','L200','1','A');
INSERT INTO enrollment VALUE('145','L200','1','F');
INSERT INTO enrollment VALUE('146','L200','1','A');
INSERT INTO enrollment VALUE('147','L200','1','A');
INSERT INTO enrollment VALUE('148','L200','1','B');
INSERT INTO enrollment VALUE('149','L200','1','C');
INSERT INTO enrollment VALUE('911','S100','1','');
INSERT INTO enrollment VALUE('912','S200','6','');
INSERT INTO enrollment VALUE('917','M100','2','');
INSERT INTO enrollment VALUE('917','M200','5','');
INSERT INTO enrollment VALUE('913','E100','3','');
INSERT INTO enrollment VALUE('914','E200','4','');
INSERT INTO enrollment VALUE('911','CS100','5','');
INSERT INTO enrollment VALUE('911','CS200','2','');
INSERT INTO enrollment VALUE('913','L100','6','');
INSERT INTO enrollment VALUE('914','L200','1','');
INSERT INTO enrollment VALUE('912','Lunch3','3','');
INSERT INTO enrollment VALUE('916','Lunch4','4','');

UPDATE staff SET department = 'Science',title = 'Department Head',salary='100000' WHERE staffid ='911';
UPDATE staff SET department = 'Math',title = 'Faculty',salary='35000' WHERE staffid ='912';
UPDATE staff SET department = 'English',title = 'Faculty',salary='45000' WHERE staffid ='913';
UPDATE staff SET department = 'English',title = 'Faculty',salary='55000' WHERE staffid ='914';
UPDATE staff SET department = 'Social Studies',title = 'Faculty',salary='65000' WHERE staffid ='915';
UPDATE staff SET department = 'Social Studies',title = 'Faculty',salary='75000' WHERE staffid ='916';
UPDATE staff SET department = 'Math',title = 'Faculty',salary='25000' WHERE staffid ='917';
UPDATE staff SET department = 'Science',title = 'Faculty',salary='25000' WHERE staffid ='918';
UPDATE staff SET department = 'Science',title = 'Faculty',salary='25000' WHERE staffid ='999';

UPDATE student SET graddate ='2018' WHERE studentid = '100';
UPDATE student SET graddate ='2018' WHERE studentid = '101';
UPDATE student SET graddate ='2018' WHERE studentid = '102';
UPDATE student SET graddate ='2018' WHERE studentid = '103';
UPDATE student SET graddate ='2018' WHERE studentid = '104';
UPDATE student SET graddate ='2018' WHERE studentid = '105';
UPDATE student SET graddate ='2018' WHERE studentid = '106';
UPDATE student SET graddate ='2018' WHERE studentid = '107';
UPDATE student SET graddate ='2018' WHERE studentid = '108';
UPDATE student SET graddate ='2018' WHERE studentid = '109';
UPDATE student SET graddate ='2018' WHERE studentid = '110';
UPDATE student SET graddate ='2018' WHERE studentid = '111';
UPDATE student SET graddate ='2018' WHERE studentid = '112';
UPDATE student SET graddate ='2018' WHERE studentid = '113';
UPDATE student SET graddate ='2018' WHERE studentid = '114';
UPDATE student SET graddate ='2018' WHERE studentid = '115';
UPDATE student SET graddate ='2018' WHERE studentid = '116';
UPDATE student SET graddate ='2018' WHERE studentid = '117';
UPDATE student SET graddate ='2018' WHERE studentid = '118';
UPDATE student SET graddate ='2018' WHERE studentid = '119';
UPDATE student SET graddate ='2018' WHERE studentid = '120';
UPDATE student SET graddate ='2018' WHERE studentid = '121';
UPDATE student SET graddate ='2018' WHERE studentid = '122';
UPDATE student SET graddate ='2018' WHERE studentid = '123';
UPDATE student SET graddate ='2018' WHERE studentid = '124';
UPDATE student SET graddate ='2019' WHERE studentid = '125';
UPDATE student SET graddate ='2019' WHERE studentid = '126';
UPDATE student SET graddate ='2019' WHERE studentid = '127';
UPDATE student SET graddate ='2019' WHERE studentid = '128';
UPDATE student SET graddate ='2019' WHERE studentid = '129';
UPDATE student SET graddate ='2019' WHERE studentid = '130';
UPDATE student SET graddate ='2019' WHERE studentid = '131';
UPDATE student SET graddate ='2019' WHERE studentid = '132';
UPDATE student SET graddate ='2019' WHERE studentid = '133';
UPDATE student SET graddate ='2019' WHERE studentid = '134';
UPDATE student SET graddate ='2019' WHERE studentid = '135';
UPDATE student SET graddate ='2019' WHERE studentid = '136';
UPDATE student SET graddate ='2019' WHERE studentid = '137';
UPDATE student SET graddate ='2019' WHERE studentid = '138';
UPDATE student SET graddate ='2019' WHERE studentid = '139';
UPDATE student SET graddate ='2019' WHERE studentid = '140';
UPDATE student SET graddate ='2019' WHERE studentid = '141';
UPDATE student SET graddate ='2019' WHERE studentid = '142';
UPDATE student SET graddate ='2019' WHERE studentid = '143';
UPDATE student SET graddate ='2019' WHERE studentid = '144';
UPDATE student SET graddate ='2019' WHERE studentid = '145';
UPDATE student SET graddate ='2019' WHERE studentid = '146';
UPDATE student SET graddate ='2019' WHERE studentid = '147';
UPDATE student SET graddate ='2019' WHERE studentid = '148';
UPDATE student SET graddate ='2019' WHERE studentid = '149';



