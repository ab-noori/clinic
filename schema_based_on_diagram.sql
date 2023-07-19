-- Create the patients relation
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL
);

--Create the medical_histories relation
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT NOT NULL,
  status VARCHAR(150)
);

-- create the invoices relation
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT
);

-- Create the invoice_items relation
CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT
);

-- Create the treatments relation
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(150) NOT NULL,
  name VARCHAR(100) NOT NULL
);