CREATE DATABASE Miniproject;
USE Miniproject;

-- Creating the database
CREATE TABLE STAFF (
    STAFF_ID INT PRIMARY KEY,
    FNAME VARCHAR(25) NOT NULL,
    LNAME VARCHAR(25) NOT NULL,
    JOB VARCHAR(25) NOT NULL,
    PHONE VARCHAR(15),
    EMAIL VARCHAR(50),
    CLINIC VARCHAR(25)
);

CREATE TABLE RADIOGRAPHER (
    RADIOGRAPHER_ID INT PRIMARY KEY,
    STAFF_ID INT,
    SPECIALTY VARCHAR(25),
    FOREIGN KEY (STAFF_ID) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE RADIOLOGIST (
    RADIOLOGIST_ID INT PRIMARY KEY,
    STAFF_ID INT,
    SPECIALTY VARCHAR(25),
    FOREIGN KEY (STAFF_ID) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE RECEPTIONIST (
    RECEPTIONIST_ID INT PRIMARY KEY,
    STAFF_ID INT,
    FOREIGN KEY (STAFF_ID) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE PATIENT (
    PATIENT_ID INT PRIMARY KEY,
    FNAME VARCHAR(25) NOT NULL,
    LNAME VARCHAR(25) NOT NULL,
    DOB DATE,
    GENDER CHAR(1),
    PHONE VARCHAR(15),
    EMAIL VARCHAR(50),
    POSTCODE VARCHAR(4),
    MEDICARE_ID VARCHAR(20)
);

CREATE TABLE REFERRINGDOCTOR (
    DOCTOR_ID INT PRIMARY KEY,
    FNAME VARCHAR(25) NOT NULL,
    LNAME VARCHAR(25) NOT NULL,
    PHONE VARCHAR(15),
    EMAIL VARCHAR(50),
    POSTCODE VARCHAR(4)
);

CREATE TABLE REFERRAL (
    REFERRAL_ID INT PRIMARY KEY,
    DOCTOR_ID INT,
    PATIENT_ID INT,
    CLINICAL_NOTE TEXT,
    FOREIGN KEY (DOCTOR_ID) REFERENCES ReferringDoctor(DOCTOR_ID),
    FOREIGN KEY (PATIENT_ID) REFERENCES Patient(PATIENT_ID)
);

CREATE TABLE APPOINTMENT (
    APPOINTMENT_ID INT PRIMARY KEY,
    RECEPTIONIST_ID INT,
    REFERRAL_ID INT,
    APP_DATE DATE,
    APP_TIME TIME,
    FOREIGN KEY (RECEPTIONIST_ID) REFERENCES Receptionist(RECEPTIONIST_ID),
    FOREIGN KEY (REFERRAL_ID) REFERENCES Referral(REFERRAL_ID)
);

CREATE TABLE SCANNER (
    SCANNER_ID INT PRIMARY KEY,
    MODALITY VARCHAR(25),
    SCANNER_NAME VARCHAR(25),
    MANUFACTURER VARCHAR(25),
    MAINTENANCE_DATE DATE
);

CREATE TABLE EXAMINATION (
    EXAMINATION_ID INT PRIMARY KEY,
    SCANNER_ID INT,
    RADIOGRAPHER_ID INT,
    APPOINTMENT_ID INT,
    IMAGE BLOB,
    FOREIGN KEY (SCANNER_ID) REFERENCES Scanner(SCANNER_ID),
    FOREIGN KEY (RADIOGRAPHER_ID) REFERENCES Radiographer(RADIOGRAPHER_ID),
    FOREIGN KEY (APPOINTMENT_ID) REFERENCES Appointment(APPOINTMENT_ID)
);

CREATE TABLE DIAGNOSTICREPORT (
    REPORT_ID INT PRIMARY KEY,
    RADIOLOGIST_ID INT,
    DOCTOR_ID INT,
    EXAMINATION_ID INT,
    DIAGNOSIS TEXT,
    RECOMMENDATION TEXT,
    FOREIGN KEY (RADIOLOGIST_ID) REFERENCES Radiologist(RADIOLOGIST_ID),
    FOREIGN KEY (DOCTOR_ID) REFERENCES ReferringDoctor(DOCTOR_ID),
    FOREIGN KEY (EXAMINATION_ID) REFERENCES Examination(EXAMINATION_ID)
);

CREATE TABLE BILLINGINVOICE (
    INVOICE_ID INT PRIMARY KEY,
    APPOINTMENT_ID INT,
    PATIENT_ID INT,
    BIL_DATE DATE,
    BIL_AMOUNT DECIMAL(10, 2),
    BIL_STATUS VARCHAR(25),
    FOREIGN KEY (APPOINTMENT_ID) REFERENCES Appointment(APPOINTMENT_ID),
    FOREIGN KEY (PATIENT_ID) REFERENCES Patient(PATIENT_ID)
);

-- Populating databases with entries
INSERT INTO STAFF (STAFF_ID, FNAME, LNAME, JOB, PHONE, EMAIL, CLINIC)
VALUES
(1, 'John', 'Doe', 'Radiographer', '+61-412-345-678', 'john.doe@gmail.com', 'Lilydale'),
(2, 'Jane', 'Smith', 'Radiographer', '+61-423-456-789', 'jane.smith@gmail.com', 'Mulgrave'),
(3, 'Michael', 'Johnson', 'Radiographer', '+61-432-567-890', 'michael.johnson@gmail.com', 'Lilydale'),
(4, 'Emily', 'Williams', 'Radiographer', '+61-433-678-901', 'emily.williams@gmail.com', 'Mulgrave'),
(5, 'David', 'Brown', 'Radiographer', '+61-434-789-012', 'david.brown@gmail.com', 'Lilydale'),
(6, 'Sarah', 'Taylor', 'Receptionist', '+61-445-890-123', 'sarah.taylor@gmail.com', 'Mulgrave'),
(7, 'Robert', 'Wilson', 'Receptionist', '+61-456-901-234', 'robert.wilson@gmail.com', 'Lilydale'),
(8, 'Jennifer', 'Anderson', 'Receptionist', '+61-467-012-345', 'jennifer.anderson@gmail.com', 'Mulgrave'),
(9, 'Daniel', 'Martinez', 'Receptionist', '+61-478-123-456', 'daniel.martinez@gmail.com', 'Lilydale'),
(10, 'Jessica', 'Lopez', 'Receptionist', '+61-489-234-567', 'jessica.lopez@gmail.com', 'Mulgrave'),
(11, 'Andrew', 'Miller', 'Radiologist', '+61-498-345-678', 'andrew.miller@gmail.com', 'Lilydale'),
(12, 'Emma', 'Garcia', 'Radiologist', '+61-432-456-789', 'emma.garcia@gmail.com', 'Mulgrave'),
(13, 'Matthew', 'Lee', 'Radiologist', '+61-456-567-890', 'matthew.lee@gmail.com', 'Lilydale'),
(14, 'Olivia', 'Clark', 'Radiologist', '+61-478-678-901', 'olivia.clark@gmail.com', 'Mulgrave'),
(15, 'William', 'Rodriguez', 'Radiologist', '+61-490-789-012', 'william.rodriguez@gmail.com', 'Lilydale');

INSERT INTO RADIOGRAPHER (RADIOGRAPHER_ID, STAFF_ID, SPECIALTY)
VALUES
(1, 1, 'X-ray'),
(2, 2, 'MRI'),
(3, 3, 'CT'),
(4, 4, 'US'),
(5, 5, 'Nuculear-Medicine');

INSERT INTO RADIOLOGIST (RADIOLOGIST_ID, STAFF_ID, SPECIALTY)
VALUES
(1, 11, 'General'),
(2, 12, 'Interventional'),
(3, 13, 'General'),
(4, 14, 'Musculoskeletal'),
(5, 15, 'Pediatric');

INSERT INTO RECEPTIONIST (RECEPTIONIST_ID, STAFF_ID)
VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

INSERT INTO PATIENT (PATIENT_ID, FNAME, LNAME, DOB, GENDER, PHONE, EMAIL, POSTCODE, MEDICARE_ID)
VALUES
(1, 'Alice', 'Smith', '1990-05-15', 'F', '+61-412-345-678', 'alice.smith@gmail.com', '3000', '123456789A'),
(2, 'Bob', 'Johnson', '1985-09-21', 'M', '+61-423-456-789', 'bob.johnson@gmail.com', '3000', '987654321B'),
(3, 'Charlie', 'Brown', '1978-11-10', 'M', '+61-432-567-890', 'charlie.brown@gmail.com', '3000', '456789123C'),
(4, 'Diana', 'Lee', '1995-03-28', 'F', '+61-433-678-901', 'diana.lee@gmail.com', '3000', '789123456D'),
(5, 'Eva', 'Garcia', '1980-07-12', 'F', '+61-434-789-012', 'eva.garcia@gmail.com', '3000', '321654987E');

INSERT INTO REFERRINGDOCTOR (DOCTOR_ID, FNAME, LNAME, PHONE, EMAIL, POSTCODE)
VALUES
(1, 'Emily', 'Jones', '+61-455-234-789', 'emily.jones@gmail.com', '3000'),
(2, 'Michael', 'Wang', '+61-466-345-890', 'michael.wang@gmail.com', '3000'),
(3, 'Samantha', 'Nguyen', '+61-477-456-901', 'samantha.nguyen@gmail.com', '3000'),
(4, 'Daniel', 'Kim', '+61-488-567-012', 'daniel.kim@gmail.com', '3000'),
(5, 'Jessica', 'Chen', '+61-499-678-123', 'jessica.chen@gmail.com', '3000');

INSERT INTO REFERRAL (REFERRAL_ID, DOCTOR_ID, PATIENT_ID, CLINICAL_NOTE)
VALUES
(1, 1, 1, 'Patient requires further examination of the spine.'),
(2, 2, 2, 'Patient needs an MRI scan for knee injury.'),
(3, 3, 3, 'Patient complains of persistent headaches; neurological evaluation required.'),
(4, 4, 4, 'Patient needs a chest X-ray to evaluate respiratory symptoms.'),
(5, 5, 5, 'Patient requires abdominal ultrasound for diagnostic purposes.');

INSERT INTO APPOINTMENT (APPOINTMENT_ID, RECEPTIONIST_ID, REFERRAL_ID, APP_DATE, APP_TIME)
VALUES
(1, 1, 1, '2024-05-03', '09:00:00'),
(2, 2, 2, '2024-05-04', '10:30:00'),
(3, 3, 3, '2024-05-05', '11:45:00'),
(4, 4, 4, '2024-05-06', '13:15:00'),
(5, 5, 5, '2024-05-07', '14:45:00');

INSERT INTO SCANNER (SCANNER_ID, MODALITY, SCANNER_NAME, MANUFACTURER, MAINTENANCE_DATE)
VALUES
(1, 'MRI', 'MAGNETOM Skyra', 'Siemens Healthineers', '2024-03-01'),
(2, 'CT', 'Aquilion ONE PRISM', 'Canon Medical Systems', '2024-02-15'),
(3, 'X-ray', 'DigitalDiagnost C90', 'Philips Healthcare', '2024-04-10'),
(4, 'Ultrasound', 'LOGIQ E10', 'GE Healthcare', '2024-01-20'),
(5, 'PET-CT', 'Biograph Vision', 'Siemens Healthineers', '2024-05-05');

INSERT INTO EXAMINATION (EXAMINATION_ID, SCANNER_ID, RADIOGRAPHER_ID, APPOINTMENT_ID, IMAGE)
VALUES
(1, 3, 1, 1, NULL),
(2, 1, 2, 2, NULL),
(3, 2, 3, 3, NULL),
(4, 3, 1, 4, NULL),
(5, 4, 4, 5, NULL);

INSERT INTO DIAGNOSTICREPORT (REPORT_ID, RADIOLOGIST_ID, DOCTOR_ID, EXAMINATION_ID, DIAGNOSIS, RECOMMENDATION)
VALUES
(1, 1, 1, 1, 'Spinal misalignment detected.', 'Recommend further consultation with a specialist.'),
(2, 4, 2, 2, 'Torn ligament in the right knee.', 'Suggest orthopedic evaluation and possible surgical intervention.'),
(3, 3, 3, 3, 'Normal brain scan results.', 'Advise monitoring symptoms and seeking further evaluation if headaches persist.'),
(4, 1, 4, 4, 'Pulmonary infiltrates suggestive of infection.', 'Prescribe antibiotics and schedule follow-up chest X-ray.'),
(5, 3, 5, 5, 'Gallbladder stones observed.', 'Refer patient to a gastroenterologist for further evaluation and treatment.');

INSERT INTO BILLINGINVOICE (INVOICE_ID, APPOINTMENT_ID, PATIENT_ID, BIL_DATE, BIL_AMOUNT, BIL_STATUS)
VALUES
(1, 1, 1, '2024-05-03', 50.00, 'Paid'),
(2, 2, 2, '2024-05-04', 300.00, 'Pending'),
(3, 3, 3, '2024-05-05', 100.50, 'Paid'),
(4, 4, 4, '2024-05-06', 50.00, 'Pending'),
(5, 5, 5, '2024-05-07', 250.75, 'Paid');

-- Adding a column to a table
ALTER TABLE PATIENT
ADD COLUMN STATE VARCHAR(25) DEFAULT 'Victoria';

SELECT * FROM Patient;

-- Changing an entry
-- Changing postcode first
UPDATE PATIENT
SET POSTCODE = '2000'
WHERE PATIENT_ID IN (1, 3);
-- Now change state to NSW of postcode 2000
UPDATE PATIENT
SET STATE = 'New South Wales'
WHERE POSTCODE = '2000';
-- SQL above doesn't work, as this is in safe mode. So alternative below:
UPDATE PATIENT
SET STATE = 'New South Wales'
WHERE POSTCODE = '2000' AND (PATIENT_ID = 1 OR PATIENT_ID = 3);

-- Use SELECT with INNER JOIN and ORDER BY
SELECT s.FNAME, s.LNAME, r.SPECIALTY
FROM STAFF s
INNER JOIN RADIOGRAPHER r ON s.STAFF_ID = r.STAFF_ID
ORDER BY r.SPECIALTY ASC;

-- SELECT with WHERE and IN
SELECT *
FROM PATIENT
WHERE PATIENT_ID IN (1);

-- Demonstrating use of DATE function
SELECT SCANNER_NAME, MONTH(MAINTENANCE_DATE) AS MAINTENANCE_MONTH, YEAR(MAINTENANCE_DATE) AS MAINTENANCE_YEAR
FROM SCANNER;

-- Creating a VIEW for SELECT and JOIN
CREATE VIEW Radiologist_View AS
SELECT s.FNAME, s.LNAME, r.SPECIALTY, s.CLINIC
FROM STAFF s
INNER JOIN RADIOLOGIST r ON s.STAFF_ID = r.STAFF_ID;

SELECT * FROM Radiologist_View;
