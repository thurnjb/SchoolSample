USE Lab3;


DROP TABLE EQUIPMENTSERVICE;
DROP TABLE EQUIPMENT;
DROP TABLE NOTES;
DROP TABLE TICKETHISTORY;
DROP TABLE INVENTORYITEM;
DROP TABLE INVENTORYSERVICE;
DROP TABLE SERVICETICKET;
DROP TABLE NOTIFICATIONS;

DROP TABLE ADDITIONALSERVICE;
DROP TABLE AUCTION;
DROP TABLE SERVICE;
DROP TABLE EMPLOYEE;
DROP TABLE TBLFILES;
DROP TABLE LOOKAT;
DROP TABLE LookAtNotifConfirm;
DROP TABLE LOOKATNOTIFICATION;
DROP TABLE MoveNotifConfirm;
DROP TABLE MOVENOTIFICATION;
DROP TABLE MOVEASSESSMENT;
DROP TABLE AUCTIONASSESSMENT;
DROP TABLE CUSTOMER;

--Create tables
CREATE TABLE Customer
	(CustomerID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(255),
	LastName varchar(255),
	InitialContact varchar(255),
	HeardFrom varchar(255),
	Phone varchar(255),
	Email varchar(255),
	Address varchar(255),
	RequestedService varchar(255),
	SaveDate datetime
	);

	CREATE TABLE tblFiles
(
	id int IDENTITY(1,1) NOT NULL,
	CustomerID int REFERENCES Customer(CustomerID),
	Name varchar(50) NOT NULL,
	ContentType nvarchar(200) NOT NULL,
	Data varbinary(max) NOT NULL,
)	ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--CREATE TABLE CustData
--	(DataID int NOT NULL PRIMARY KEY IDENTITY(1,1),
--	CustomerID int REFERENCES Customer(CustomerID),
--	);

--CREATE TABLE Images
--	(
--	imageID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE,
--	imagefile VARBINARY(MAX) FILESTREAM,
--	DataID int REFERENCES CustData(DataID)
--	);

--CREATE TABLE AuctionForms
--	(formID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE,
--	formfile VARBINARY(MAX) FILESTREAM,
--	DataID int REFERENCES CustData(DataID)
--	);

--CREATE TABLE MoveForms
--	(formID UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL UNIQUE,
--	formfile VARBINARY(MAX) FILESTREAM,
--	DataID int REFERENCES CustData(DataID)
--	);

--CREATE TABLE Forms


CREATE TABLE Employee
	(EmployeeID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(255),
	LastName varchar(255),
	Position varchar(255),
	Phone varchar(255),
	Email varchar(255)
	);

CREATE TABLE Service
	(ServiceID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceType varchar(255),
	ServiceDescription varchar(255),
	);

CREATE TABLE Auction
	(AuctionID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	AuctionName varchar(255),
	AuctionDate datetime,
	);

CREATE TABLE AdditionalService
	(AdditionalServiceID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	AdditionalServiceType varchar(255),
	AdditionalServiceDate datetime,
	);

CREATE TABLE ServiceTicket
	(ServiceTicketID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerID int REFERENCES Customer(CustomerID),
	InitiatingEmployeeID int REFERENCES Employee(EmployeeID),
	Service varchar(255),
	TicketStatus varchar(255),
	TicketOpenDate datetime,
	Address varchar(255),
	Date varchar(255),
	Archived varchar(255)
	);

CREATE TABLE Notes
	(NoteID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceTicketID int REFERENCES ServiceTicket(ServiceTicketID),
	NoteTitle varchar(255),
	NoteContent TEXT
	);

CREATE TABLE TicketHistory
	(TicketHistoryID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceTicketID int REFERENCES ServiceTicket(ServiceTicketID),
	EmployeeID int REFERENCES Employee(EmployeeID),
	TicketChangeDate datetime,
	DetailsNote varchar(255),
	);

CREATE TABLE InventoryService
	(InventoryServiceID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceTicketID int REFERENCES ServiceTicket(ServiceTicketID),
	);

CREATE TABLE InventoryItem
	(InventoryItemID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	InventoryServiceID int REFERENCES InventoryService(InventoryServiceID),
	ItemName varchar(255),
	ItemDesc varchar(255),
	ItemCost int,
	InventoryDate varchar(255)
	);

CREATE TABLE Equipment
	(EquipmentID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	EquipmentName varchar(255),
	EquipmentDesc varchar(255),
	PurchaseCost int,
	PurchaseDate varchar(255)
	);

CREATE TABLE EquipmentService
	(InventoryServiceID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceTicketID int REFERENCES ServiceTicket(ServiceTicketID),
	EquipmentID int REFERENCES Equipment(EquipmentID)
	);


CREATE TABLE Notifications
	(
	NotificationID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username varchar(80),
	FirstName varchar(80),
	LastName varchar(80),
	ServiceNeeded varchar(80),
	DateNeeded varchar(80),
	NoteDescription varchar(255),
	CustAddress varchar(80),
	);

CREATE TABLE LookAt
	(LookAtID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerID int REFERENCES Customer(CustomerID),
	Address varchar(255),
	Date varchar(255),
	SaveDate datetime,
	Archived varchar(255)
	);

CREATE TABLE LookAtNotification
	(NotificationID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerID int REFERENCES Customer(CustomerID),
	SaveDate datetime,
	Archived varchar(255)
	);

CREATE TABLE LookAtNotifConfirm
	(ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	NotificationID int REFERENCES LookAtNotification(NotificationID),
	PotentialDates varchar(255),
	SaveDate datetime,
	Archived varchar(255)
	);


Create Table MoveAssessment 
	(MoveAssessmentID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	outDate varChar(255),
	windowDays varChar(255),
	address varChar(255),
	mls varChar(255),
	photo varChar(255),
	additionalServices varChar(255),
	auctionServices varChar(255),
	room varChar(255),
	furnitureList varChar(255),
	roomFloor varChar(255),
	boxes varChar(255),
	appFloor varChar(255),
	elevator varChar(255),
	walk varChar(255),
	house varChar(255),
	climateStorage varChar(255),
	outdoorStorage varChar(255),
	businessPlace varChar(255),
	truckAccessable varChar(255),
	doorWalk varChar(255),
	stepsWalk varChar(255),
	equipNeeded varChar(255),
	trucksRequired varChar(255),
	moveEstimate varChar(255),
	fixedRates varChar(255),
	packingFees varChar(255),
	storageFees varChar(255),
	trashRemoval varChar(255),
	CustomerID int References Customer(CustomerID)
	);
	

CREATE TABLE MoveNotification
	(MoveNotificationID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerID int REFERENCES Customer(CustomerID),
	PotentialDates varchar(255),
	SaveDate datetime,
	Archived varchar(255)
	);

CREATE TABLE MoveNotifConfirm
	(MoveNotifConfirmID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	MoveNotificationID int REFERENCES MoveNotification(MoveNotificationID),
	PotentialDates varchar(255),
	SaveDate datetime,
	Archived varchar(255),
	);

	Create Table AuctionAssessment
	(AuctionAssessmentID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	whatSell varChar(255),
	whyAuction varChar(255),
	deadline varChar(255),
	deadlineDate varChar(255),
	bringIn varChar(255),
	walkThrough varChar(255),
	pickUp varChar(255),
	trashHaul varChar(255),
	photos varChar(255),
	moving varChar(255),
	appraisal varChar(255),
	CustomerID int References Customer(CustomerID)
	);

--Insert test records
	INSERT INTO CUSTOMER(FirstName,LastName,InitialContact,HeardFrom,Phone,Email,Address,SaveDate) VALUES
	('Joe', 'Jenkins', 'Phone', 'Web', '1234567890', 'joejoe@joe.com', '123 S. Main St.,Harrisonburg,Virginia,22801','2021-02-10');
	INSERT INTO CUSTOMER(FirstName,LastName,InitialContact,HeardFrom,Phone,Email,Address,SaveDate) VALUES
	('Sarah', 'Smiles', 'Email', 'Email', '0987654321', 'SarahBear@gmail.com',  '800 S. Main St.,Harrisonburg,Virginia,22801','2021-02-11');
	INSERT INTO CUSTOMER(FirstName,LastName,InitialContact,HeardFrom,Phone,Email,Address,SaveDate) VALUES
	('Terry', 'Thurn', 'Text', 'Web', '1112223334', 'TerryRulez@gmail.com', '321 Boom St.,Nome,Alaska,11111','2021-02-12');
	INSERT INTO CUSTOMER(FirstName,LastName,InitialContact,HeardFrom,Phone,Email,Address,SaveDate) VALUES
	('Scooby', 'Doo', 'Phone', 'Person', '1010101010', 'Scoobs@gmail.com',  '1 Street St.,Crystal Cove,Virginia,12345','2021-02-13');
	INSERT INTO CUSTOMER(FirstName,LastName,InitialContact,HeardFrom,Phone,Email,Address,SaveDate) VALUES
	('Andrew', 'Amberson', 'Person', 'Email', '7037037037', 'Andypoo@gmail.com', '2 Court Ct.,Narnia,California,54321','2021-02-14');

	INSERT INTO EMPLOYEE(FirstName,LastName,Position,Phone,Email) VALUES
	('John', 'Jacob', 'Manager', '18005882300', 'JohnJacob@jingleheimer.com');
	INSERT INTO EMPLOYEE(FirstName,LastName,Position,Phone,Email) VALUES
	('Mike', 'Myers', 'Team Member', '7571239000', 'MikeMikeMike@Mike.com');
	INSERT INTO EMPLOYEE(FirstName,LastName,Position,Phone,Email) VALUES
	('Barry', 'Berry', 'Service Representative', '9182736450', 'BeepBoop@aol.com');
	INSERT INTO EMPLOYEE(FirstName,LastName,Position,Phone,Email) VALUES
	('Elton', 'John', 'Service Representative', '1020304050', 'Rocketman@gmail.com');
	INSERT INTO EMPLOYEE(FirstName,LastName,Position,Phone,Email) VALUES
	('Justin', 'Bieber', 'Customer Service Rep', '9998887777', 'Justin&Selena@gmail.com');

	INSERT INTO SERVICE(ServiceType,ServiceDescription) VALUES
	('Moving', 'Moving job');
	INSERT INTO SERVICE(ServiceType,ServiceDescription) VALUES
	('Auction', 'Auction job');
	INSERT INTO SERVICE(ServiceType,ServiceDescription) VALUES
	('Appraisal', 'Appraisal job');
	INSERT INTO SERVICE(ServiceType,ServiceDescription) VALUES
	('Consignment', 'Consignment job');
	INSERT INTO SERVICE(ServiceType,ServiceDescription) VALUES
	('Combination', 'Combination job');

	INSERT INTO AUCTION(AuctionName, AuctionDate) VALUES
	('March Fest', '2021-03-15');
	INSERT INTO AUCTION(AuctionName, AuctionDate) VALUES
	('Roman Auction', '2021-04-01');
	INSERT INTO AUCTION(AuctionName, AuctionDate) VALUES
	('Chinese Bargain', '2021-05-01');

	INSERT INTO ADDITIONALSERVICE(AdditionalServiceType,AdditionalServiceDate) VALUES
	('Cleaning','2021-02-01');
		INSERT INTO AdditionalService(AdditionalServiceType,AdditionalServiceDate) VALUES
	('Trash Removal','2021-02-01');
		INSERT INTO AdditionalService(AdditionalServiceType,AdditionalServiceDate) VALUES
	('Storage','2021-02-01');

	INSERT INTO EQUIPMENT(EquipmentName,EquipmentDesc,PurchaseCost,PurchaseDate) VALUES
	('Moving truck1', '3 ton limit moving truck', 200000.00, '2021-02-05');
	INSERT INTO EQUIPMENT(EquipmentName,EquipmentDesc,PurchaseCost,PurchaseDate) VALUES
	('Forklift1', 'Helps lift heavy objects in and out of truck', 40000.00, '2021-02-05');
	INSERT INTO EQUIPMENT(EquipmentName,EquipmentDesc,PurchaseCost,PurchaseDate) VALUES
	('Moving truck2', '3 ton limit moving truck', 200000.00, '2021-02-10');
	INSERT INTO EQUIPMENT(EquipmentName,EquipmentDesc,PurchaseCost,PurchaseDate) VALUES
	('Forklift2', 'Helps lift heavy objects in and out of truck', 40000.00, '2021-02-10');
	INSERT INTO EQUIPMENT(EquipmentName,EquipmentDesc,PurchaseCost,PurchaseDate) VALUES
	('Moving truck3', '3 ton limit moving truck', 200000.00, '2021-02-15');

	INSERT INTO INVENTORYITEM(ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	('Antique Hand Mirror', 'Hand mirror dating from 1300 AD', 1500.00, '2021-02-10');
	INSERT INTO INVENTORYITEM(ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	('Chinese Scroll', 'Chinese scroll from the Qin Dynasty', 2000.00, '2021-02-10');
	INSERT INTO INVENTORYITEM(ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	('Roman Vase', 'Roman vase from ~1100 AD', 500.00, '2021-03-15');
	INSERT INTO INVENTORYITEM(ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	('Roman Sword', 'Roman sword from ~1100 AD', 1000.00, '2021-03-15');
	INSERT INTO INVENTORYITEM(ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	('Roman Gold Coin', 'Roman currency from ~1100 AD', 300.00, '2021-03-15');

	INSERT INTO SERVICETICKET(CustomerID,InitiatingEmployeeID,Service,TicketStatus,TicketOpenDate) VALUES
	(1, 1, 'Move', 'Open', '2021-02-14');
	INSERT INTO SERVICETICKET(CustomerID,InitiatingEmployeeID,Service,TicketStatus,TicketOpenDate) VALUES
	(2, 2, 'Auction', 'Open', '2021-02-15');
	INSERT INTO SERVICETICKET(CustomerID,InitiatingEmployeeID,Service,TicketStatus,TicketOpenDate) VALUES
	(3, 3, 'Auction', 'Open', '2021-02-16');
	INSERT INTO SERVICETICKET(CustomerID,InitiatingEmployeeID,Service,TicketStatus,TicketOpenDate) VALUES
	(4, 4, 'Move', 'Open', '2021-02-18');
	INSERT INTO SERVICETICKET(CustomerID,InitiatingEmployeeID,Service,TicketStatus,TicketOpenDate) VALUES
	(5, 5, 'Move', 'Open',  '2021-02-19');

	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(1, 'Ticket Created', 'Ticket Created');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(2, 'Ticket Created', 'Ticket Created');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(3, 'Ticket Created', 'Ticket Created');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(4, 'Ticket Created', 'Ticket Created');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(5, 'Ticket Created', 'Ticket Created');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(1, 'Notey note', 'Test note');
	INSERT INTO NOTES(ServiceTicketID,NoteTitle,NoteContent) VALUES
	(1, 'Last note', 'Last note test');

	INSERT INTO TICKETHISTORY(ServiceTicketID,EmployeeID,TicketChangeDate,DetailsNote) VALUES
	(1, 3, '2021-02-19', 'New employee was assigned');
	INSERT INTO TICKETHISTORY(ServiceTicketID,EmployeeID,TicketChangeDate,DetailsNote) VALUES
	(2, 3, '2021-01-20', 'New employee was assigned');
	INSERT INTO TICKETHISTORY(ServiceTicketID,EmployeeID,TicketChangeDate,DetailsNote) VALUES
	(3, 1, '2021-01-18', 'New employee was assigned');
	INSERT INTO TICKETHISTORY(ServiceTicketID,EmployeeID,TicketChangeDate,DetailsNote) VALUES
	(1, 1, '2021-02-20', 'Note was added');
	INSERT INTO TICKETHISTORY(ServiceTicketID,EmployeeID,TicketChangeDate,DetailsNote) VALUES
	(1, 1, '2021-02-20', 'Note was added');

	INSERT INTO INVENTORYSERVICE(ServiceTicketID) VALUES
	(2);
	INSERT INTO INVENTORYSERVICE(ServiceTicketID) VALUES
	(2);
	INSERT INTO INVENTORYSERVICE(ServiceTicketID) VALUES
	(4);
	INSERT INTO INVENTORYSERVICE(ServiceTicketID) VALUES
	(4);
	INSERT INTO INVENTORYSERVICE(ServiceTicketID) VALUES
	(4);

	INSERT INTO INVENTORYITEM(InventoryServiceID,ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	(1, 'Antique Hand Mirror', 'Hand mirror dating from 1300 AD', 1500.00, '2021-02-10');
	INSERT INTO INVENTORYITEM(InventoryServiceID,ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	(1, 'Chinese Scroll', 'Chinese scroll from the Qin Dynasty', 2000.00, '2021-02-10');
	INSERT INTO INVENTORYITEM(InventoryServiceID,ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	(2, 'Roman Vase', 'Roman vase from ~1100 AD', 500.00, '2021-03-15');
	INSERT INTO INVENTORYITEM(InventoryServiceID,ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	(2, 'Roman Sword', 'Roman sword from ~1100 AD', 1000.00, '2021-03-15');
	INSERT INTO INVENTORYITEM(InventoryServiceID,ItemName,ItemDesc,ItemCost,InventoryDate) VALUES
	(3, 'Roman Gold Coin', 'Roman currency from ~1100 AD', 300.00, '2021-03-15');

	INSERT INTO EQUIPMENTSERVICE(ServiceTicketID,EquipmentID) VALUES
	(5, 1);
	INSERT INTO EQUIPMENTSERVICE(ServiceTicketID,EquipmentID) VALUES
	(5, 2);
	INSERT INTO EQUIPMENTSERVICE(ServiceTicketID,EquipmentID) VALUES
	(5, 3);

SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM SERVICE;
SELECT * FROM AUCTION;
SELECT * FROM ADDITIONALSERVICE;
SELECT * FROM SERVICETICKET;
SELECT * FROM NOTES;
SELECT * FROM TICKETHISTORY;
SELECT * FROM INVENTORYITEM;
SELECT * FROM EQUIPMENT;
SELECT * FROM EQUIPMENTSERVICE;
SELECT * FROM INVENTORYSERVICE;
SELECT * FROM LOOKAT;
SELECT * FROM LookAtNotification;
SELECT * FROM LookAtNotifConfirm;

Select T.ServiceTicketID, C.FirstName + ' ' + C.LastName as CustomerName, E.FirstName + ' ' + E.LastName as EmployeeName,
                T.Service, T.TicketStatus, T.TicketOpenDate
                FROM Customer C, Employee E, ServiceTicket T
                WHERE T.CustomerID = C.CustomerID AND T.InitiatingEmployeeID = E.EmployeeID AND T.Archived IS NULL AND T.CustomerID = 1

SELECT Ii.ItemName, Ii.ItemDesc, Ii.ItemCost, Ii.InventoryDate FROM InventoryItem as Ii INNER JOIN InventoryService ON Ii.InventoryServiceID = InventoryService.InventoryServiceID WHERE InventoryService.InventoryServiceID = 1 AND ServiceTicket.Archived = null