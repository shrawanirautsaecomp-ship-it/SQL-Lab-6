create database bank;
use bank;
create table customer(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15));
select * from customer;
alter table customer add column DateofBirth date;
alter table customer modify Phone varchar(20);

create table Accounts(
AccountID int,
AccountType varchar(20),
Balance decimal(10,2));
select * from Accounts;
create table Transaction(
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20));
select * from Transaction;


create table Branch(
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15));
select * from Branch;
create table AccountBranches(
AssignmentDate date);
select * from AccountBranches;
create table Loan(
LoanID int,
LoanAmount decimal(10,2),
IntrestRate decimal(5,2),
StartDate date,
EndDate date);
select * from Loan;
 alter table customer add constraint primary key(CustomerID);
 
 alter table customer add constraint foreign key(Accounts) references CustomerID;
 
 alter table customer modify FirstName varchar(50) not null;
 select * from Accounts;
 alter table customer add constraint unique(Email);
alter table Accounts add column CustomerID int;

alter table Accounts add constraint foreign key(CustomerID) references customer(CustomerID);

alter table Loan add constraint foreign key(CustomerID) references customer(customerid);
alter table Loan add column customerid int;
alter table Branch add constraint foreign key(BranchID) references Accounts(CustomerID);

alter table Transaction add constraint foreign key(Account_ID) references Accounts(Account_ID);
insert into customer value(101,"Rahul","Sharma","rahul.sharma@gmail.com",9999999999,19980415);
insert into customer value(102,"Priya","Patil","priya@gmail.com",9988776655,2000920),(103,"Amit","Patel","amit.patel@gmail.com",9876500001,19950618),(104,"Sneha","Joshi","sneha.joshi@gmail.com",9876500002,19970912),(105,"Rohan","Kulkarni","rohan.k@gmail.com",9876500003,19931125);

alter table Accounts add primary key(AccountID);

select * from Accounts where AccountID=201;

insert into Loan value(301,500000.00,8.50,20250115,20300115,101);
insert into Loan value(302,300000.00,9.25,20250210,20280210,102),(303,750000.00,8.70,20250320,20320325,103),
(304,250000.00,10.00,20250405,20290405,104),(305,1000000.00,7.95,20250512,20350512,105);
alter table Transaction add column Account_ID int;
alter table Transaction add constraint foreign key(TransactionID) references Accounts(Account_ID); 
insert into Transaction value(301,20250510,5000.00,"Deposit",201);
insert into Transaction value(302,20250511,2500.00,"Withdraw",202),(303,20250512,10000.00,"Deposit",203),(304,20250513,3000.00,"Withdraw",204),(305,20250514,7000.00,"Deposit",205);


insert into Accounts value(201,"Savings",25000.00,101);
insert into Accounts value(202,"Current",40000.00,102),(203,"Savings",35000.00,103),(204,"Current",60000.00,104),(205,"Savings",45000.00,105);

insert into Branch value(1,"Mumbai Branch","Andheri,Mumabi",0221111111);
insert into Branch value(2,"Pune Branch","Shivaji Nagar,Pune",0202222222),(3,"Nashik Branch","College road,Nashik",0253222222),(4,"Nagpur Branch","Sitabuldi,Nagpur",0712333333),
(5,"NaviMumbai Branch","Vahi,NaviMumbai",0224444444);


select * from customer;

select * from Transaction;
select * from Branch;
select * from Loan;

-- 1 Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.
select AccountID,AccountType,Balance from Accounts;

-- 2 Retrieve Customers with Savings Accounts
select * from Accounts
 where AccountType="Savings";

-- 3 Retrieve Accounts with Balance Greater Than 25000
select * from Accounts
where Balance>25000;

-- 4 Retrieve Transactions Between Specific Amounts 5000 -20000
select * from Accounts
where Balance>5000 and Balance<20000;

-- 5 Retrieve Records for Selected Customers 101,102,103,104
select * from customer
where CustomerID in (101,102,103,104);

-- 6 This displays customers whose names start with the letter R.
select * from customer
where FirstName like "R%";

-- 1 Retrieve all current account records
select * from Accounts
where AccountType="Current";

-- 2 Find accounts with balance less than 15000
select * from Accounts
where Balance<15000;

-- 3 Display transactions between 1000 and 10000
select * from Transaction
where Amount>1000 and Amount<10000;

-- 4 Retrieve customer records for CustomerID 104 and 105
select * from customer
where CustomerID in (104,105);

-- 5 Display customers whose last name starts with S
select * from customer 
where LastName like "S%";

select * from customer where LastName like "S%" ;

select * from customer where LastName like "%a" ;

select * from customer where LastName like "%e%";

select * from customer where FirstName like "A___";

select * from customer where FirstName regexp "^A";

select * from customer where FirstName regexp "t$";

select * from customer where FirstName regexp "amit|rahul";

-- Display Customers in Alphabetical Order
select * from customer 
order by FirstName;

-- Display Accounts with Highest Balance First
select * from Accounts
order by Balance desc limit 1;

-- Retrieve Unique Account Types
select distinct(AccountType) from Accounts;

-- Display Top 3 Highest Balance Accounts
select * from Accounts 
order by Balance desc limit 3;

-- Skip Initial Records While Viewing Transactions
select * from Transaction
order by amount limit 3 offset 1;

-- Display customers sorted by LastName
select * from customer
order by LastName;

-- Retrieve top 5 transactions with highest amount
select * from Transaction
order by Amount desc limit 5;

-- Display unique transaction types
select distinct (TransactionType) from Transaction;

-- Skip the first 3 transaction records and display the next 4 records
select * from Transaction
order by Amount limit 4 offset 3;

-- Find Customers Without Phone Numbers
select * from customer where phone is null;

-- Find Customers Having Email Addresses
select * from customer where email is not null;
 
-- Find customers without email addresses
select * from customer where email is null;

-- Display all accounts where balance information is available
select * from Accounts where balance is not null;
 
-- Search Customers Whose First Name Starts with “A”
select * from customer where FirstName like "A%";

-- Search Customers Whose Email Contains “gmail
select * from customer where Email like "%gmail%";

-- Search Customers Whose Last Name Ends with “kar”
select * from customer where LastName like "%kar";

-- Display customers whose first name starts with R
select * from customer where FirstName like "R%";

-- Find customers whose email contains yahoo
select * from customer where email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customer where LastName like "P%";

-- Search customers whose phone number ends with 99
select * from customer where phone like "%99";

-- Display Savings Account Customers Sorted by Balance Categorize Accounts Using Balance Balance >50000 then premium account Balance >2500 then standard account
select balance,
case
when balance>50000 then "Premium Account"
when balance>2500 then "Standard Account"
else "Normal Account"
end as Category
from Accounts;

-- High Transaction>1000 Medium Transaction>500 Low Transaction based on transaction amount.
select Amount,
case
when Amount>5000 then "High Transaction"
when Amount>2000 then "Medium Transaction"
else "Low Transaction"
end as Transaction_done
from Transaction;

select * from customer;
select * from Accounts;
select * from Transaction;
select * from Branch;
select * from Loan;
-- The finance team wants to review only Savings and Current account holders.
select * from Accounts where AccountType="Savings" or AccountType="Current";

-- The audit department wants to investigate only Deposit and Withdrawal transactions.
select * from Transaction where TransactionType in ("Deposit","Withdraw");

-- The customer relationship team wants to review records for a specific set of customers. 101,102,105
select * from customer where CustomerID in(101,102,105);
 
-- 1. Display accounts belonging to Salary and Savings account types
select * from Accounts where AccountType in("Salary","Savings"); 

-- 2. Retrieve transactions for Payment and Deposit categories
select * from Transaction where TransactionType in("Payment","Deposit");

-- 3. Display customer records for CustomerID 103 and 104
select * from customer where CustomerID in("103","104");

-- 4. Retrieve selected account records using AccountID values
select * from Accounts where AccountID=201;

-- Display Customers in Ascending Order of Last Name
select * from customer
order by LastName asc ;

-- Display Accounts with Highest Balance First
select * from Accounts
order by Balance desc limit 1;

-- Display Transactions Sorted by Transaction Date
select * from Transaction
order by TransactionDate;
  
-- 1. Display customers sorted by FirstName
select * from customer
order by FirstName;

-- 2. Display accounts sorted by AccountType
select * from Accounts
order by AccountType;

-- 3. Display transactions sorted by Amount in descending order
select * from Transaction
order by Amount desc;

-- 4. Display customers sorted by DateOfBirth
select * from customer
order by DateofBirth;
 
-- 5 Display Only Top 5 Highest Balance Accounts
select * from Accounts
order by Balance desc limit 5;

-- 6 Display First 3 Customer Records
select * from customer
 limit 3;

-- 7 Skip Initial Transaction Records 3 While Viewing Data record 2
select * from Transaction
 limit 2 offset 3;
 
-- 1. Display top 3 transactions with highest amount
select * from Transaction
order by Amount desc limit 3;

-- 2. Retrieve only 4 customer records
select * from customer
limit 4;

-- 3. Skip first 2 account records and display next 3 records
select * from Accounts
limit 3 offset 2;

-- 4. Display top 5 latest transactions
select * from Transaction
order by TransactionDate asc limit 5;

select TransactionType, sum(Amount) from Transaction
group by TransactionType
order by sum(Amount) desc;

select CustomerID, sum(LoanAmount) from Loan
group by CustomerID
having CustomerID=101

select length("hello")as length,upper("hello"),lower("Hello"),left("hello",3),right("hello",2),mid("hello",2,3);

select length("   hello"),length(trim("   hello"));

select concat("hello"," ","all");

select upper(FirstName),left(FirstName,3),length(FirstName) from customer;

-- 1 Display customer Table
select * from customer;

-- 2 Display all customer in FirstName in uppercase.
select upper(FirstName) from customer;

-- 3 Display all customer in FirstName in lowercase.
select lower(FirstName) from customer;

-- 4 Find the total number of characters in each customer FirstName
select length(FirstName) from customer;

-- 5 Display only the first 3 characters of customer FirstName
select left(FirstName,3) from customer;

-- 6 Combine customers FirstName with LastName
select concat(FirstName,LastName) from customer;

select round(7.5),round(7.4),abs(-7),ceil(8.9),floor(8.9),mod(3,2);

-- date
select  current_date(),now(),year(now()),day(now()),month(now());
select datediff("13-11-2026","01-11-2026") ;

-- 9 Display customer Table
select * from customer;
-- 10  Display the current system date
select current_date();
-- 11 Display the current system date and time
select now();
-- 12 Display the Birth of year
select year(DateofBirth) from customer;
-- 13 Display the Birth month
select month(DateofBirth) from customer;
-- 14 Calculate the number of days since BirthDate
select datediff(current_date(),dateofbirth) from customer;
-- 15 Find the latest birth date.
select dateofbirth from customer
order by dateofbirth desc
limit 1;
-- 16 Find the earliest birth 
select dateofbirth from customer
order by dateofbirth
limit 1;
-- 16. Display 'Not Available' if a phone number is NULL
select *,ifnull(phone,"not available") from customer; 
-- 17. Compare two customer names
select*,nullif(FirstName,"Rahul") from customer;
-- 18. Calculate the total balance maintained across all customer accounts.
select CustomerID,sum(Balance) from accounts
group by CustomerID; 
-- 19. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
select AccountType,avg(balance) from accounts
group by AccountType;
-- 20. Identify the highest balance maintained in any customer account.
  select max(balance) from accounts;
  select CustomerID,max(balance) from accounts
group by CustomerID
order by max(balance) desc
limit 1;
-- 21. Identify the lowest balance maintained in any customer account
select min(balance) from accounts;

select CustomerID,min(balance) from accounts
group by CustomerID
order by min(balance) asc
limit 1;
-- 22. Determine the total number of customer accounts available in the system.
select count(*) from accounts;

select  AccountType,count(*) from accounts
group by AccountType;
-- 23. The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
select AccountType,sum(balance) from accounts
group by AccountType
order by sum(Balance) desc
limit 1;
-- 24. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
select AccountType,sum(balance) from accounts
group by AccountType
having sum(balance)>=25000;

