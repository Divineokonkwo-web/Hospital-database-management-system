-- CREATE A DATABASE CALLED HOSP_RECORD_DESIGN
CREATE DATABASE HOSP_RECORD_DESIGN;
GO

USE HOSPITAL_RECORD_DESIGN;
GO

-- CREATE THE FIRST TABLE CALLED PATIENTS
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY IDENTITY(100,1),
    Full_Name VARCHAR(60) NOT NULL,
    Patient_Address VARCHAR(200) NOT NULL,
    Date_Of_Birth DATE NOT NULL CHECK(Date_Of_Birth <= GETDATE()),
    Insurance VARCHAR(50) NOT NULL CHECK(Insurance IN ('ABC Insurance', 'DEF Insurance', 'GHI Insurance', 'JKL Insurance')),
    Username VARCHAR(30) NOT NULL UNIQUE,
    Password_Hash VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telephone VARCHAR(20) NOT NULL,
    Date_Left DATE NULL
);

-- CREATE A TABLE CALLED DEPARTMENT
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY IDENTITY(001,1),
    Department_Name VARCHAR(50) NOT NULL UNIQUE
);

-- CREATE A TABLE CALLED DOCTORS
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY IDENTITY(200,1),
    Full_Name VARCHAR(60) NOT NULL,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- CREATE A TABLE CALLED APPOINTMENTS
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY IDENTITY(20,1),
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Department_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    Appointment_Status VARCHAR(20) NOT NULL CHECK(Appointment_Status IN ('pending', 'cancelled', 'completed')),
    Next_Appointment_Date DATE NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

SELECT * FROM Appointments;

-- CREATE A TABLE CALLED MEDICAL RECORDS
CREATE TABLE Medical_Records (
    Medical_Record_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT NOT NULL,
    Appointment_ID INT NOT NULL,
    Diagnosis VARCHAR(50) NOT NULL,
    Medicine VARCHAR(50) NOT NULL,
    Last_Appointment_Date DATE NOT NULL,
    Allergy VARCHAR(50) NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);

-- CREATE A TABLE CALLED REVIEWS
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT NOT NULL,
    Appointment_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Feedbacks VARCHAR(200) NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- INSERTING VALUES INTO THE TABLE CALLED PATIENTS

INSERT INTO Patients (Full_Name, Patient_Address, Date_Of_Birth, Insurance, Username, Password_Hash, Email, Telephone, Date_Left) 
VALUES
('John Smith', '123 Main St', '1990-01-01', 'ABC Insurance', 'johnsmith', 'password123', 'john.smith@email.com', '123-456-7890', NULL),
('Jane Doe', '456 Elm St', '1995-06-15', 'DEF Insurance', 'janedoe', 'password456', 'jane.doe@email.com', '987-654-3210', NULL),
('Bob Johnson', '789 Oak St', '1980-03-20', 'GHI Insurance', 'bobjohnson', 'password789', 'bob.johnson@email.com', '555-123-4567', NULL),
('Emily Chen', '901 Maple St', '1992-09-10', 'JKL Insurance', 'emilychen', 'password901', 'emily.chen@email.com', '111-222-3333', NULL),
('Michael Brown', '234 Pine St', '1985-02-25', 'ABC Insurance', 'michaelbrown', 'password234', 'michael.brown@email.com', '444-555-6666', NULL),
('Sarah Lee', '567 Cedar St', '1998-04-05', 'DEF Insurance', 'sarahlee', 'password567', 'sarah.lee@email.com', '777-888-9999', NULL),
('David Kim', '890 Walnut St', '1991-07-15', 'GHI Insurance', 'davidkim', 'password890', 'david.kim@email.com', '333-444-5555', NULL),
('Olivia Martin', '345 Spruce St', '1996-11-20', 'JKL Insurance', 'oliviamartin', 'password345', 'olivia.martin@email.com', '666-777-8888', NULL),
('Ava Harris', '678 Fir St', '1993-01-15', 'ABC Insurance', 'avaharris', 'password678', 'ava.harris@email.com', '999-000-1111', NULL),
('Ethan Hall', '901 Beech St', '1982-09-25', 'DEF Insurance', 'ethanhall', 'password901', 'ethan.hall@email.com', '222-333-4444',NULL),
('Liam Patel', '234 Ash St', '1994-03-10', 'DEF Insurance', 'liampatel', 'password234', 'liam.patel@email.com', '555-666-7777', NULL),
('Sophia Rodriguez', '567 Birch St', '1997-05-20', 'GHI Insurance', 'sophiarodriguez', 'password567', 'sophia.rodriguez@email.com', '888-999-0000', NULL),
('Jackson White', '890 Cypress St', '1988-02-10', 'JKL Insurance', 'jacksonwhite', 'password890', 'jackson.white@email.com', '111-222-3333', NULL),
('Mia Garcia', '345 Hickory St', '1999-07-15', 'ABC Insurance', 'miagarcia', 'password345', 'mia.garcia@email.com', '444-555-6666', NULL),
('Alexander Brooks', '678 Cherry St', '1986-04-05', 'DEF Insurance', 'alexanderbrooks', 'password678', 'alexander.brooks@email.com', '777-888-9999', NULL),
('Charlotte Lewis', '901 Walnut St', '1992-11-20', 'JKL Insurance', 'charlottelewis', 'password901', 'charlotte.lewis@email.com', '333-444-5555', NULL),
('Benjamin Scott', '234 Pine St', '1984-01-15', 'GHI Insurance', 'benjaminscott', 'password234', 'benjamin.scott@email.com', '666-777-8888', '2023-03-17'),
('Abigail Walker', '567 Maple St', '1995-09-10', 'ABC Insurance', 'abigailwalker', 'password567', 'abigail.walker@email.com', '999-000-1111', NULL),
('Logan Russell', '890 Oak St', '1989-03-25', 'ABC Insurance', 'loganrussell', 'password890', 'logan.russell@email.com', '222-333-4444', NULL),
('Evelyn Turner', '345 Elm St', '1991-05-20', 'DEF Insurance', 'evelynturner', 'password90', 'evelyn.turner@email.com', '555-666-7777', NULL);

SELECT * FROM Patients;


-- INSERTING VALUES INTO THE TABLE CALLED DOCTORS

INSERT INTO Doctors (Full_Name, Department_ID)
VALUES
('Anthony Thompson', '01'),
('Sophia Patel', '02'),
('Jackson Lee', '03'),
('Emily Chen', '04'),
('Michael Brown', '05'),
('Ava Morales', '06'),
('Ethan Kim', '07'),
('Charlotte Davis', '08'),
('Liam White', '09'),
('Olivia Martin', '10'),
('Benjamin Brooks', '11'),
('Abigail Walker', '12'),
('Logan Russell', '13'),
('Evelyn Hall', '14'),
('Alexander Scott', '15'),
('Mia Garcia', '16'),
('David Taylor', '17'),
('Emily Wong', '18'),
('Kevin Brown', '19'),
('Sarah Johnson', '20');

SELECT * FROM Doctors;

-- INSERTING VALUES INTO TABLE CALLED DEPARTMENTS

INSERT INTO Departments (Department_Name)
VALUES
('Cardiology'),
('Neurology'),
('Pediatrics'),
('Oncology'),
('Gastroenterology'),
('Orthopedic Surgery'),
('Dermatology'),
('Psychiatry'),
('Obstetrics and Gynecology'),
('Ophthalmology'),
('Otolaryngology'),
('Urology'),
('Nephrology'),
('Endocrinology'),
('Rheumatology'),
('Pulmonology'),
('Hematology'),
('Infectious Diseases'),
('Emergency Medicine'),
('Anesthesiology');

SELECT * FROM Departments
ORDER BY Department_ID;


-- INSERTING VALUES INTO THE TABLE CALLED APPOINTMENTS

INSERT INTO Appointments (Patient_ID, Doctor_ID, Department_ID, Appointment_Date, Appointment_Time, Appointment_Status, Next_Appointment_Date)
VALUES
('100', '200', '1', '2023-03-02', '10:00:00', 'pending', NULL),
('101', '201', '2', '2023-03-03', '11:00:00', 'cancelled', DATEADD(DAY, 5, '2023-03-03')),
('102', '202', '3', '2023-03-04', '12:00:00', 'completed', NULL),
('103', '203', '4', '2023-03-05', '13:00:00', 'pending', NULL),
('104', '204', '5', '2023-03-06', '14:00:00', 'completed', NULL),
('105', '205', '6', '2023-03-07', '15:00:00', 'cancelled', DATEADD(DAY, 5, '2023-03-07')),
('106', '206', '7', '2023-03-08', '09:00:00', 'pending', NULL),
('107', '207', '8', '2023-03-09', '10:00:00', 'completed', NULL),
('108', '208', '9', '2023-03-10', '11:00:00', 'pending', NULL),
('109', '209', '10', '2023-03-11', '12:00:00', 'completed', NULL),
('110', '210', '11', '2023-03-12', '13:00:00', 'cancelled', DATEADD(DAY, 5, '2023-03-12')),
('111', '211', '12', '2023-03-13', '14:00:00', 'pending', NULL),
('112', '212', '13', '2023-03-14', '15:00:00', 'completed', NULL),
('113', '213', '14', '2023-03-15', '09:00:00', 'pending', NULL),
('114', '214', '15', '2023-03-16', '10:00:00', 'completed', NULL),
('115', '215', '16', '2023-03-17', '11:00:00', 'cancelled',DATEADD(DAY, 5, '2023-03-17')),
('116', '216', '17', '2023-03-18', '12:00:00', 'pending', NULL),
('117', '217', '18', '2023-03-19', '13:00:00', 'completed', NULL),
('118', '218', '19', '2023-03-20', '14:00:00', 'pending', NULL),
('119', '219', '20', '2023-03-21', '14:00:00', 'cancelled', DATEADD(DAY, 5, '2023-03-21'));


SELECT * FROM Appointments;

-- INSERTING VALUES INTO THE TABLE CALLED MEDICAL RECORDS

INSERT INTO Medical_Records (Patient_ID, Appointment_ID, Diagnosis, Medicine, Last_Appointment_Date, Allergy)
VALUES
('100', '20', 'Allergic Rhinitis', 'Fluticasone', '2023-03-03', 'Oil'),
('101', '21', 'Diabetes', 'Metformin', '2023-03-04', NULL),
('102', '22', 'Asthma', 'Albuterol', '2023-03-09', NULL),
('103', '23', 'Hyperlipidemia', 'Atorvastatin', '2023-03-06', NULL),
('104', '24', 'Gastroesophageal Reflux Disease', 'Omeprazole', '2023-03-07', 'Dust'),
('105', '25', 'Anxiety Disorder', 'Sertraline', '2023-03-01', NULL),
('106', '26', 'Hypothyroidism', 'Levothyroxine', '2023-03-09', 'Penicillin'),
('107', '27', 'Chronic Pain', 'Ibuprofen', '2023-03-10', NULL),
('108', '28', 'Depression', 'Fluoxetine', '2023-03-11', NULL),
('109', '29', 'Osteoarthritis', 'Acetaminophen', '2023-03-17', 'Dust'),
('110', '30', 'Attention Deficit Hyperactivity Disorder', 'Ritalin', '2023-03-19', NULL),
('111', '31', 'Bipolar Disorder', 'Lithium', '2023-03-14', NULL),
('112', '32', 'Schizophrenia', 'Risperidone', '2023-03-10', 'Rain'),
('113', '33', 'Epilepsy', 'Phenytoin', '2023-03-16', 'Paint'),
('114', '34', 'Multiple Sclerosis', 'Interferon beta-1a', '2023-03-01', NULL),
('115', '35', 'Parkinson''s Disease', 'Levodopa', '2023-03-18', 'Oil'),
('116', '36', 'Chronic Kidney Disease', 'Calcitriol', '2023-03-09', NULL),
('117', '37', 'Heart Failure', 'Enalapril', '2023-03-20', 'cold'),
('118', '38', 'Malaria', 'Artemeta', '2023-03-20', 'cold'),
('119', '39', 'Ulcer', 'Vitamin C', '2023-03-19', 'pepper');



SELECT * FROM Medical_Records;

-- INSERTING VALUES INTO THE TABLE CALLED REVIEWS

INSERT INTO Reviews (Patient_ID, Appointment_ID, Doctor_ID, Feedbacks)
VALUES
('100', '20', '200', 'Doctor was very understanding and helped me a lot.'),
('101', '21', '201', 'I was impressed with the professionalism of the staff.'),
('102', '22', '202', 'The doctor explained everything clearly and answered all my questions.'),
('103', '23', '203', 'I had a great experience, the doctor was very friendly.'),
('104', '24', '204', 'The waiting area was clean and comfortable.'),
('105', '25', '205', 'I was satisfied with the treatment I received.'),
('106', '26', '206', 'The doctor was very attentive and listened to my concerns.'),
('107', '27', '207', 'I would definitely recommend this doctor to others.'),
('108', '28', '208', 'The doctor was knowledgeable and provided good advice.'),
('109', '29', '209', 'I had to wait a bit, but the doctor was worth it.'),
('110', '30', '210', 'The staff was friendly and helpful.'),
('111', '31', '211', 'I was happy with the care I received.'),
('112', '32', '212', 'The doctor was very thorough and explained everything well.'),
('113', '33', '213', 'I would definitely come back to this doctor.'),
('114', '34', '214', 'The doctor was very understanding and empathetic.'),
('115', '35', '215', 'I was impressed with the doctor''s expertise.'),
('116', '36', '216', 'The doctor was very good at explaining things in a way I could understand.'),
('117', '37', '217', 'Overall, I had a great experience and would recommend this doctor.'),
('118', '38', '218', 'Overall, I would recommend this doctor.'),
('119', '39', '219', 'Overall, I had a great experience.');

SELECT * FROM Reviews;

