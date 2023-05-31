--DROP DATABASE DANA
CREATE DATABASE DANA

USE DANA

BEGIN TRAN
CREATE TABLE [User](
	UserID int PRIMARY KEY,
	UserName varchar(50) NOT NULL,
	UserEmail varchar(50) NOT NULL,
	UserPassword varchar(50) NOT NULL,
	UserPhoneNumber varchar(20) NOT NULL
);
--ROLLBACK
COMMIT
SELECT * FROM [User]


BEGIN TRAN
CREATE TABLE Recipient(
	RecipientID int PRIMARY KEY,
	RecipientName varchar(50) NOT NULL,
	RecipientPhoneNumber varchar(20) NOT NULL
);
--ROLLBACK
COMMIT
SELECT * FROM Recipient



BEGIN TRAN
CREATE TABLE TrStatus(
	TransactionStatusID int PRIMARY KEY,
	TransactionStatusType varchar(50) NOT NULL
);
--ROLLBACK
COMMIT
SELECT * FROM TrStatus


BEGIN TRAN
CREATE TABLE PyStatus(
	PaymentStatusID int PRIMARY KEY,
	PaymentStatusType varchar(50) NOT NULL
);
--ROLLBACK
COMMIT
SELECT * FROM PyStatus


BEGIN TRAN
CREATE TABLE TopUpMethod(
	TopUpMethodID int PRIMARY KEY,
	TopUpMethodTypeName varchar(100) NOT NULL,
	TopUpMethodFee int
);
--ROLLBACK
COMMIT
SELECT * FROM TopUpMethod


BEGIN TRAN
CREATE TABLE TrDetail(
	TransactionDetailID int PRIMARY KEY,
	TransactionQuantity int
);
--ROLLBACK
COMMIT
SELECT * FROM TrDetail


BEGIN TRAN
CREATE TABLE PyHeader(
	PaymentID int PRIMARY KEY,
	UserID int FOREIGN KEY REFERENCES [User](UserID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentStatusID int FOREIGN KEY REFERENCES PyStatus(PaymentStatusID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentDate DATE
);
--ROLLBACK
COMMIT
SELECT * FROM PyHeader


BEGIN TRAN
CREATE TABLE PyDetail(
	PaymentID int FOREIGN KEY REFERENCES PyHeader(PaymentID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	RecipientID int FOREIGN KEY REFERENCES Recipient(RecipientID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentQuantity int
);
--ROLLBACK
COMMIT
SELECT * FROM PyDetail


BEGIN TRAN
CREATE TABLE TrHeader(
	TransactionID int PRIMARY KEY,
	UserID int FOREIGN KEY REFERENCES [User](UserID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TopUpMethodID int FOREIGN KEY REFERENCES TopUpMethod(TopUpMethodID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionStatusID int FOREIGN KEY REFERENCES TrStatus(TransactionStatusID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDetailID int FOREIGN KEY REFERENCES TrDetail(TransactionDetailID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE
);
--ROLLBACK
COMMIT
SELECT * FROM TrHeader


INSERT INTO [User] VALUES
('2501',	'Anton',	'anton@email.com',	'$anton01',	'0812-1122-3344'),
('2502',	'Toni',	'toni@email.com',	'$toni02',	'0812-5566-7788'),
('2503',	'Budi',	'budi@email.com',	'$budi03',	'0812-9900-1122'),
('2504',	'Rose',	'rose@email.com',	'$rose04',	'0812-2233-4455'),
('2505',	'Shelly',	'shelly@email.com',	'$shelly05',	'0812-6677-8899')
SELECT * FROM [User]

INSERT INTO Recipient VALUES
('2601',	'Rudi',	'0877-1234-5678'),
('2602',	'Asep',	'0877-1334-5679'),
('2603',	'Bambang',	'0877-2734-5680'),
('2604',	'Bejo',	'0877-8854-5681'),
('2605',	'Cecep',	'0877-1904-5682')
SELECT * FROM Recipient

INSERT INTO TopUpMethod VALUES
('0101',	'Bank Transfer BNI','1500'),
('0102',	'Bank Transfer BCA','1500'),
('0201',	'Agent Alfamart',	'1000'),
('0202',	'Agent Lawson',	'1000'),
('0103',	'Bank Transfer Mandiri','1500')
SELECT * FROM TopUpMethod

INSERT INTO TrStatus VALUES
('1101',	'Success'),
('1102',	'Success'),
('1103',	'Success'),
('1104',	'Success'),
('1105',	'Success')
SELECT * FROM TrStatus

INSERT INTO TrDetail VALUES
('2201',	'50000'),
('2202',	'100000'),
('2203',	'150000'),
('2204',	'35000'),
('2205',	'80000')
SELECT * FROM TrDetail

INSERT INTO PyStatus VALUES
('1001',	'Success'),
('1002',	'Success'),
('1003',	'Success'),
('1004',	'Success'),
('1005',	'Success')
SELECT * FROM PyStatus

INSERT INTO TrHeader VALUES
('90101',	'2501',	'0101',	'1101',	'2201',	'2022-07-01'),
('90102',	'2502',	'0102',	'1102',	'2202',	'2022-08-30'),
('90103',	'2503',	'0201',	'1103',	'2203',	'2022-10-15'),
('90104',	'2504',	'0202',	'1104',	'2204',	'2022-11-02'),
('90105',	'2505',	'0103',	'1105',	'2205',	'2022-11-07')
SELECT * FROM TrHeader

INSERT INTO PyHeader VALUES
('202201',	'2501',	'1001',	'2022-08-08'),
('202202',	'2502',	'1002',	'2022-08-10'),
('202203',	'2503',	'1003',	'2022-10-10'),
('202204',	'2504',	'1004',	'2022-10-11'),
('202205',	'2505',	'1005',	'2022-11-01')
SELECT * FROM PyHeader

INSERT INTO PyDetail VALUES
('202201',	'2601',	'50000'),
('202202',	'2602',	'50000'),
('202203',	'2603',	'65000'),
('202204',	'2604',	'100000'),
('202205',	'2605',	'125000')
SELECT * FROM PyDetail

SELECT * FROM [User]
SELECT * FROM Recipient
SELECT * FROM TopUpMethod
SELECT * FROM TrHeader
SELECT * FROM TrStatus
SELECT * FROM TrDetail
SELECT * FROM PyHeader
SELECT * FROM PyStatus
SELECT * FROM PyDetail