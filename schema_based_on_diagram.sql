CREATE TABLE medical_histories ( id INT GENERATED ALWAYS AS IDENTITY, admitted_at DATE, patient_id INT, status varchar(30), PRIMARY KEY(id));
CREATE TABLE patients ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), date_of_birth DATE, PRIMARY KEY(id));
CREATE TABLE invoices ( id INT GENERATED ALWAYS AS IDENTITY, total_amount FLOAT, generated_at DATE, payed_at DATE, medical_history_id INT, PRIMARY KEY (id));
CREATE TABLE invoice_items (id INT GENERATED ALWAYS AS IDENTITY, unit_price FLOAT, quantity INT, total_price FLOAT, invoice_id INT, treatment_id INT, PRIMARY KEY (id));
CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY, type VARCHAR(60), name VARCHAR(80), PRIMARY KEY(id));
CREATE TABLE medical_histories_treatments( treatments_id INT, medical_histories_id INT, PRIMARY KEY(treatments_id,medical_hitories_id));

-- ALTER TABLES TO ADD FOREIGN KEYS
ALTER TABLE invoices ADD CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id);
ALTER TABLE medical_histories ADD CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE medical_histories_treatments FOREIGN KEY (treatments_id) REFERENCES treatments(id);
ALTER TABLE medical_histories_treatments FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);

