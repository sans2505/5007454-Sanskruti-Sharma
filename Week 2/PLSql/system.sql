CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE
);
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionDate DATE,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
); 

Insert all
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (1, 'John Doe', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 1500.00, TO_DATE('2024-07-01', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (2, 'Jane Smith', TO_DATE('1990-11-23', 'YYYY-MM-DD'), 2500.50, TO_DATE('2024-07-02', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (3, 'Robert Brown', TO_DATE('1975-04-10', 'YYYY-MM-DD'), 3200.00, TO_DATE('2024-07-03', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (4, 'Emily Davis', TO_DATE('1988-08-30', 'YYYY-MM-DD'), 4100.75, TO_DATE('2024-07-04', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (5, 'Michael Johnson', TO_DATE('1995-03-14', 'YYYY-MM-DD'), 5400.20, TO_DATE('2024-07-05', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (6, 'Jessica White', TO_DATE('1982-01-21', 'YYYY-MM-DD'), 6300.80, TO_DATE('2024-07-06', 'YYYY-MM-DD'))
 INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (7, 'Daniel Garcia', TO_DATE('1978-12-05', 'YYYY-MM-DD'), 7200.65, TO_DATE('2024-07-07', 'YYYY-MM-DD'))
 Select * from dual;
 
 Insert all
  INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (1, 1, 'Savings', 1500.00, TO_DATE('2024-07-01', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (2, 2, 'Checking', 2500.50, TO_DATE('2024-07-02', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (3, 3, 'Savings', 3200.00, TO_DATE('2024-07-03', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (4, 4, 'Checking', 4100.75, TO_DATE('2024-07-04', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (5, 5, 'Savings', 5400.20, TO_DATE('2024-07-05', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (6, 6, 'Checking', 6300.80, TO_DATE('2024-07-06', 'YYYY-MM-DD'))
 INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (7, 7, 'Savings', 7200.65, TO_DATE('2024-07-07', 'YYYY-MM-DD'))
Select * from dual;

Insert all 
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 200.00, 'Credit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (2, 2, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 300.50, 'Debit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (3, 3, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 150.00, 'Credit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (4, 4, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 250.75, 'Debit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (5, 5, TO_DATE('2024-07-05', 'YYYY-MM-DD'), 300.20, 'Credit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (6, 6, TO_DATE('2024-07-06', 'YYYY-MM-DD'), 200.80, 'Debit')
 INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES (7, 7, TO_DATE('2024-07-07', 'YYYY-MM-DD'), 250.65, 'Credit')
Select * from dual;

INSERT ALL
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (1, 1, 5000.00, 5.5, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2029-01-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (2, 2, 10000.00, 4.5, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2029-02-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (3, 3, 15000.00, 3.5, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2029-03-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (4, 4, 20000.00, 6.0, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2029-04-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (5, 5, 25000.00, 4.0, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2029-05-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (6, 6, 30000.00, 5.0, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2029-06-01', 'YYYY-MM-DD'))
 INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (7, 7, 35000.00, 3.0, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2029-07-01', 'YYYY-MM-DD'))
SELECT * FROM DUAL;

INSERT ALL
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (1, 'Alice Johnson', 'Manager', 80000.00, 'Finance', TO_DATE('2015-06-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (2, 'Bob Smith', 'Analyst', 60000.00, 'Marketing', TO_DATE('2016-07-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (3, 'Charlie Brown', 'Developer', 70000.00, 'IT', TO_DATE('2017-08-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (4, 'Diane Clark', 'HR Specialist', 50000.00, 'HR', TO_DATE('2018-09-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (5, 'Eve Lewis', 'Director', 90000.00, 'Operations', TO_DATE('2019-10-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (6, 'Frank Moore', 'Consultant', 55000.00, 'Consulting', TO_DATE('2020-11-01', 'YYYY-MM-DD'))
 INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (7, 'Grace Hall', 'Coordinator', 45000.00, 'Admin', TO_DATE('2021-12-01', 'YYYY-MM-DD'))
SELECT * FROM DUAL;

/*EXERCISE 1*:CONTROL STRUCTURES*/

/*Scenario 1: The bank wants to apply a discount to loan interest rates for customers above 60 years old.
o	Question: Write a PL/SQL block that loops through all customers, checks their age, and if they are above 60, apply a 1% discount to their current loan interest rates.
 */
 DECLARE
  v_customer_age NUMBER;
  v_loan_interest_rate NUMBER;
BEGIN
  FOR customer_rec IN (SELECT CustomerID, DOB FROM Customers) LOOP
    v_customer_age := TRUNC((SYSDATE - customer_rec.DOB) / 365.25);
    
    IF v_customer_age > 60 THEN
      FOR loan_rec IN (SELECT LoanID, InterestRate FROM Loans WHERE CustomerID = customer_rec.CustomerID) LOOP
        v_loan_interest_rate := loan_rec.InterestRate - 1;
        
        UPDATE Loans
        SET InterestRate = v_loan_interest_rate
        WHERE LoanID = loan_rec.LoanID;
      END LOOP;
    END IF;
  END LOOP;
  
  COMMIT;
END;
/

/*Scenario 2: A customer can be promoted to VIP status based on their balance.
o	Question: Write a PL/SQL block that iterates through all customers and sets a flag IsVIP to TRUE for those with a balance over $10,000.
*/
ALTER TABLE Customers ADD (IsVIP VARCHAR2(3));

BEGIN
  FOR customer_rec IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF customer_rec.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'YES'
      WHERE CustomerID = customer_rec.CustomerID;
    ELSE
      UPDATE Customers
      SET IsVIP = 'NO'
      WHERE CustomerID = customer_rec.CustomerID;
    END IF;
  END LOOP;
  
  COMMIT;
END;
/

/*Scenario 3: The bank wants to send reminders to customers whose loans are due within the next 30 days.
o	Question: Write a PL/SQL block that fetches all loans due in the next 30 days and prints a reminder message for each customer.
*/
DECLARE
  v_due_date DATE;
  v_customer_name VARCHAR2(100);
BEGIN
  FOR loan_rec IN (SELECT LoanID, CustomerID, EndDate FROM Loans WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30) LOOP
    SELECT Name INTO v_customer_name FROM Customers WHERE CustomerID = loan_rec.CustomerID;
    
    DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || v_customer_name || ', your loan with LoanID ' || loan_rec.LoanID || ' is due on ' || TO_CHAR(loan_rec.EndDate, 'YYYY-MM-DD') || '.');
  END LOOP;
END;
/


/*EXERCISE 2:ERROR HANDLING */
CREATE TABLE ErrorLog (
  ErrorMessage VARCHAR2(4000),
  ErrorDate DATE
);


/*Scenario 1: Handle exceptions during fund transfers between accounts.
o	Question: Write a stored procedure SafeTransferFunds that transfers funds between two accounts. Ensure that if any error occurs (e.g., insufficient funds), an appropriate error message is logged and the transaction is rolled back.
*/
CREATE OR REPLACE PROCEDURE SafeTransferFunds (
  p_from_account_id IN NUMBER,
  p_to_account_id IN NUMBER,
  p_amount IN NUMBER) AS
  v_from_balance NUMBER;
  v_to_balance NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  
  SELECT Balance INTO v_from_balance FROM Accounts WHERE AccountID = p_from_account_id FOR UPDATE;

  
  IF v_from_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
  END IF;

  
  SELECT Balance INTO v_to_balance FROM Accounts WHERE AccountID = p_to_account_id FOR UPDATE;

  
  UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account_id;
  UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account_id;

  
  COMMIT;
  
EXCEPTION
  WHEN OTHERS THEN
    
    v_error_message := SQLERRM;
    ROLLBACK;
    INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);
    RAISE;
END SafeTransferFunds;
/



/*Scenario 2: Manage errors when updating employee salaries.
o	Question: Write a stored procedure UpdateSalary that increases the salary of an employee by a given percentage. If the employee ID does not exist, handle the exception and log an error message.
*/
CREATE OR REPLACE PROCEDURE UpdateSalary (
  p_employee_id IN NUMBER,
  p_percentage IN NUMBER
) AS
  v_error_message VARCHAR2(4000);
BEGIN
  
  UPDATE Employees
  SET Salary = Salary * (1 + p_percentage / 100)
  WHERE EmployeeID = p_employee_id;
  
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Employee ID does not exist.');
  END IF;
  
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    
    ROLLBACK;
    
    
    v_error_message := SQLERRM;
    

    INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);
END UpdateSalary;
/

/*Scenario 3: Ensure data integrity when adding a new customer.
o	Question: Write a stored procedure AddNewCustomer that inserts a new customer into the Customers table. If a customer with the same ID already exists, handle the exception by logging an error and preventing the insertion.
*/
CREATE OR REPLACE PROCEDURE AddNewCustomer (
  p_customer_id IN NUMBER,
  p_name IN VARCHAR2,
  p_dob IN DATE,
  p_balance IN NUMBER,
  p_last_modified IN DATE
) AS
  v_error_message VARCHAR2(4000);
BEGIN
  
  INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
  VALUES (p_customer_id, p_name, p_dob, p_balance, p_last_modified);
  
  
  COMMIT;
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    v_error_message := 'Customer ID already exists.';
    INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);
    ROLLBACK;
  WHEN OTHERS THEN
    v_error_message := SQLERRM;
    INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);
    ROLLBACK;
END AddNewCustomer;
/



/*EXERCISE 3:Stored Procedures*/

/*Scenario 1: The bank needs to process monthly interest for all savings accounts.
o	Question: Write a stored procedure ProcessMonthlyInterest that calculates and updates the balance of all savings accounts by applying an interest rate of 1% to the current balance.
*/

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
  v_interest_rate CONSTANT NUMBER := 0.01;
  v_new_balance NUMBER;
  v_account_id Accounts.AccountID%TYPE;
  v_error_message VARCHAR2(4000);
BEGIN
  FOR account_rec IN (SELECT AccountID, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
    BEGIN
      
      v_new_balance := account_rec.Balance + (account_rec.Balance * v_interest_rate);

      
      UPDATE Accounts
      SET Balance = v_new_balance,
          LastModified = SYSDATE
      WHERE AccountID = account_rec.AccountID;

      
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        
        v_error_message := SQLERRM;


        INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);

        
        ROLLBACK;
    END;
  END LOOP;
END ProcessMonthlyInterest;
/


/*Scenario 2: The bank wants to implement a bonus scheme for employees based on their performance.
o	Question: Write a stored procedure UpdateEmployeeBonus that updates the salary of employees in a given department by adding a bonus percentage passed as a parameter.
*/
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_department IN VARCHAR2,
  p_bonus_percentage IN NUMBER
) AS
  v_new_salary NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  FOR emp_rec IN (SELECT EmployeeID, Salary FROM Employees WHERE Department = p_department) LOOP
    BEGIN
     
      v_new_salary := emp_rec.Salary * (1 + p_bonus_percentage / 100);

     
      UPDATE Employees
      SET Salary = v_new_salary
      WHERE EmployeeID = emp_rec.EmployeeID;

      
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        
        v_error_message := SQLERRM;

  
        INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);

        
        ROLLBACK;
    END;
  END LOOP;
END UpdateEmployeeBonus;
/

/*Scenario 3: Customers should be able to transfer funds between their accounts.
o	Question: Write a stored procedure TransferFunds that transfers a specified amount from one account to another, checking that the source account has sufficient balance before making the transfer.
*/
CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account_id IN NUMBER,
  p_to_account_id IN NUMBER,
  p_amount IN NUMBER
) AS
  v_from_balance NUMBER;
  v_error_message VARCHAR2(4000);
BEGIN
  
  SELECT Balance INTO v_from_balance FROM Accounts WHERE AccountID = p_from_account_id FOR UPDATE;
  
  IF v_from_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
  END IF;
  
  
  UPDATE Accounts
  SET Balance = Balance - p_amount
  WHERE AccountID = p_from_account_id;
  
  
  UPDATE Accounts
  SET Balance = Balance + p_amount
  WHERE AccountID = p_to_account_id;
  
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    
    v_error_message := SQLERRM;
    
    
    ROLLBACK;
    
    
    INSERT INTO ErrorLog (ErrorMessage, ErrorDate) VALUES (v_error_message, SYSDATE);
END TransferFunds;
/

/*EXERCISE 4:FUNCTIONS*/

/*Scenario 1: Calculate the age of customers for eligibility checks.
o	Question: Write a function CalculateAge that takes a customer's date of birth as input and returns their age in years.
*/
CREATE OR REPLACE FUNCTION CalculateAge (
  p_dob DATE
) RETURN NUMBER
IS
  v_age NUMBER;
BEGIN
  
  v_age := TRUNC((SYSDATE - p_dob) / 365.25);
  
  
  RETURN v_age;
END CalculateAge;
/

/*Scenario 2: The bank needs to compute the monthly installment for a loan.
o	Question: Write a function CalculateMonthlyInstallment that takes the loan amount, interest rate, and loan duration in years as input and returns the monthly installment amount.
*/
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
  p_loan_amount NUMBER,
  p_annual_interest_rate NUMBER,
  p_loan_duration_years NUMBER
) RETURN NUMBER
IS
  v_monthly_interest_rate NUMBER;
  v_total_payments NUMBER;
  v_monthly_installment NUMBER;
BEGIN

  v_monthly_interest_rate := p_annual_interest_rate / 100 / 12;
  
  v_total_payments := p_loan_duration_years * 12;
  
  
  IF v_monthly_interest_rate > 0 THEN
    v_monthly_installment := (p_loan_amount * v_monthly_interest_rate * POWER(1 + v_monthly_interest_rate, v_total_payments)) / 
                             (POWER(1 + v_monthly_interest_rate, v_total_payments) - 1);
  ELSE
    
    v_monthly_installment := p_loan_amount / v_total_payments;
  END IF;
  
  
  RETURN v_monthly_installment;
END CalculateMonthlyInstallment;
/

/*Scenario 3: Check if a customer has sufficient balance before making a transaction.
o	Question: Write a function HasSufficientBalance that takes an account ID and an amount as input and returns a boolean indicating whether the account has at least the specified amount.
*/
CREATE OR REPLACE FUNCTION HasSufficientBalance (
  p_account_id IN NUMBER,
  p_amount IN NUMBER
) RETURN BOOLEAN
IS
  v_balance NUMBER;
BEGIN
  
  SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_account_id;
  
  IF v_balance >= p_amount THEN
    RETURN TRUE; 
  ELSE
    RETURN FALSE; 
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN

    RETURN FALSE;
  WHEN OTHERS THEN
    
    RETURN FALSE;
END HasSufficientBalance;
/


/*EXERCISE 5:TRIGGERS*/

/*Scenario 1: Automatically update the last modified date when a customer's record is updated.
o	Question: Write a trigger UpdateCustomerLastModified that updates the LastModified column of the Customers table to the current date whenever a customer's record is updated.
*/
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
  :NEW.LastModified := SYSDATE;
END UpdateCustomerLastModified;
/


/*Scenario 2: Maintain an audit log for all transactions.
o	Question: Write a trigger LogTransaction that inserts a record into an AuditLog table whenever a transaction is inserted into the Transactions table.
*/



CREATE TABLE AuditLog (
  AuditID NUMBER PRIMARY KEY,
  TransactionID NUMBER,
  ActionType VARCHAR2(50),
  ActionDate DATE,
  UserName VARCHAR2(100)
);


CREATE SEQUENCE AuditLogSeq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER AuditLogTrigger
BEFORE INSERT ON AuditLog
FOR EACH ROW
BEGIN
  IF :NEW.AuditID IS NULL THEN
    SELECT AuditLogSeq.NEXTVAL INTO :NEW.AuditID FROM DUAL;
  END IF;
END;



/*Scenario 3: Enforce business rules on deposits and withdrawals.
o	Question: Write a trigger CheckTransactionRules that ensures withdrawals do not exceed the balance and deposits are positive before inserting a record into the Transactions table.
*/
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
  v_current_balance NUMBER;
BEGIN
  
  SELECT Balance INTO v_current_balance
  FROM Accounts
  WHERE AccountID = :NEW.AccountID;

  
  IF :NEW.TransactionType = 'Debit' THEN
    IF :NEW.Amount > v_current_balance THEN
      RAISE_APPLICATION_ERROR(-20001, 'Withdrawal amount exceeds the account balance.');
    END IF;

  
  ELSIF :NEW.TransactionType = 'Credit' THEN
    IF :NEW.Amount <= 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive.');
    END IF;
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20003, 'Account ID does not exist.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20004, 'An unexpected error occurred: ' || SQLERRM);
END CheckTransactionRules;
/

/*EXERCISE 6:CURSORS*/

/*Scenario 1: Generate monthly statements for all customers.
o	Question: Write a PL/SQL block using an explicit cursor GenerateMonthlyStatements that retrieves all transactions for the current month and prints a statement for each customer.
*/
SET SERVEROUTPUT ON;


DECLARE
  CURSOR transaction_cursor IS
    SELECT 
      t.TransactionID,
      t.AccountID,
      t.Amount,
      t.TransactionType,
      t.TransactionDate,
      a.CustomerID,
      c.Name AS CustomerName
    FROM 
      Transactions t
    JOIN 
      Accounts a ON t.AccountID = a.AccountID
    JOIN 
      Customers c ON a.CustomerID = c.CustomerID
    WHERE 
      t.TransactionDate >= TRUNC(SYSDATE, 'MM') AND
      t.TransactionDate < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1);

  TYPE transaction_record_type IS RECORD (
    TransactionID Transactions.TransactionID%TYPE,
    AccountID Transactions.AccountID%TYPE,
    Amount Transactions.Amount%TYPE,
    TransactionType Transactions.TransactionType%TYPE,
    TransactionDate Transactions.TransactionDate%TYPE,
    CustomerID Accounts.CustomerID%TYPE,
    CustomerName Customers.Name%TYPE
  );

  transaction_record transaction_record_type;
  v_current_customer_id Accounts.CustomerID%TYPE := NULL;
  v_current_customer_name Customers.Name%TYPE;

BEGIN
  OPEN transaction_cursor;

  LOOP
    FETCH transaction_cursor INTO transaction_record;
    EXIT WHEN transaction_cursor%NOTFOUND;

    IF v_current_customer_id IS NULL OR v_current_customer_id != transaction_record.CustomerID THEN
      IF v_current_customer_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
      END IF;

      v_current_customer_id := transaction_record.CustomerID;
      v_current_customer_name := transaction_record.CustomerName;

      DBMS_OUTPUT.PUT_LINE('Monthly Statement for Customer: ' || v_current_customer_name);
      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_current_customer_id);
      DBMS_OUTPUT.PUT_LINE('--------------------------------------');
      DBMS_OUTPUT.PUT_LINE('Transaction ID | Account ID | Amount | Type | Date');
      DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    END IF;

    DBMS_OUTPUT.PUT_LINE(transaction_record.TransactionID || ' | ' || 
                         transaction_record.AccountID || ' | ' ||
                         transaction_record.Amount || ' | ' ||
                         transaction_record.TransactionType || ' | ' ||
                         TO_CHAR(transaction_record.TransactionDate, 'DD-MON-YYYY'));

  END LOOP;

  CLOSE transaction_cursor;

  IF v_current_customer_id IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/



/*Scenario 2: Apply annual fee to all accounts.
o	Question: Write a PL/SQL block using an explicit cursor ApplyAnnualFee that deducts an annual maintenance fee from the balance of all accounts.
*/
DECLARE
  CURSOR account_cursor IS
    SELECT AccountID, Balance
    FROM Accounts
    FOR UPDATE OF Balance;

  v_annual_fee NUMBER := 50; 
  v_account_id Accounts.AccountID%TYPE;
  v_balance Accounts.Balance%TYPE;

BEGIN
  OPEN account_cursor;

  LOOP
    FETCH account_cursor INTO v_account_id, v_balance;
    EXIT WHEN account_cursor%NOTFOUND;

    IF v_balance >= v_annual_fee THEN
      UPDATE Accounts
      SET Balance = Balance - v_annual_fee
      WHERE CURRENT OF account_cursor;

      DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id || ' - Annual fee applied. New balance: ' || (v_balance - v_annual_fee));
    ELSE
      DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id || ' - Insufficient funds to apply annual fee.');
    END IF;

  END LOOP;

  CLOSE account_cursor;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    ROLLBACK;
END;
/


/*Scenario 3: Update the interest rate for all loans based on a new policy.
o	Question: Write a PL/SQL block using an explicit cursor UpdateLoanInterestRates that fetches all loans and updates their interest rates based on the new policy.
*/
DECLARE

  CURSOR loan_cursor IS
    SELECT LoanID, InterestRate
    FROM Loans
    FOR UPDATE OF InterestRate;

  
  TYPE loan_record_type IS RECORD (
    LoanID Loans.LoanID%TYPE,
    InterestRate Loans.InterestRate%TYPE
  );

  
  loan_record loan_record_type;

  
  v_interest_rate_adjustment NUMBER := 0.5;

BEGIN

  OPEN loan_cursor;

  
  LOOP
    FETCH loan_cursor INTO loan_record;
    EXIT WHEN loan_cursor%NOTFOUND;

    
    loan_record.InterestRate := loan_record.InterestRate + v_interest_rate_adjustment;

    
    UPDATE Loans
    SET InterestRate = loan_record.InterestRate
    WHERE CURRENT OF loan_cursor;

    
    DBMS_OUTPUT.PUT_LINE('Updated LoanID ' || loan_record.LoanID || ' to new InterestRate ' || loan_record.InterestRate);
  END LOOP;

  
  CLOSE loan_cursor;

  
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN

    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

/*EXERCISE 7:PACKAGES*/

/*
Scenario 1: Group all customer-related procedures and functions into a package.
o	Question: Create a package CustomerManagement with procedures for adding a new customer, updating customer details, and a function to get customer balance.
*/
CREATE OR REPLACE PACKAGE CustomerManagement AS
  PROCEDURE AddCustomer(
    p_customerid IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER,
    p_lastmodified IN DATE,
    p_isvip IN CHAR
  );
  
  PROCEDURE UpdateCustomer(
    p_customerid IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER,
    p_lastmodified IN DATE,
    p_isvip IN CHAR
  );
  
  FUNCTION GetCustomerBalance(p_customerid IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/


SELECT COLUMN_NAME
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'CUSTOMERS';


CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

  PROCEDURE AddCustomer(
    p_customerid IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER,
    p_lastmodified IN DATE,
    p_isvip IN CHAR
  ) IS
  BEGIN
    INSERT INTO Customers (
      CUSTOMERID,
      NAME,
      DOB,
      BALANCE,
      LASTMODIFIED,
      ISVIP
    ) VALUES (
      p_customerid,
      p_name,
      p_dob,
      p_balance,
      p_lastmodified,
      p_isvip
    );
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error adding customer: ' || SQLERRM);
  END;

  PROCEDURE UpdateCustomer(
    p_customerid IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER,
    p_lastmodified IN DATE,
    p_isvip IN CHAR
  ) IS
  BEGIN
    UPDATE Customers
    SET 
      NAME = p_name,
      DOB = p_dob,
      BALANCE = p_balance,
      LASTMODIFIED = p_lastmodified,
      ISVIP = p_isvip
    WHERE CUSTOMERID = p_customerid;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error updating customer: ' || SQLERRM);
  END;

  FUNCTION GetCustomerBalance(p_customerid IN NUMBER) RETURN NUMBER IS
    v_balance NUMBER;
  BEGIN
    SELECT BALANCE INTO v_balance
    FROM Customers
    WHERE CUSTOMERID = p_customerid;
    
    RETURN v_balance;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error retrieving customer balance: ' || SQLERRM);
      RETURN NULL;
  END;

END CustomerManagement;
/


/*Scenario 2: Create a package to manage employee data.
o	Question: Write a package EmployeeManagement with procedures to hire new employees, update employee details, and a function to calculate annual salary.
*/
CREATE OR REPLACE PACKAGE EmployeeManagement AS
  PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, 
                         p_salary IN NUMBER, p_department IN VARCHAR2, p_hire_date IN DATE);

  PROCEDURE UpdateEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, 
                           p_salary IN NUMBER, p_department IN VARCHAR2);

  FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER;
END EmployeeManagement;
/



CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

  PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, 
                         p_salary IN NUMBER, p_department IN VARCHAR2, p_hire_date IN DATE) IS
  BEGIN
    INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (p_employee_id, p_name, p_position, p_salary, p_department, p_hire_date);
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while hiring employee: ' || SQLERRM);
  END HireEmployee;

  PROCEDURE UpdateEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, 
                           p_salary IN NUMBER, p_department IN VARCHAR2) IS
  BEGIN
    UPDATE Employees
    SET Name = p_name,
        Position = p_position,
        Salary = p_salary,
        Department = p_department
    WHERE EmployeeID = p_employee_id;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while updating employee: ' || SQLERRM);
  END UpdateEmployee;

  FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER IS
    v_salary NUMBER;
  BEGIN
    SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_employee_id;
    RETURN v_salary * 12;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0; -- Handle case where the employee is not found
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calculating annual salary: ' || SQLERRM);
      RETURN 0;
  END CalculateAnnualSalary;

END EmployeeManagement;
/


/*Scenario 3: Group all account-related operations into a package.
o	Question: Create a package AccountOperations with procedures for opening a new account, closing an account, and a function to get the total balance of a customer across all accounts.
*/
-- Creating the package specification
CREATE OR REPLACE PACKAGE AccountOperations AS
  
  PROCEDURE OpenAccount(p_customer_id IN NUMBER, p_initial_balance IN NUMBER, p_account_type IN VARCHAR2);

  
  PROCEDURE CloseAccount(p_account_id IN NUMBER);

  
  FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END AccountOperations;
/


CREATE OR REPLACE PACKAGE BODY AccountOperations AS
  
  PROCEDURE OpenAccount(p_customer_id IN NUMBER, p_initial_balance IN NUMBER, p_account_type IN VARCHAR2) IS
  BEGIN
    INSERT INTO Accounts (CustomerID, Balance, AccountType, DateOpened)
    VALUES (p_customer_id, p_initial_balance, p_account_type, SYSDATE);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error opening account: ' || SQLERRM);
  END OpenAccount;

  
  PROCEDURE CloseAccount(p_account_id IN NUMBER) IS
  BEGIN
    DELETE FROM Accounts
    WHERE AccountID = p_account_id;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error closing account: ' || SQLERRM);
  END CloseAccount;

  
  FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
    v_total_balance NUMBER;
  BEGIN
    SELECT SUM(Balance)
    INTO v_total_balance
    FROM Accounts
    WHERE CustomerID = p_customer_id;

    RETURN v_total_balance;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error getting total balance: ' || SQLERRM);
      RETURN NULL;
  END GetTotalBalance;
END AccountOperations;
/




