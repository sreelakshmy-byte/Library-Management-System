Library Management System: Project Overview

Introduction:
The Library Management System (LMS) is designed to manage and streamline the various operations within a library. This system provides comprehensive functionality to handle information regarding books, branches, employees, customers, and the status of book issues and returns. It is designed to keep track of the library’s collection, monitor book availability, manage customer interactions, and ensure that library operations run smoothly.

Database Structure:
The LMS database, named library, consists of six core tables:

Branch: This table stores information about the library branches, including the branch number, manager ID, branch address, and contact number.

Employee: This table contains details of the library employees, such as employee ID, name, position, salary, and the branch they are associated with. The Branch_no serves as a foreign key, linking employees to their respective branches.

Books: This table holds the details of the books available in the library, including the ISBN (primary key), title, category, rental price, availability status, author, and publisher.

Customer: This table records customer details, including customer ID, name, address, and registration date.

IssueStatus: This table tracks the status of books issued to customers. It includes details such as the issue ID, customer who issued the book, the date of issue, and the ISBN of the issued book.

ReturnStatus: This table manages the information related to the return of books, including the return ID, customer who returned the book, the return date, and the ISBN of the returned book.

Queries and Analysis:-

1.Retrieve Available Books: To find books currently available for rental, the system retrieves the book title, category, and rental price for books marked as available

2.List Employees by Salary: The system can list employees along with their salaries, sorted in descending order of salary.

3.Issued Books and Customers: It can retrieve the titles of books and the customers who have issued those books.

4.Count of Books by Category: The system can display the total count of books available in each category.

5.Employees with High Salaries: Retrieve the names and positions of employees whose salaries exceed Rs. 50,000.

6.Inactive Customers: Identify customers who registered before January 1, 2022, and have not issued any books.

7.Employee Count by Branch: The system can display branch numbers and the total count of employees in each branch.

8.June 2023 Issuances: Display the names of customers who have issued books in June 2023.

9.ooks Containing 'History': Retrieve titles of books that belong to the 'History' category.

10.Branches with More than 5 Employees: List branch numbers along with the count of employees for branches having more than 5 employees.

11.Branch Managers and Addresses: Retrieve the names of employees who manage branches and their respective branch addresses.

12.Customers with High Rental Books: Display the names of customers who have issued books with a rental price higher than Rs. 25.


