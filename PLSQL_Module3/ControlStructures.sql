/*=========================================================
 Exercise 1 : Control Structures

 Description:
 This file contains solutions for:
 1. Apply loan interest discount for senior customers.
 2. Promote customers to VIP based on balance.
 3. Send reminders for loans due within 30 days.
=========================================================*/


/*=========================================================
 Scenario 1
 Apply a 1% discount to loan interest rates for
 customers above 60 years of age.
=========================================================*/

DECLARE
    v_age NUMBER;
BEGIN

    FOR cust IN (
        SELECT CustomerID, DOB
        FROM Customers
    ) LOOP

        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12);

        IF v_age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully.');

END;
/
/*=========================================================
 Scenario 2
 Promote customers to VIP if their balance
 exceeds $10,000.
=========================================================*/

-- Execute only once if IsVIP column does not exist
-- ALTER TABLE Customers ADD IsVIP CHAR(1);

BEGIN

    FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
    ) LOOP

        IF cust.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = cust.CustomerID;

        ELSE

            UPDATE Customers
            SET IsVIP = 'N'
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP status updated successfully.');

END;
/
/*=========================================================
 Scenario 3
 Display reminders for loans that are due
 within the next 30 days.
=========================================================*/

SET SERVEROUTPUT ON;

BEGIN

    FOR loan_rec IN (

        SELECT
            c.Name,
            l.LoanID,
            l.EndDate
        FROM Customers c
        JOIN Loans l
            ON c.CustomerID = l.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30

    ) LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID '
            || loan_rec.LoanID
            || ' for customer '
            || loan_rec.Name
            || ' is due on '
            || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY')
        );

    END LOOP;

END;
/