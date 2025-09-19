# Library Management System - Project Progress

## Progress Summary

| Requirement | Status | Completion |
|-------------|--------|------------|
| User Roles (Borrower/Manager) | Implemented | 100% |
| Login with user rights | Implemented | 100% |
| View book list with all attributes | Implemented | 100% |
| Register to borrow books | Implemented | 100% |
| Book management (Add/Edit/Delete) | Implemented | 100% |
| Undo delete action for books | Not implemented | 0% |
| User management (Add/Edit/Delete) | Implemented | 100% |
| Book status management | Implemented | 100% |
| Borrowing/returning history | Implemented | 100% |
| Frontend implementation | Not implemented | 0% |
| **BACKEND API COMPLETION** | | **~89%** |
| **OVERALL PROJECT COMPLETION** | | **~45%** |

## Project Overview
This project is a Ruby on Rails application for library management with two user roles:
- Borrowers: Can view books and borrow them
- Managers: Can manage books, users, and track borrowing history

## Current Progress

### Implemented Features

#### Database Schema
- ✅ User model with roles (borrower/manager)
- ✅ Book model with relevant attributes (name, author, amount, releaseYear)
- ✅ Borrow model to track current borrows
- ✅ History model to track all borrowing activities

#### Authentication
- ✅ JWT-based authentication system
- ✅ Login functionality with user roles
- ✅ Registration functionality
- ✅ Role-based authorization (admin access control)

#### Book Management
- ✅ List all books API endpoint
- ✅ View book details API endpoint
- ✅ Create new books API endpoint (manager only)
- ✅ Update existing books API endpoint (manager only)
- ✅ Delete books API endpoint (manager only)

#### Borrowing System
- ✅ Borrow book functionality
- ✅ Return book functionality
- ✅ Borrowing history tracking

#### User Management
- ✅ List all users API endpoint (manager only)
- ✅ View user details API endpoint (manager only)
- ✅ Create new users API endpoint (manager only)
- ✅ Update existing users API endpoint (manager only)
- ✅ Delete users API endpoint (manager only)

### Features In Progress

#### Book Management
- ⏳ Ability to undo delete action within a time period

### Missing Features

#### Book Management
- ❌ Soft delete functionality for books (to enable undo delete action)
- ❌ Restore deleted books functionality

#### User Interface
- ❌ Frontend implementation for all functionality

## API Endpoints

### Authentication
- `POST /api/v1/login` - User authentication
- `POST /api/v1/register` - User registration

### Books
- `GET /api/v1/books` - List all books
- `GET /api/v1/books/:id` - View book details
- `POST /api/v1/books` - Create a new book (manager only)
- `PUT /api/v1/books/:id` - Update a book (manager only)
- `DELETE /api/v1/books/:id` - Delete a book (manager only)
- `POST /api/v1/books/:id/borrow` - Borrow a book
- `POST /api/v1/books/:id/return` - Return a borrowed book

### Users
- `GET /api/v1/users` - List all users (manager only)
- `GET /api/v1/users/:id` - View user details (manager only)
- `POST /api/v1/users` - Create a new user (manager only)
- `PUT /api/v1/users/:id` - Update a user (manager only)
- `DELETE /api/v1/users/:id` - Delete a user (manager only)

### Borrows
- `GET /api/v1/borrows` - List all borrows
- `GET /api/v1/borrows/:id` - View borrow details

## Next Steps

1. **Implement Soft Delete for Books**:
   - Add `deleted_at` column to the books table
   - Modify Book model to include default scope that excludes deleted books
   - Update controller to soft delete books instead of hard delete

2. **Implement Restore Books Feature**:
   - Add endpoint to restore previously deleted books
   - Set time limit for restoration (e.g., 30 days)

3. **Frontend Development**:
   - Develop UI for both borrower and manager roles
   - Implement all required functionality in the frontend

## Technical Debt

1. **Security Improvements**:
   - Move JWT secret to environment variables
   - Add proper error handling for JWT operations

2. **Code Quality**:
   - Add comprehensive tests
   - Improve validation on models
   - Standardize controller responses

3. **Database Optimizations**:
   - Add appropriate indexes to improve query performance
   - Add foreign key constraints to ensure referential integrity
