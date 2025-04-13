** **Bookstore Database (Boostore DB)** **
** **Overview** 
The Boostore Database is designed to manage and organize information for a bookstore efficiently. It provides robust structures for managing books, authors, publishers, customers, and addresses, along with functionality for many-to-many relationships and database access control.
** **Features** **
Manage books and their details such as genres, languages, and publishers.

Track authors and their associated books through a many-to-many relationship.

Maintain customer records, including multiple addresses and statuses (current, old).

Support user roles and groups to control database access.

** **Database Structure** **
Tables
Books: Contains book details like title, genre, published year, and price.

Authors: Maintains records of authors, including their names and birth years.

Book_Language: Lists the possible languages of books.

Publisher: Contains publishers and their establishment years.

Customer: Stores customer information such as names and contact details.

Customer_Address: Manages multiple addresses for customers and links them to statuses.

Address_Status: Contains address statuses like current and old.

Book_Author: Junction table managing the many-to-many relationship between books and authors.

** **Relationships** **
Book_Author connects Books and Authors with a many-to-many relationship.

Customer_Address links customers to their addresses, referencing address statuses.

Permissions and Roles
Roles like Admin, Editor, and Viewer control database access:

Admin: Full privileges across all tables.

Editor: Permissions to read, insert, update, and delete data.

Viewer: Read-only access to data.

Sample Data
Example entries for various tables:

Books: Includes popular titles like 1984, The Hobbit, and Pride and Prejudice.

Authors: Lists renowned authors such as George Orwell and J.R.R. Tolkien.

Publishers: Includes major publishing houses like Penguin Random House and HarperCollins.

Customers: Provides records for various customer profiles and their contact details.

Address_Status: Defines statuses such as "Current" and "Old."

** **Usage Instructions** **
Setup:

Create the tables using the provided SQL scripts.

Populate tables with sample data using INSERT statements.


Retrieve all books: SELECT * FROM Books;

Fetch all authors with their books: Use JOIN queries to connect Authors, Books, and Book_Author.

Customization:

Expand or modify tables and relationships to suit specific requirements.

Add more roles and permissions as needed.

![image alt](https://github.com/paulkeysdev/PLP-Database-admin-SQL_assignment/blob/6e6bb6bf89f793878bebb285ef15c7d5ed53d0a8/ERD%20DATABASE.drawio.png)




![image alt](https://github.com/paulkeysdev/PLP-Database-admin-SQL_assignment/blob/6e6bb6bf89f793878bebb285ef15c7d5ed53d0a8/WhatsApp%20Image%202025-04-13%20at%2022.23.03.jpeg)

