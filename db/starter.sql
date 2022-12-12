# Create a new database called students
# for testing
CREATE DATABASE StoreSaver;

# Special MySQL command to show all the databases
# the current user has access to
SHOW DATABASES;

# Set Enrollment as the current database
# All subsequent db commands will be executed in the
# context of Enrollment
USE StoreSaver;

# Create a new user with username mark that can log in
# from any ip address (the %) with password as indicated.
CREATE USER 'boss'@'%'
   IDENTIFIED BY 'runstheworld1234';

# Allow user mark@% to perform any operations on
# the database Enrollment
GRANT ALL PRIVILEGES ON StoreSaver.* TO 'boss'@'%';

CREATE TABLE employee
(
employeeID INTEGER NOT NULL,
ssn INTEGER NOT NULL,
startDate TEXT,
weeklyHours INTEGER,
dateEmployed TEXT,
firstName TEXT,
middleName TEXT,
lastName TEXT,
phoneNo INTEGER,
email TEXT,
address TEXT,
dateOfBirth TEXT,
storeID INTEGER NOT NULL UNIQUE,
inventoryID INTEGER UNIQUE,
managerID INTEGER NOT NULL UNIQUE,
PRIMARY KEY(employeeID, ssn)
);

CREATE TABLE inventory
(
	inventoryID INTEGER PRIMARY KEY NOT NULL,
	inventoryDataID INTEGER UNIQUE
);

CREATE TABLE inventoryItem
(
	inventoryItemID INTEGER PRIMARY KEY NOT NULL,
	itemQuantity INTEGER,
	inventoryID INTEGER UNIQUE,
	itemID INTEGER UNIQUE
);

CREATE TABLE inventoryData
(
	inventoryDataID INTEGER PRIMARY KEY NOT NULL,
	estimatedSales REAL,
	estimatedArrival INTEGER,
materialsCost REAL
);

CREATE TABLE upperManagement
(
	managerID INTEGER NOT NULL,
	employeeID INTEGER NOT NULL,
	inventoryDataID INTEGER UNIQUE,
	salesInfoID INTEGER UNIQUE,
	PRIMARY KEY(managerID, employeeID)
);

CREATE TABLE manageStore
(
	managerID INTEGER UNIQUE NOT NULL,
	employeeID INTEGER UNIQUE NOT NULL,
	storeID INTEGER UNIQUE NOT NULL,
	PRIMARY KEY (managerID, employeeID)
);

CREATE TABLE item
(
	itemID INTEGER PRIMARY KEY NOT NULL,
	itemName TEXT NOT NULL,
	unitPrice REAL,
	materialsCost INTEGER,
	brandName TEXT UNIQUE,
	categoryName TEXT UNIQUE
);

CREATE TABLE category
(
	categoryName TEXT PRIMARY KEY NOT NULL,
	sectorOfGood TEXT,
	description TEXT
);

CREATE TABLE brand
(
	brandName TEXT PRIMARY KEY NOT NULL,
	country TEXT
);
CREATE TABLE listItem
(
	itemID INTEGER NOT NULL,
	listID INTEGER NOT NULL,
	PRIMARY KEY (itemID, listID)
);

CREATE TABLE salesInfo
(
	salesInfoID INTEGER PRIMARY KEY NOT NULL,
	totalSales REAL,
	avgSalesPerDay REAL,
	productsSoldByRegion INTEGER
);

CREATE TABLE store
(
	storeID INTEGER PRIMARY KEY NOT NULL,
	name TEXT,
	address TEXT
);

CREATE TABLE customer
(
	customerID INTEGER PRIMARY KEY NOT NULL,
	username TEXT,
	password TEXT,
	firstName TEXT,
	middleName TEXT,
	lastName TEXT,
	dateOfBirth TEXT,
	phoneNumber INTEGER,
	email TEXT UNIQUE,
	listID INTEGER UNIQUE,
	invoiceID INTEGER UNIQUE
);

CREATE TABLE shoppingList
(
	listID INTEGER PRIMARY KEY NOT NULL,
	totalBill INTEGER DEFAULT == 0,
	invoiceID INTEGER UNIQUE NOT NULL,
	storeID INTEGER UNIQUE NOT NULL
)
CREATE TABLE invoiceItem
(
	itemID INTEGER UNIQUE NOT NULL,
	invoiceID INTEGER UNIQUE NOT NULL,
	unitQuantity INTEGER,
	unitPrice REAL
);





