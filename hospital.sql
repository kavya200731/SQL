CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);
INSERT INTO patients (patient_name, age, gender, phone)
VALUES
('Rahul Kumar', 25, 'Male', '9876543210'),
('Priya Sharma', 30, 'Female', '9123456780'),
('Arjun Reddy', 40, 'Male', '9988776655');
SELECT * FROM patients;
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50)
);
INSERT INTO doctors (doctor_name, specialization)
VALUES
('Dr. Rao', 'Cardiology'),
('Dr. Mehta', 'Neurology'),
('Dr. Singh', 'Orthopedics');
SELECT * FROM doctors;
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
INSERT INTO appointments (patient_id, doctor_id, appointment_date)
VALUES
(1, 1, '2026-06-20'),
(2, 2, '2026-06-21'),
(3, 3, '2026-06-22');
select * from appointments;
SELECT
		p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    SELECT COUNT(*) AS total_patients
FROM patients;
SELECT *
FROM doctors
WHERE specialization = 'Neurology';
CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
INSERT INTO billing (patient_id, amount, bill_date)
VALUES
(1, 1500.00, '2026-06-20'),
(2, 2500.00, '2026-06-21'),
(3, 1800.00, '2026-06-22');
SELECT * FROM billing;
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    medicine_name VARCHAR(100),
    dosage VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
INSERT INTO prescriptions (patient_id, medicine_name, dosage)
VALUES
(1, 'Paracetamol', '500mg'),
(2, 'Amoxicillin', '250mg'),
(3, 'Ibuprofen', '400mg');
select * from prescriptions;
SELECT SUM(amount) AS total_revenue
FROM billing;
SELECT p.patient_name, b.amount
FROM patients p
JOIN billing b
ON p.patient_id = b.patient_id;
SELECT p.patient_name, pr.medicine_name, pr.dosage
FROM patients p
JOIN prescriptions pr
ON p.patient_id = pr.patient_id;
