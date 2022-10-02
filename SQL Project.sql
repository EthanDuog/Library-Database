use project;

CREATE TABLE Branch (
BranchID NUMERIC(25) NOT NULL,
BranchName varchar(50) NOT NULL,
Branch_Location varchar(25) NOT NULL,
PhoneNumber numeric(10) NOT NULL,
PRIMARY KEY (BranchID)
);
-- Branch row:
INSERT INTO Branch VALUES (1, 'First Branch', '22 Spadina', 416-111-1111);
INSERT INTO Branch VALUES (2, 'Second Branch', '33 Eglinton', 416-222-2222);
INSERT INTO Branch VALUES (3, 'Third Branch', '44 St.Clair', 416-333-3333);
INSERT INTO Branch VALUES (4, 'Fourth Branch', '55 Duport',  416-444-4444);
INSERT INTO Branch VALUES (5, 'Fifth Branch', '66 Spadina', 416-555-5555);
INSERT INTO Branch VALUES (6, 'Sixth Branch', '77 St.George', 416-666-6666);
INSERT INTO Branch VALUES (7, 'Seventh Branch', '88 Museum' , 416-777-7777);
INSERT INTO Branch VALUES (8, 'Eighth Branch', '99 Queens Park', 416-888-8888);
INSERT INTO Branch VALUES (9, 'Ninth Branch', '100 St. Patrick', 416-999-9999);
INSERT INTO Branch VALUES (10, 'Tenth Branch', '101 Osgoode', 416-000-0000);
INSERT INTO Branch VALUES (11, 'Eleventh Branch', '102 St. Andrew', 416-000-0001);


CREATE TABLE AUTHORS (
AuthorID NUMERIC(5) NOT NULL,
FirstName varchar(10),
LastName varchar(10),
DateOfBirth date,
DateOfDeath date,
PRIMARY KEY (AuthorID)
);

-- Author row:

INSERT INTO AUTHORS VALUES (1234, 'Alexander', 'Hewitt','1990-01-01', NULL);
INSERT INTO AUTHORS VALUES (1235, 'Ethan', 'Duong','1991-01-01', NULL);
INSERT INTO AUTHORS VALUES (1236, 'Khateeb', 'Abd','1992-01-01', NULL);
INSERT INTO AUTHORS VALUES (1237, 'Nicholas', 'Stekar','1993-01-01', NULL);
INSERT INTO AUTHORS VALUES (1238, 'Wolfgang', 'Mozart', '1933-01-01', '2005-01-01'); 
INSERT INTO AUTHORS VALUES (1239, 'Elon', 'Musk','1915-01-01', '2001-01-01');
INSERT INTO AUTHORS VALUES (1240, 'Charles', 'Hoskinson', '1975-01-01', '2002-01-01');
INSERT INTO AUTHORS VALUES (1241, 'Steven', 'Speilberg', '1955-01-01', '2008-01-01');
INSERT INTO AUTHORS VALUES (1242, 'John', 'Wayne', '1988-01-01', '2016-01-01');
INSERT INTO AUTHORS VALUES (1243, 'Barrack', 'Santana', '1989-01-01', '2019-01-01'); 
INSERT INTO AUTHORS VALUES (1244, 'Nikola', 'Tesla', '1968-01-01',' 2007-01-01');


CREATE TABLE BOOKS (
BookID NUMERIC(20) NOT NULL Primary key,
Title varchar(10) NOT NULL,
SubjectID NUMERIC(5),
AuthorID NUMERIC(5),
PublishDate date,
FOREIGN KEY (AuthorID) REFERENCES AUTHORS (AuthorID)
);

-- BOOKS ROWS:

INSERT INTO Books VALUES (989, 'Life', 9002, 1234,'2005-01-01');
INSERT INTO Books VALUES (990, 'Aerospace', 9003, 1237, '2004-01-01');
INSERT INTO Books VALUES (991, 'History', 9004, 1238, '1960-01-01'); 
INSERT INTO Books VALUES (992, 'Chopin', 9005, 1236, '2020-01-01');
INSERT INTO Books VALUES (993, 'Alice', 9010, 1240, '1999-01-01');
INSERT INTO Books VALUES (994, 'Detectives', 9006 , 1237, '2015-01-01');
INSERT INTO Books VALUES (995, 'Journey', 9007, 1239, '1986-01-01');
INSERT INTO Books VALUES (996, 'Wayne', 9009, 1243, '2016-01-01'); 
INSERT INTO Books VALUES (997, 'Game', 9007 , 1244, '1999-01-01');
INSERT INTO Books VALUES (998, 'Tree', 9010 , 1236, '2021-01-01');
INSERT INTO Books VALUES (999, 'Steel', 9010, 1236, '2017-01-01');
INSERT INTO Books VALUES (1000, 'The Music ', 9003, 1234, '2018-01-01');


CREATE TABLE Copies (
Copies_Num NUMERIC(10) NOT NULL PRIMARY KEY,
BookID NUMERIC(20) NOT NULL,
BranchID NUMERIC(25) NOT NULL, 
Branch_Status varchar(15),
PurchaseDate date,
FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
FOREIGN KEY (BookID) REFERENCES BOOKS (BookID)

);
-- copies row:
INSERT INTO Copies VALUES (1,989,1, 'M', '1994-01-01');
INSERT INTO Copies VALUES (2,990,2,  'T', '1995-01-01');
INSERT INTO Copies VALUES (3,991,3,  'T', '1996-01-01');
INSERT INTO Copies VALUES (4,992,4,  'M', '1997-01-01');
INSERT INTO Copies VALUES (5,993,5,  'M', '1998-01-01');
INSERT INTO Copies VALUES (6,994,6,  'M', '1999-01-01');
INSERT INTO Copies VALUES (7,995,7,  'T','2000-01-01');
INSERT INTO Copies VALUES (8,996,8,  'T',  '2017-01-01');
INSERT INTO Copies VALUES (9,997,6,  'M', '2019-01-01');
INSERT INTO Copies VALUES (10,998,7,  'T',  '2020-01-01');
INSERT INTO Copies VALUES (11,999,8,  'T', '2021-01-01');
INSERT INTO Copies VALUES (12,989,8, 'T',  NULL);
INSERT INTO Copies VALUES (13,989,2,  'T', NULL);
INSERT INTO Copies VALUES (14,989,3, 'T', NULL);
INSERT INTO Copies VALUES (15,990,4,  'T', NULL);
INSERT INTO Copies VALUES (16,990,5, 'T', '2012-01-01');
INSERT INTO Copies VALUES (17,991,6, 'M', NULL);

CREATE TABLE SUBJECTS (
SubjectName varchar(20) not null primary key
);

-- Subject:
INSERT INTO SUBJECTS VALUES ('History');
INSERT INTO SUBJECTS VALUES ('Literature' );
INSERT INTO SUBJECTS VALUES ('Engineering' );
INSERT INTO SUBJECTS VALUES ('Horror');
INSERT INTO SUBJECTS VALUES ('Music');
INSERT INTO SUBJECTS VALUES ('Mystery');
INSERT INTO SUBJECTS VALUES ('Fantasy');
INSERT INTO SUBJECTS VALUES ('Adventure');
INSERT INTO SUBJECTS VALUES ('Biography');
INSERT INTO SUBJECTS VALUES ('Kids');
INSERT INTO SUBJECTS VALUES ('Mathematics');

CREATE TABLE BOOK_SUBJECT_RELATION (
BookID NUMERIC(20) NOT NULL,
SubjectName varchar(20) not null,
SubjectType varchar(20) not null,
foreign key (BookID) references Books(BookID),
foreign key (SubjectName) references SUBJECTS(SubjectName),
unique (BookID,SubjectName)
);
-- BOOK SUBJECT RELATION:
INSERT INTO BOOK_SUBJECT_RELATION VALUES (989,'History','Major' );
INSERT INTO BOOK_SUBJECT_RELATION VALUES (990,'Literature', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (991,'Engineering', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (992,'Horror', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (993,'Music', 'Minor');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (994,'Mystery', 'Minor');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (995,'Fantasy', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (996,'Adventure', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (997,'Biography', 'Major');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (998,'Kids', 'Minor');
INSERT INTO BOOK_SUBJECT_RELATION VALUES (999,'Mathematics', 'Minor');

CREATE TABLE Members (
MemberID NUMERIC(30) NOT NULL,
FirstName varchar (100),
LastName varchar (100),
Mem_Address varchar(100),
EmailAddress varchar(100),
PhoneNumber numeric(10),
Kids_MemberID NUMERIC(30),
PRIMARY KEY (MemberID),
FOREIGN KEY (Kids_MemberID) REFERENCES Members(MemberID)
);
-- Member:
INSERT INTO Members Values (3000, 'John', 'Francis', '123 Pickering', 'J.Mail@Gmail.ca', 647-440-4444, 3000);
INSERT INTO Members Values (3001, 'Arnold', 'Jacobs', '547 Spadina', 'AJJ@Gmail.ca', 974-772-3365,3001);
INSERT INTO Members Values (3002, 'Lewis', 'Blain', '89 Bloor', 'Dblain@hotmail.com', 899-999-9999,3002);
INSERT INTO Members Values (3003, 'Jaylen', 'Hurst', '2767 Brookview', 'footballpl@Gmail.com', 123-122-1785,3003);
INSERT INTO Members Values (3004, 'Demarcus', 'Cousins', '37 Hetway', 'DC@gmail.ca', 457-898-8877,3004);
INSERT INTO Members Values (3005, 'Phillip', 'Lindsey', '678 St.pierce', 'Avenger.12@gmail.ca', 525-989-7410,3005);
INSERT INTO Members Values (3006, 'Stephanie', 'Berry', '1 Ellington way', 'CPU@hotmail.com', 411-415-8756,3006);
INSERT INTO Members Values (3007, 'Scarlett', 'Adams', '22 Avenue Road', 'AvengersHulk@gmail.com', 778-789-897,3007);
INSERT INTO Members Values (3008, 'Hanna', 'Bremlin', '16 harrison', 'Hanna.Bremlin@Ryerson.ca', 111-112-1113,3008);
INSERT INTO Members Values (3009, 'John', 'Mixon', '44 Cincinati', 'Bengals.mixon@ryerson.ca', 647-552-8316,3009);
INSERT INTO Members Values (3010, 'Sasha', 'Montgomery', '9928 Guilliard Blvd', 'SashaMixon@ryerson.ca', 416-442-6348,3010);

CREATE TABLE Loan (
LoanID NUMERIC(25) NOT NULL,
LoanDate date, 
DueDate date,
ReturnDate date,
OutstandingFine decimal,
PaymentDate date, 
PRIMARY KEY (LoanID)
);

-- Loan:
INSERT INTO Loan VALUES (2525, '02-02-2019', '02-09-2019', '02-10-2019', 1.20, '02-22-2019');
INSERT INTO Loan VALUES (2526, '10/18/2010', '10/25/2010', '10/26/2010', 2.30, '10/26/2010');
INSERT INTO Loan VALUES (2527,  '06/06/1999', '06/13/1999', '06/14/1999', 0, '10/14/1999');
INSERT INTO Loan VALUES (2528, '12/01/1989', '12/08/1989', '12/09/1989', 0, '12/09/1989');
INSERT INTO Loan VALUES (2529,  '01/02/2000', '01/09/2000', '01/10/2000', 16.89, '12/10/2001'); 
INSERT INTO Loan VALUES (2530, '10/09/2020', '09/16/2020', '09/17/2020', 10.25, '03/01/2021');
INSERT INTO Loan VALUES (2531,  '09/09/2016', '09/16/2016', '09/17/2016', 0.25, '09/18/2016'); 
INSERT INTO Loan VALUES (2532,  '04/04/2014', '04/11/2014', '04/22/2020', 50.01, '04/22/2020');
INSERT INTO Loan VALUES (2533,  '06/06/2001', '06/13/2001', '06/13/2001', 0,'04/22/2020');
INSERT INTO Loan VALUES (2534,  '10/10/2004', '10/17/2004', '10/17/2004', 0.30, '10/17/2004');
INSERT INTO Loan VALUES (2535, '12/12/2008', '12/19/2008', '12/27/2008', 3.33, '12/27/2009');


CREATE TABLE BookReservation (
ReserveID NUMERIC(10) NOT NULL,
ReservationDate date,
MemberID NUMERIC(30) NOT NULL,
NotificationDate date, 
LoanID NUMERIC(25) NOT NULL,
Copies_Num NUMERIC(10) NOT NULL,
ExpiryDate date, 
PRIMARY KEY (ReserveID),
FOREIGN KEY (MemberID) REFERENCES Members (MemberID),
FOREIGN KEY (Copies_Num) REFERENCES Copies (Copies_Num)

);
-- bookreservation:
INSERT INTO BookReservation VALUES (44891, '01/01/2010', 3000, '10/10/2010',2525 ,1,'10/01/2010');
INSERT INTO BookReservation VALUES (44892, '11/02/2005', 3010,  '11/11/2005',2526,2, '11/16/2005');
INSERT INTO BookReservation VALUES (44893, '03/03/2006', 3010,  '11/25/2006',2527,3, '11/30/2006');
INSERT INTO BookReservation VALUES (44894,  '01/01/2018', 3008,  '01/01/2018',2528,4, '01/06/2018');
INSERT INTO BookReservation VALUES (44895, '01/05/1999', 3009,  '04/18/1999',2529,5, '04/23/1999');
INSERT INTO BookReservation VALUES (44896, '06/06/2016', 3007, '06/06/2016',2530,6, '06/11/2016');
INSERT INTO BookReservation VALUES (44897, '05/07/2016', 3006,  '06/16/2016',2531,7, '05/21/2016');
INSERT INTO BookReservation VALUES (44898, '08/08/2021', 3001,  '10/20/2021',2532,8, '10/25/2021');
INSERT INTO BookReservation VALUES (44899, '01/01/1989', 3005, '01/02/1989',2533,14, '01/07/1989');
INSERT INTO BookReservation VALUES (44900, '10/10/1960', 3002,  '10/11/1960',2534,10, '10/16/1960');
INSERT INTO BookReservation VALUES (44901, '11/11/2019', 3003,  '05/05/2017',2535,11, '05/10/2017');
INSERT INTO BookReservation VALUES (44902, '12/12/2007', 3004, '12/14/2007',2534,12, '12/19/2007');
INSERT INTO BookReservation VALUES (44903, '6/29/2020', 3000,  '12/20/2020',2535,13, '12/25/2020');


