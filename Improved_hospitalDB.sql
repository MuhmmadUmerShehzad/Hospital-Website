-- =========================
-- DATABASE
-- =========================
CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO

-- =========================
-- 1. DEPARTMENTS
-- =========================
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY IDENTITY(1,1),
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

-- =========================
-- 2. DESIGNATIONS
-- =========================
CREATE TABLE Designations (
    designation_id INT PRIMARY KEY IDENTITY(1,1),
    designation_name VARCHAR(50) NOT NULL UNIQUE
);

-- =========================
-- 3. EMPLOYEES
-- =========================
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY IDENTITY(1,1),
    dept_id INT NOT NULL,
    designation_id INT NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL CHECK (date_of_birth < GETDATE()),
    
    CONSTRAINT FK_Employee_Department 
        FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),

    CONSTRAINT FK_Employee_Designation 
        FOREIGN KEY (designation_id) REFERENCES Designations(designation_id)
);

-- =========================
-- 4. ADD HOD (AFTER EMPLOYEE EXISTS)
-- =========================
ALTER TABLE Departments
ADD HOD_emp_id INT NULL;

ALTER TABLE Departments
ADD CONSTRAINT FK_Department_HOD
FOREIGN KEY (HOD_emp_id) REFERENCES Employees(emp_id);

-- =========================
-- 5. PATIENTS
-- =========================
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY IDENTITY(1,1),
    p_name VARCHAR(50) NOT NULL,
    date_of_birth DATE CHECK (date_of_birth < GETDATE()),
    registered_by INT NULL,

    CONSTRAINT FK_Patient_Employee
        FOREIGN KEY (registered_by) REFERENCES Employees(emp_id)
);

-- =========================
-- 6. VISITS (IMPORTANT ENTITY)
-- =========================
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_date DATETIME DEFAULT GETDATE(),
    diagnosis VARCHAR(255),

    CONSTRAINT FK_Visit_Patient 
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),

    CONSTRAINT FK_Visit_Doctor 
        FOREIGN KEY (doctor_id) REFERENCES Employees(emp_id)
);

-- =========================
-- 7. MEDICINES
-- =========================
CREATE TABLE Medicines (
    med_id INT PRIMARY KEY IDENTITY(1,1),
    med_name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- 8. PRESCRIPTIONS
-- =========================
CREATE TABLE Prescriptions (
    presc_id INT PRIMARY KEY IDENTITY(1,1),
    visit_id INT NOT NULL,
    prescribed_by INT NOT NULL,

    CONSTRAINT FK_Prescription_Visit
        FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),

    CONSTRAINT FK_Prescription_Doctor
        FOREIGN KEY (prescribed_by) REFERENCES Employees(emp_id)
);

-- =========================
-- 9. PRESCRIPTION DETAILS (M:M)
-- =========================
CREATE TABLE Prescription_Details (
    presc_id INT,
    med_id INT,
    dosage VARCHAR(50),
    duration VARCHAR(50),

    PRIMARY KEY (presc_id, med_id),

    CONSTRAINT FK_PD_Prescription 
        FOREIGN KEY (presc_id) REFERENCES Prescriptions(presc_id),

    CONSTRAINT FK_PD_Medicine 
        FOREIGN KEY (med_id) REFERENCES Medicines(med_id)
);

-- =========================
-- 10. EQUIPMENT
-- =========================
CREATE TABLE Equipment (
    eq_id INT PRIMARY KEY IDENTITY(1,1),
    eq_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    status VARCHAR(20) 
        CHECK (status IN ('Available','In Use','Maintenance')) DEFAULT 'Available',
    purchase_date DATE,

    CONSTRAINT FK_Equipment_Department
        FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- =========================
-- 11. USERS (FOR LOGIN SYSTEM)
-- =========================
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    User_password VARCHAR(255) NOT NULL,
    emp_id INT NULL,
    role_name VARCHAR(50) NOT NULL,

    CONSTRAINT FK_User_Employee
        FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- =========================
-- ROLES
-- =========================

-- HR
CREATE ROLE HR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO HR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO HR;

-- Doctor
CREATE ROLE Doctor;
GRANT SELECT, INSERT, UPDATE ON Patients TO Doctor;
GRANT SELECT, INSERT, UPDATE ON Visits TO Doctor;
GRANT SELECT, INSERT, UPDATE ON Prescriptions TO Doctor;
GRANT SELECT, INSERT, UPDATE ON Prescription_Details TO Doctor;

-- Front Desk
CREATE ROLE FrontDesk;
GRANT SELECT, INSERT ON Patients TO FrontDesk;
GRANT SELECT, INSERT ON Visits TO FrontDesk;

-- Equipment Oversight
CREATE ROLE EquipmentOversight;
GRANT SELECT, INSERT, UPDATE ON Equipment TO EquipmentOversight;

SELECT * FROM Users
SELECT * FROM Departments
SELECT * FROM Designations
SELECT * FROM Equipment
SELECT * FROM Patients
SELECT * FROM Visits
SELECT * FROM Prescriptions
SELECT * FROM Prescription_Details
SELECT * FROM Employees


INSERT INTO Departments (dept_name)
VALUES 
('Cardiology'),
('Radiology'),
('Emergency'),
('Pediatrics'),
('Oncology'),
('Neurology');

INSERT INTO Designations (designation_name)
VALUES 
('Doctor'),
('Nurse'),
('Receptionist'),
('Technician'),
('Pharmacist'),
('Administrator');

INSERT INTO Employees (dept_id, designation_id, emp_name, date_of_birth)
VALUES 
(1, 1, 'Dr. Ali Ahmed', '1985-06-15'),
(2, 4, 'Umer Shehzad', '1998-03-22'),
(3, 3, 'Sara Khan', '2000-11-10'),
(4, 1, 'Dr. Sarah Connor', '1975-10-02'),
(5, 1, 'Dr. Bruce Banner', '1980-12-18'),
(1, 2, 'Nurse Joy', '1995-08-20'),
(3, 3, 'John Doe', '1990-01-01');

UPDATE Departments
SET HOD_emp_id = 1
WHERE dept_id = 1;

UPDATE Departments
SET HOD_emp_id = 4
WHERE dept_id = 4;

UPDATE Departments
SET HOD_emp_id = 5
WHERE dept_id = 5;

INSERT INTO Patients (p_name, date_of_birth, registered_by)
VALUES 
('Ali Raza', '2002-09-12', 3),
('Hassan Ali', '1995-04-18', 3),
('Jane Watson', '1988-11-30', 3),
('Peter Parker', '2001-05-15', 7),
('Clark Kent', '1979-02-28', 3);

INSERT INTO Visits (patient_id, doctor_id, diagnosis)
VALUES 
(1, 1, 'Flu and fever'),
(2, 1, 'Chest pain observation'),
(3, 4, 'Common Cold checkup'),
(4, 5, 'Oncology routine checkup'),
(5, 1, 'Arrhythmia review');
    
INSERT INTO Medicines (med_name)
VALUES 
('Paracetamol'),
('Amoxicillin'),
('Ibuprofen'),
('Loratadine'),
('Atorvastatin'),
('Metformin');

INSERT INTO Prescriptions (visit_id, prescribed_by)
VALUES 
(1, 1),
(2, 1),
(3, 4),
(4, 5),
(5, 1);

INSERT INTO Prescription_Details (presc_id, med_id, dosage, duration)
VALUES 
(1, 1, '500mg', '3 days'),
(1, 3, '200mg', '5 days'),
(2, 2, '250mg', '7 days'),
(3, 4, '10mg', '10 days'),
(4, 5, '20mg', '30 days'),
(5, 1, '500mg', '15 days');

INSERT INTO Equipment (eq_name, dept_id, status, purchase_date)
VALUES 
('ECG Machine', 1, 'Available', '2023-01-10'),
('X-Ray Machine', 2, 'In Use', '2022-05-20'),
('Ventilator', 3, 'Available', '2024-03-12'),
('MRI Scanner', 2, 'Maintenance', '2021-08-05'),
('Infusion Pump', 4, 'Available', '2023-11-22');

INSERT INTO Users (username, User_password, emp_id, role_name)
VALUES 
('admin', 'admin', NULL, 'admin'),
('umer', '123', 2, 'employee'),
('Ali', '123', NULL, 'patient'),
('sarah', 'password123', 4, 'employee'),
('bruce', 'gammaRay', 5, 'employee');