
-- Create db
 CREATE DATABASE bookstoredb;
 -- Use Db
  USE bookstoredb;
--Create Table Books
     CREATE TABLE Books (
       BookID INT NOT NULL AUTO_INCREMENT,
       Title VARCHAR(255) NOT NULL,
       Author VARCHAR(255),
       PublishedYear INT,
       PRIMARY KEY (BookID),
       Genre VARCHAR(100),
       Price DECIMAL(10, 2));
-- Add column to the Books Table
    ALTER TABLE Books
    ADD COLUMN Genre VARCHAR(100);
    ALTER TABLE Books
    ADD COLUMN Price DECIMAL(10,2);
--Inserting Values into Table Books
    INSERT INTO Books (Title, Author, Genre, PublishedYear, Price) 
    VALUES
    ('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 9.99),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 15.75),
    ('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Non-Fiction', 2011, 18.50),
    ('The Alchemist', 'Paulo Coelho', 'Philosophical Fiction', 1988, 10.49),
    ('Becoming', 'Michelle Obama', 'Biography', 2018, 20.00),
    ('Dune', 'Frank Herbert', 'Science Fiction', 1965, 12.89),
    ('The Art of War', 'Sun Tzu', 'Philosophy', -500, 8.99), -- Approximate year
    ('A Game of Thrones', 'George R.R. Martin', 'Fantasy', 1996, 14.99),
    ('The Lean Startup', 'Eric Ries', 'Business', 2011, 19.99),
    ('The Diary of a Young Girl', 'Anne Frank', 'Memoir', 1947, 7.99);
-- created Authors Table
    CREATE TABLE Authors (
        AuthorID INT NOT NULL AUTO_INCREMENT,
        Name VARCHAR(255) NOT NULL,
        BirthYear INT,
        PRIMARY KEY (AuthorID)
    );
-- inserting into Authors Table
    INSERT INTO Authors (Name, BirthYear) 
    VALUES
    ('J.K. Rowling', 1965),
    ('George Orwell', 1903),
    ('J.R.R. Tolkien', 1892);
-- creating Book Author Table
    CREATE TABLE book_author (
        BookID INT NOT NULL,
        AuthorID INT NOT NULL,
        PRIMARY KEY (BookID, AuthorID),
        FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
        FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
    );
-- link books and Authors
    INSERT INTO book_author (BookID, AuthorID) 
    VALUES
    (1, 1), 
    (2, 2), 
    (3, 3); 
-- book language Table 
    CREATE TABLE Book_Language (
        LanguageID INT NOT NULL AUTO_INCREMENT,
        LanguageName VARCHAR(100) NOT NULL,
        PRIMARY KEY (LanguageID)
    );
-- inserting Language fields into the Table
    INSERT INTO Book_Language (LanguageName) 
    VALUES 
    ('English'),
    ('French'),
    ('Spanish'),
    ('German'),
    ('Chinese');
-- Publisher Table
    CREATE TABLE Publisher (
        PublisherID INT NOT NULL AUTO_INCREMENT,
        PublisherName VARCHAR(255) NOT NULL,
        EstablishedYear INT,
        PRIMARY KEY (PublisherID)
    );
-- Populating The publisher Table
    INSERT INTO Publisher (PublisherName, EstablishedYear) 
    VALUES
    ('Penguin Random House', 1925),
    ('HarperCollins', 1989),
    ('Macmillan Publishers', 1843),
    ('Simon & Schuster', 1924),
    ('Hachette Book Group', 1826),
    ('Scholastic Corporation', 1920),
    ('Bloomsbury Publishing', 1986),
    ('Oxford University Press', 1586),
    ('Pearson Education', 1844),
    ('Wiley', 1807);
-- Customer Table creation
    CREATE TABLE Customer (
        CustomerID INT NOT NULL AUTO_INCREMENT,
        FirstName VARCHAR(255) NOT NULL,
        LastName VARCHAR(255) NOT NULL,
        Email VARCHAR(255),
        PhoneNumber VARCHAR(15),
        PRIMARY KEY (CustomerID)
    );
-- Populating the Customers Table
    INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber) 
    VALUES
    ('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
    ('Ali', 'Khan', 'ali.khan@example.com', '071-234-5678'),
    ('Mary', 'Johnson', 'mary.johnson@example.com', '456-789-1230'),
    ('Robert', 'Brown', 'robert.brown@example.com', '789-123-4567'),
    ('Nancy', 'Wilson', 'nancy.wilson@example.com', '012-345-6789'),
    ('David', 'Kim', 'david.kim@example.com', '321-654-9870'),
    ('Grace', 'Lee', 'grace.lee@example.com', '098-765-4321'),
    ('Ahmed', 'Abdi', 'ahmed.abdi@example.com', '074-123-4567'),
    ('Clara', 'Ngugi', 'clara.ngugi@example.com', '070-654-3210');
-- creating the Address_Status table
    CREATE TABLE Address_Status (
        AddressStatusID INT NOT NULL AUTO_INCREMENT,
        StatusName VARCHAR(50) NOT NULL,
        PRIMARY KEY (AddressStatusID)
    );
-- Customer Address
    CREATE TABLE Customer_Address (
        AddressID INT NOT NULL AUTO_INCREMENT,
        CustomerID INT NOT NULL,
        Street VARCHAR(255) NOT NULL,
        City VARCHAR(100) NOT NULL,
        State VARCHAR(100),
        Country VARCHAR(100),
        PostalCode VARCHAR(20),
        AddressStatusID INT NOT NULL,
        PRIMARY KEY (AddressID),
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
        FOREIGN KEY (AddressStatusID) REFERENCES Address_Status(AddressStatusID)
   );
-- -- Populating Customer Address Table
        INSERT INTO Customer_Address (CustomerID, Street, City, State, Country, PostalCode, AddressStatusID) 
        VALUES
        (1, '123 Elm Street', 'Nairobi', 'Nairobi County', 'Kenya', '00100', 1), -- Current
        (2, '456 Oak Avenue', 'Mombasa', 'Mombasa County', 'Kenya', '80100', 1), -- Current
        (3, '789 Pine Lane', 'Kisumu', 'Kisumu County', 'Kenya', '40100', 2), -- Old
        (4, '321 Cedar Drive', 'Eldoret', 'Uasin Gishu County', 'Kenya', '30100', 1), -- Current
        (5, '654 Willow Road', 'Nakuru', 'Nakuru County', 'Kenya', '20100', 2), -- Old
        (6, '987 Maple Street', 'Thika', 'Kiambu County', 'Kenya', '01000', 1), -- Current
        (7, '147 Birch Avenue', 'Nyeri', 'Nyeri County', 'Kenya', '10100', 1), -- Current
        (8, '258 Chestnut Blvd', 'Machakos', 'Machakos County', 'Kenya', '90100', 2), -- Old
        (9, '369 Cypress Court', 'Naivasha', 'Nakuru County', 'Kenya', '20117', 1), -- Current
        (10, '741 Spruce Terrace', 'Meru', 'Meru County', 'Kenya', '60200', 1); -- Current

-- User Roles
    CREATE ROLE Admin;
    CREATE ROLE Editor;
    CREATE ROLE Viewer;
-- Granting Privileges to Roles
-- admin role
    GRANT ALL PRIVILEGES ON bookstoredb.* TO Admin;
-- Editor Role
    GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.* TO Editor;
-- Viewer Role
    GRANT SELECT ON bookstoredb.* TO Viewer;
 -- Creating the Users
    CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
    CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'password';
    CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'password';
-- Assigning the Roles to the Users
    GRANT Admin TO 'admin_user'@'localhost';
    GRANT Editor TO 'editor_user'@'localhost';
    GRANT Viewer TO 'viewer_user'@'localhost';























