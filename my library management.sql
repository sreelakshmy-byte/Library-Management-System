CREATE database Library;
use Library;
create table branch(
Branch_no int primary key,
manager_id int,
Branch_address varchar(255),
contact_no varchar(15)
); 

create table Employee (
Emp_id int primary key,
Emp_name varchar (50),
position  varchar(150),
salary decimal(10,2),
Branch_no int,
foreign key (Branch_no)references  Branch(Branch_no)
);

create table Books(
ISBN varchar(255) primary key,
Book_title varchar(255),
Category varchar(100),
Rental_price decimal (10,0),
Status enum('Yes','no'),
Author varchar(255),
Publisher varchar(255)
);

create table customer(
Customer_id int primary key,
Customer_name varchar(255),
Customer_address varchar(255),
Reg_date date
);
create table IssueStatus(
Issue_id int primary key,
Issued_cust int,
Issued_book_name varchar(255),
issue_date Date,
Isbn_book VARCHAR(20),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
create table ReturnStatus(
Return_id int primary key,
Return_cust int,
Return_Book_name varchar(255),
Return_date date,
Isbn_book2 varchar(20),
FOREIGN KEY (Return_cust)REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2)REFERENCES Books(ISBN)
);
SHOW TABLES;

INSERT INTO branch (Branch_no, manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, Springfield', '555-1234'),
(2, 102, '456 Oak St, Rivertown', '555-5678'),
(3, 103, '789 Pine St, Laketown', '555-8765');
describe branch;
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'John Doe', 'Manager', 60000, 1),
(102, 'Jane Smith', 'Manager', 62000, 2),
(103, 'Emily Davis', 'Manager', 59000, 3),
(104, 'Michael Brown', 'Assistant', 40000, 1),
(105, 'Alice Johnson', 'Clerk', 35000, 2),
(106, 'Robert Wilson', 'Clerk', 37000, 3);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(107, 'Ethan Clark', 'Assistant', 40000, 1),
(108, 'Liam Scott', 'Clerk', 35000, 1),
(109, 'Noah White', 'Assistant', 39000, 1),
(110, 'Emma Martinez', 'Clerk', 36000, 1),
(111, 'Ava Anderson', 'Clerk', 35500, 1);
describe Employee;
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 30.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-1-86197-876-9', 'A Brief History of Time', 'Science history', 40.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-0-7432-7356-5', 'To Kill a Mockingbird', 'Fiction', 25.00, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-452-28423-4', '1984', 'Dystopian', 35.00, 'yes', 'George Orwell', 'Secker & Warburg'),
('978-0-14-303943-3', 'The Selfish Gene', 'Science', 45.00, 'no', 'Richard Dawkins', 'Oxford University Press');
describe Books;
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(201, 'William Johnson', '123 Maple St, Springfield', '2023-01-15'),
(202, 'Sophia Brown', '456 Elm St, Rivertown', '2022-06-20'),
(203, 'James Miller', '789 Oak St, Laketown', '2021-12-05'),
(204, 'Olivia Wilson', '321 Pine St, Springfield', '2023-07-10'),
(205, 'Mia Davis', '654 Birch St, Rivertown', '2023-06-25');
describe customer;
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(301, 201, 'The Great Gatsby', '2023-07-01', '978-3-16-148410-0'),
(302, 202, 'A Brief History of Time', '2023-06-15', '978-1-86197-876-9'),
(303, 204, '1984', '2023-07-11', '978-0-452-28423-4');
describe  IssueStatus;
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(401, 201, 'The Great Gatsby', '2023-07-15', '978-3-16-148410-0'),
(402, 202, 'A Brief History of Time', '2023-06-30', '978-1-86197-876-9');
describe ReturnStatus;
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

SELECT Customer.Customer_name 
FROM Customer 
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust 
WHERE Reg_date < '2022-01-01' AND IssueStatus.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

SELECT DISTINCT Customer.Customer_name 
FROM IssueStatus 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SET SQL_SAFE_UPDATES = 0;

UPDATE Books
SET Category = 'Science history'
WHERE Book_title = 'A Brief History of Time';
SET SQL_SAFE_UPDATES = 1;

SELECT Book_title 
FROM Books 
WHERE Category LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

SELECT Employee.Emp_name, Branch.Branch_address 
FROM Employee 
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

SELECT DISTINCT Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Books.Rental_Price > 25;
