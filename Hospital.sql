CREATE DATABASE Hospital_management;
USE Hospital_management;

CREATE TABLE Patient(
p_id numeric(8) PRIMARY KEY,
p_name varchar(50) NOT NULL,
p_diagnosis varchar(30) NOT NULL,
p_contact numeric(10) NOT NULL,
p_gender VARCHAR(20) NOT NULL
);

CREATE TABLE Hospital(
H_id numeric(8) PRIMARY KEY,
H_name VARCHAR(100) NOT NULL,
H_city VARCHAR(100) NOT NULL,
H_address VARCHAR(100) NOT NULL,
H_review VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor(
D_idname numeric(8) PRIMARY KEY,
D_qualification varchar(20) NOT NULL,
Dsalary numeric(8) NOT NULL
);

CREATE TABLE Receptionist(
R_id numeric(8) PRIMARY KEY,
R_record varchar(100) NOT NULL
);

CREATE TABLE Nurse(
N_id numeric(8) PRIMARY KEY,
N_session varchar(15) NOT NULL
);

CREATE TABLE MedicalRecord(
Record_id numeric(8) PRIMARY KEY,
DateofExamination DATE NOT NULL,
Problem varchar(20) NOT NULL
);

INSERT INTO Patient(p_id,p_name,p_diagnosis,p_contact,p_gender)
VALUES
(101,'Ram','Urgent surgery',9988737598, 'male'),
(102,'Sham','Essential Hypertension',9115180700, 'male'),
(103,'Divya','Unspecified Hyperlipidemia',8847349414, 'male')
;

INSERT INTO Hospital(H_id,H_name,H_city,H_address,H_review)

VALUES
(1,'Birla','Jalandhar','Mehta Road','Very Good'),
(2,'Adarsh','Amritsar','JV7R+MPC','Good'),
(3,'Jain','Ludhiana','Sudarshan nagar','Average')
;

INSERT INTO Doctor(D_idname, D_qualification, Dsalary)
VALUES
(123, 'MS', 125000),
(214, 'BPT', 50000),
(611, 'MBBS', 75000)
;

INSERT INTO Receptionist(R_id, R_record)
VALUES
(1009,'filling Documentation Electronically'),
(1100,'Verifying Information on file'),
(1149,'ensure quality of patient care')
;

INSERT INTO Nurse(N_id, N_session)
VALUES
(1141,'4 years'),
(1142, '10 years'),
(1146, '7 years')
;

INSERT INTO MedicalRecord(Record_id, DateofExamination, Problem)
VALUES
(001,'2022-03-15','Cancer'),
(002,'2022-01-29','Fever'),
(003,'2020-10-13','Nausea')
;
show tables;
select * from medicalrecord;
select p_id,p_name,p_diagnosis from Patient;
select problem from medicalrecord where record_id=001;
select D_qualification from Doctor where Dsalary>50000;
select H_name from Hospital where H_id=1 and H_address='Mehta Road';
select p_id,p_name,p_diagnosis from Patient order by p_name;
select N_id,N_session from Nurse order by N_id;
select min(Dsalary) from doctor;
insert into Patient(p_id,p_name,p_diagnosis,p_contact,p_gender)values
(124,'geeta','cough',6578954321,'female');
select count(N_id) from Nurse where N_session>'4 years';
update Patient 
set p_gender="female" where p_name="Divya";
select H_name from Hospital where H_name like "__rl%";
create view Receptionist_contact as select R_id,R_record from Receptionist order by R_id;
update Receptionist_contact set R_id=876 where R_record='Verifying Information on file';
create index InPatientIndex on Inpatient(InP_id);
select p_id from Patient natural join Doctor;
select T1.p_name from Patient as T1,Patient as T2 where T1.p_id=T2.p_id and T1.p_gender<>T2.p_gender;
select R_id,R_record,N_id,N_session from Receptionist left outer join Nurse on(Receptionist.R_id=Nurse.N_id);
create table prescription(pres_Id numeric(7),Diagnosis_Id numeric(8),Name varchar(45),Time_period numeric(6,8) primary key (pres_Id));
