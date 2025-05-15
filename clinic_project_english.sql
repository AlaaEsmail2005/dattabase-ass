
-- Create Specialties Table
CREATE TABLE Specialties (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Doctors Table
CREATE TABLE Doctors (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    specialty_id INT,
    FOREIGN KEY (specialty_id) REFERENCES Specialties(id)
);

-- Create Patients Table
CREATE TABLE Patients (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Create Receptionists Table
CREATE TABLE Receptionists (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    time TIME,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);

-- Create Users Table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    role VARCHAR(20) -- admin, doctor, patient, receptionist
);

-- Initial Data

-- Specialties
INSERT INTO Specialties VALUES
(1, 'Internal Medicine'),
(2, 'Pediatrics'),
(3, 'Dermatology'),
(4, 'Dentistry'),
(5, 'ENT');

-- Doctors
INSERT INTO Doctors VALUES
(1, 'Dr. Ahmed Mohamed', '01012345678', 1),
(2, 'Dr. Sara Ali', '01098765432', 2),
(3, 'Dr. Khaled Samir', '01111222333', 3),
(4, 'Dr. Mona Hussein', '01234567890', 4),
(5, 'Dr. Fahd Salem', '01555666777', 5);

-- Patients
INSERT INTO Patients VALUES
(1, 'Mohamed Said', '0123123123', 'mohamed@email.com'),
(2, 'Ahmed Ali', '0111111111', 'ahmed@email.com'),
(3, 'Nada Hassan', '0102222333', 'nada@email.com'),
(4, 'Laila Khaled', '0103333444', 'laila@email.com'),
(5, 'Salem Mahmoud', '0123456000', 'salem@email.com'),
(6, 'Noor Adel', '0155554444', 'noor@email.com'),
(7, 'Hind Fouad', '0100099887', 'hend@email.com'),
(8, 'Alaa Omar', '0111122233', 'alaa@email.com'),
(9, 'Khaled Nasser', '0105566778', 'khaled@email.com'),
(10, 'Reham Mostafa', '0109988776', 'reham@email.com');

-- Receptionists
INSERT INTO Receptionists VALUES
(1, 'Amal Hussein'),
(2, 'Rami Gaber');

-- Appointments
INSERT INTO Appointments VALUES
(1, 1, 1, '2025-05-15', '09:00:00', 'Booked'),
(2, 2, 2, '2025-05-16', '10:00:00', 'Booked'),
(3, 3, 3, '2025-05-17', '11:30:00', 'Booked'),
(4, 4, 4, '2025-05-18', '14:00:00', 'Booked'),
(5, 5, 5, '2025-05-19', '15:00:00', 'Booked'),
(6, 6, 1, '2025-05-20', '09:00:00', 'Booked'),
(7, 7, 2, '2025-05-20', '11:00:00', 'Booked'),
(8, 8, 3, '2025-05-20', '13:00:00', 'Booked'),
(9, 9, 4, '2025-05-21', '10:30:00', 'Booked'),
(10, 10, 5, '2025-05-21', '12:00:00', 'Booked'),
(11, 1, 1, '2025-05-22', '09:00:00', 'Booked'),
(12, 2, 2, '2025-05-23', '10:00:00', 'Booked'),
(13, 3, 3, '2025-05-23', '12:00:00', 'Booked'),
(14, 4, 4, '2025-05-24', '13:00:00', 'Booked'),
(15, 5, 5, '2025-05-25', '14:00:00', 'Booked');

-- Users
INSERT INTO Users VALUES
(1, 'admin', 'admin123', 'admin'),
(2, 'reception1', 'rec123', 'receptionist'),
(3, 'mohamed', '1234', 'patient'),
(4, 'dr_ahmed', 'docpass', 'doctor');

-- SQL Queries

-- 1. Retrieve all appointments for a specific patient
SELECT * FROM Appointments WHERE patient_id = 1;

-- 2. Count the number of appointments for each doctor
SELECT doctor_id, COUNT(*) AS appointment_count FROM Appointments GROUP BY doctor_id;

-- 3. List doctors in a specific specialty (e.g., Pediatrics)
SELECT name FROM Doctors WHERE specialty_id = 2;

-- 4. Appointments ordered by date and time
SELECT * FROM Appointments ORDER BY date, time;

-- 5. Search for a patient by name
SELECT * FROM Patients WHERE name LIKE '%Ahmed%';
