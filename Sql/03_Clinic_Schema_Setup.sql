CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY,
    patient_name TEXT,
    age INTEGER
);

CREATE TABLE doctors (
    doctor_id INTEGER PRIMARY KEY,
    doctor_name TEXT,
    specialization TEXT
);

CREATE TABLE appointments (
    appointment_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    doctor_id INTEGER,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE clinic_sales (
    sale_id INTEGER PRIMARY KEY,
    sale_date DATE,
    amount INTEGER,
    sales_channel TEXT
);

CREATE TABLE expenses (
    expense_id INTEGER PRIMARY KEY,
    expense_date DATE,
    amount INTEGER,
    category TEXT
);

INSERT INTO patients VALUES (1, 'Ravi', 30);
INSERT INTO patients VALUES (2, 'Anita', 25);

INSERT INTO doctors VALUES (1, 'Dr. Kumar', 'Cardiology');
INSERT INTO doctors VALUES (2, 'Dr. Meena', 'Dermatology');

INSERT INTO appointments VALUES (1, 1, 1, '2021-11-10');
INSERT INTO appointments VALUES (2, 2, 2, '2021-11-12');

INSERT INTO clinic_sales VALUES (1, '2021-11-01', 5000, 'Online');
INSERT INTO clinic_sales VALUES (2, '2021-11-05', 3000, 'Offline');
INSERT INTO clinic_sales VALUES (3, '2021-12-01', 7000, 'Online');

INSERT INTO expenses VALUES (1, '2021-11-03', 2000, 'Rent');
INSERT INTO expenses VALUES (2, '2021-11-10', 1000, 'Salary');
INSERT INTO expenses VALUES (3, '2021-12-02', 2500, 'Maintenance');