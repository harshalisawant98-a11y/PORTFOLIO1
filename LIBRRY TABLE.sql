CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table for Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    PublishedYear INT
);


-- Table for Issued Books
CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert Books
INSERT INTO Books (Title, Author, PublishedYear) VALUES
('SQL Basics', 'John Smith', 2015),
('Database Design', 'Mary Johnson', 2018),
('Advanced SQL', 'David Lee', 2020);



-- Issue Books
INSERT INTO IssuedBooks (BookID,  IssueDate, ReturnDate) VALUES
(1,  '2026-05-01', '2026-05-10'),
(2,  '2026-05-03', NULL);

-- KPI 1: Total Books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- KPI 2: Books Issued
SELECT COUNT(*) AS BooksIssued FROM IssuedBooks;

-- KPI 3: Overdue Books
SELECT COUNT(*) AS OverdueBooks FROM IssuedBooks WHERE ReturnDate IS NULL;

-- KPI 4: Most Borrowed Book
SELECT Title, COUNT(BookID) AS TimesBorrowed
FROM IssuedBooks
JOIN Books USING(BookID)
GROUP BY Title
ORDER BY TimesBorrowed DESC
LIMIT 1;

-- Borrowing Trends (Monthly)
SELECT MONTH(IssueDate) AS Month, COUNT(IssueID) AS Issues
FROM IssuedBooks
GROUP BY MONTH(IssueDate)
ORDER BY MONTH(IssueDate);

-- Publication Analysis
SELECT PublishedYear, COUNT(IssueID) AS BorrowCount
FROM IssuedBooks
JOIN Books USING(BookID)
GROUP BY PublishedYear
ORDER BY PublishedYear;


