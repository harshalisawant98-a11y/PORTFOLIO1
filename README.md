# PORTFOLIO1
LIBRARYMANAGEMENT.HTML
# 📚 LibraryDB Project

## Overview
LibraryDB is a structured SQL database and interactive dashboard designed to analyze library operations. It tracks borrowing trends, overdue books, and publication insights to support **data-driven decision-making** in library management.

## Database Design
- **Database Name:** LibraryDB  
- **Tables:**
  - `Books` (BookID, Title, Author, PublishedYear)
  - `IssuedBooks` (IssueID, BookID, IssueDate, ReturnDate)
- **Relationships:** One-to-many link between `Books` and `IssuedBooks` via `BookID`
- **View Created:** `BorrowStats` – summarizes borrow counts per book

## SQL Analytics
- **Total Books:**  
  ```sql
  SELECT COUNT(*) FROM Books;
