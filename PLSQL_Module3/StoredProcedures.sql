/*=========================================================
 Exercise 3 : Stored Procedures

 Description:
 This file contains solutions for:
 1. Process Monthly Interest
 2. Update Employee Bonus
 3. Transfer Funds
=========================================================*/


/*=========================================================
 Scenario 1
 Process monthly interest for all savings accounts
 by applying 1% interest.
=========================================================*/

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly interest processed successfully.');

END;
/

-- Execute Procedure
BEGIN
    ProcessMonthlyInterest;
END;
/
/*=========================================================
 Scenario 2
 Update employee salary by adding a bonus
 percentage for a given department.
=========================================================*/

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER

)
AS
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percent / 100)
    WHERE Department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Employee bonus updated successfully.');

END;
/

-- Execute Procedure
BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/
/*=========================================================
 Scenario 3
 Transfer funds from one account to another
 after checking sufficient balance.
=========================================================*/

CREATE OR REPLACE PROCEDURE TransferFunds(

    p_from_account IN NUMBER,
    p_to_account   IN NUMBER,
    p_amount       IN NUMBER

)
AS

    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from_account;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful.');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance.');

    END IF;

END;
/

-- Execute Procedure
BEGIN
    TransferFunds(1,2,500);
END;
/