CREATE TABLE Emp_PayRoll(
Id int NOT NULL IDENTITY(1,1),
Name varchar(100),
Salery decimal,
City varchar(100),
StartDate Date,
Primary KEY(Id)
);
select * from Emp_PayRoll;

--Inserting Value in DataBase--
INSERT INTO Emp_PayRoll (Name,Salery,City,StartDate) values ('Ujj',7000,'MGS','2022/03/07');
INSERT INTO Emp_PayRoll (Name,Salery,City,StartDate) values ('Aru',9000,'VNS','2022/05/07');
INSERT INTO Emp_PayRoll (Name,Salery,City,StartDate) values	('Gold',8000,'DELHI','2022/08/07');
select * from Emp_PayRoll where StartDate between CAST ('2022/01/07' AS DATE) AND CAST('2022/05/07' AS DATE);

--Adding Gender Column--
Alter table Emp_PayRoll add Gender varchar (30);

--Adding PhoneNumber, Address and Department Column--
Alter table Emp_PayRoll add PhoneNumber varchar(20), Address varchar(100), Department varchar(100);

--Updating Gender--
update Emp_PayRoll set Gender ='Male' where id=1;
update Emp_PayRoll set Gender ='FeMale' where Name = 'Aru';
update Emp_PayRoll set Gender ='Male' where Name = 'Gold';

---Calculating Sum Of Salary---
select sum (salery) from Emp_PayRoll;

---Calculating Average Of Salary---
select AVG (salery) from Emp_PayRoll;

---Checking Minimum Salary---
select Min (salery) from Emp_PayRoll;

--Checking Maximum Salary--
select Max (salery) from Emp_PayRoll;

---Adding Phonenumber and address Department---
update Emp_PayRoll set PhoneNumber = '777777777', Address='113/45', Department='IT' where id=1;
update Emp_PayRoll set PhoneNumber = '7768908532', Address='111/32', Department='Management' where id=2;
update Emp_PayRoll set PhoneNumber = '7547676678', Address='116/12', Department='HR' where id=3;
select * from Emp_PayRoll;

---Counting Employee in DataBase
select count (*) from Emp_PayRoll;
Alter table Emp_PayRoll drop column Salery;

--Counting Male--
Select count (*) from Emp_PayRoll where Gender = 'Male'; 

--Counting Female--
Select count (*) from Emp_PayRoll where Gender = 'FeMale'; 

--Calculating Salary By Gender Wise--
select Sum(salery) as "TotalSalery",Gender from Emp_Payroll group by Gender;
select Avg(salery) as "AverageSalery",Gender from Emp_Payroll group by Gender;
select Min(salery) as "MinimumSalery",Gender from Emp_Payroll group by Gender;
select Max(salery) as "MaximumSalery",Gender from Emp_Payroll group by Gender;
select count(salery) as "CountSalery",Gender from Emp_Payroll group by Gender;

--Adding Column Basic Pay and Deduction,Taxable pay, Income Pay , Netpay ---
Alter table Emp_payroll add Deduction float,TaxablePay float, IncomeTax float,NetPay float;
Update Emp_payroll set Deduction=500 where Gender='FeMale';
Update Emp_PayRoll set Deduction=700 where Gender='Male';
update Emp_payroll set NetPay=(Salery - Deduction)
update Emp_payroll set TaxablePay=0,IncomeTax=0
select * from Emp_PayRoll;

--Adding Terissa--
Insert into Emp_Payroll(Name,Salery,City,StartDate,Gender,PhoneNumber,Address,Department) values ('Terissa',
                                                   10000,'NOIDA','2022-04-10','FeMale',7878787856,'123/56','Accountant');
select * from Emp_PayRoll where Name = 'Terissa';
 
Drop table Emp_PayRoll;
-----------------------------------------------------------------------------------------
Create Table Company
(CompanyID int identity(1,1) primary key,
CompanyName varchar(100))

--Insert Values in Company--
Insert into Company values ('Wipro'),('TATA')
Select * from Company

--Creating Employee Table
create table Employes
(EmployeeID int identity(1,1) primary key,
CompanyIdentity int,
EmployeeName varchar(100),
EmployeePhoneNumber varchar(20),
EmployeeAddress varchar(200),
StartDate date,
Gender varchar(10),
Foreign key (CompanyIdentity) references Company(CompanyID)
);

--Inserting Value in Employee--
insert into Employes values (101,'Anand',9889898989,'Varanasi','2020-03-5','Male'),
                            (102,'Rajan',676767689,'Gurgao','2020-04-10','Male'),
                            (101,'Harleen',7878786790,'Jalandhar','2022-02-5','FeMale'),
                            (102,'Smriti',9098765678,'Delhi','2022-04-12','FeMale');
Select * from Employes;

--Create Payroll Table--
create table PayrollCalculate
(Salery decimal,
Deductions decimal,
TaxablePay decimal,
IncomeTax decimal,
NetPay decimal,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employes(EmployeeID)
)
--Insert Values in Payroll Table
insert into PayrollCalculate(Salery,Deductions,IncomeTax,EmployeeIdentity) values 
(25000,1000,700,1),
(30000,1000,500,2),
(35000,1200,500,3),
(32000,1000,800,4)

--Update Derived attribute values 
update PayrollCalculate set TaxablePay=Salery-Deductions
update PayrollCalculate set NetPay=TaxablePay-IncomeTax
select * from PayrollCalculate

--Create Department Table
create table Department
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
)
--Inserting Value in Department--
insert into Department values ('IT'),
                              ('Management');
select * from Department

--Creating table EmployeeDepartment--
create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employes(EmployeeID),
Foreign key (DepartmentIdentity) references Department(DepartmentID)
)

--Inserting Value in EmployeeDepartment
insert into EmployeeDepartment values
(1,1),
(2,2),
(1,3),
(2,4)
select * from EmployeeDepartment
--Ensuring all retrieve Data are working with new table--

--Viewing all Data--
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,EmployeeAddress,EmployeePhoneNumber,StartDate,Gender,Salery,Deductions,TaxablePay,IncomeTax,NetPay,DepartName from Company
INNER JOIN Employes ON Company.CompanyID = Employes.CompanyIdentity
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID
INNER JOIN EmployeeDepartment on Employes.EmployeeID=EmployeeDepartment.EmployeeIdentity
INNER JOIN Department on Department.DepartmentId=EmployeeDepartment.DepartmentIdentity

--Getting Date--
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,Salery,Deductions,TaxablePay,IncomeTax,NetPay from Company
INNER JOIN Employes ON Company.CompanyID = Employes.CompanyIdentity and StartDate BETWEEN Cast('2022-02-01' as Date) and GetDate()
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID

--Retriving query based on Name
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,Salery,Deductions,TaxablePay,IncomeTax,NetPay from Company
INNER JOIN Employes ON Company.CompanyID = Employes.CompanyIdentity and Employes.EmployeeName='Smriti'
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID

--UC 7: Use Aggregate Functions and Group by Gender
select Sum(Salery) as "TotalSalary",Gender from Employes
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID group by Gender;

select Avg(Salery) as "AverageSalary",Gender from Employes
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID group by Gender;

select Min(Salery) as "MinimumSalary",Gender from Employes
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID group by Gender;

select Max(Salery)  as "MaximumSalary",Gender from Employes
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID group by Gender;

select Count(Salery) as "CountSalary",Gender from Employes
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employes.EmployeeID group by Gender;