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

-- create the foreign key constraint for medical_histories
ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient_id
FOREIGN KEY (patient_id)
REFERENCES patients (id);

-- create the invoices relation
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT
);

-- create the foreign key constraint for invoices
ALTER TABLE invoices
ADD CONSTRAINT fk_invoice_id
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories (id);

-- Create the invoice_items relation
CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT
);

-- Create the foreign key constraints for invoice_items relation
ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice_items_invoice_id
FOREIGN KEY (invoice_id)
REFERENCES invoices (id),
ADD CONSTRAINT fk_invoice_items_treatment_id
FOREIGN KEY (treatment_id)
REFERENCES treatments (id);

-- Create the treatments relation
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(150) NOT NULL,
  name VARCHAR(100) NOT NULL
);

-- Create medical_history_treatments to relate medical_history and treatments
CREATE TABLE medical_history_treatments (
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (medical_history_id, treatment_id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
  FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);
