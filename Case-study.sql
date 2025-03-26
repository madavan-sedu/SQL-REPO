CREATE DATABASE ProjectManagement;
USE ProjectManagement;

-- Projects Table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY IDENTITY(1,1),
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Not Started', 'In Progress', 'Completed'))
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('Manager', 'Developer', 'Tester'))
);

-- Tasks Table
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY IDENTITY(1,1),
    project_id INT,
    task_name VARCHAR(255) NOT NULL,
    assigned_date DATE,
    due_date DATE,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pending', 'Ongoing', 'Completed')),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE
);

-- Project Assignments Table (Many-to-Many Relationship)
CREATE TABLE Project_Assignments (
    assignment_id INT PRIMARY KEY IDENTITY(1,1),
    project_id INT,
    employee_id INT,
    role VARCHAR(100),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
);

-- Task Assignments Table (Assigning Employees to Tasks)
CREATE TABLE Task_Assignments (
    task_assignment_id INT PRIMARY KEY IDENTITY(1,1),
    task_id INT,
    employee_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
);

