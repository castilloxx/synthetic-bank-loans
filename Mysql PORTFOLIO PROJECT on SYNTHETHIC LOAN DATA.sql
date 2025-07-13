SELECT *
FROM synthetic_loan_data;

-- creating a staging table

CREATE TABLE synthetic_loan_staging
LIKE synthetic_loan_data;

SELECT *
FROM synthetic_loan_staging;

INSERT synthetic_loan_staging
SELECT *
FROM synthetic_loan_data;

SELECT *
FROM synthetic_loan_staging;

-- data cleaning

-- checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY customerid, name, age, gender, maritalstatus, educationlevel, Employmentstatus, annualincome, loanamountrequested, purposeofloan, 
creditscore, existingloanscount, latepaymentslastyear, loanapproved) AS row_num
FROM synthetic_loan_staging ;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY customerid, name, age, gender, maritalstatus, educationlevel, Employmentstatus, annualincome, loanamountrequested, purposeofloan, 
creditscore, existingloanscount, latepaymentslastyear, loanapproved) AS row_num
FROM synthetic_loan_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- No duplicates

-- standardizing data

SELECT DISTINCT gender
FROM synthetic_loan_staging
ORDER BY 1;

-- Checking for null in any column

SELECT 
  SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customerid,
  SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS null_name,
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_age,
  SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
  SUM(CASE WHEN MaritalStatus IS NULL THEN 1 ELSE 0 END) AS null_marital_status,
  SUM(CASE WHEN EducationLevel IS NULL THEN 1 ELSE 0 END) AS null_education,
  SUM(CASE WHEN EmploymentStatus IS NULL THEN 1 ELSE 0 END) AS null_employment,
  SUM(CASE WHEN AnnualIncome IS NULL THEN 1 ELSE 0 END) AS null_income,
  SUM(CASE WHEN LoanAmountRequested IS NULL THEN 1 ELSE 0 END) AS null_loan_amt,
  SUM(CASE WHEN PurposeOfLoan IS NULL THEN 1 ELSE 0 END) AS null_purpose,
  SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS null_credit,
  SUM(CASE WHEN ExistingLoansCount IS NULL THEN 1 ELSE 0 END) AS null_existing_loans,
  SUM(CASE WHEN LatePaymentsLastYear IS NULL THEN 1 ELSE 0 END) AS null_late_pmts,
  SUM(CASE WHEN LoanApproved IS NULL THEN 1 ELSE 0 END) AS null_approved
FROM synthetic_loan_data;

SELECT *
FROM synthetic_loan_staging
WHERE age < 18 OR age > 100;

SELECT *
FROM synthetic_loan_staging
WHERE annualincome < 0 OR annualincome > 1000000;

-- data transformation
-- adding age group

SELECT *,
  CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
  END AS AgeGroup
FROM synthetic_loan_staging;

ALTER TABLE synthetic_loan_staging 
ADD COLUMN Agegroup VARCHAR(10);

UPDATE synthetic_loan_staging
SET Agegroup = CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
END;

SELECT *
FROM synthetic_loan_staging;

-- adding income grouo

ALTER TABLE synthetic_loan_staging 
ADD COLUMN IncomeGroup VARCHAR(20);

UPDATE synthetic_loan_staging
SET IncomeGroup = CASE
  WHEN AnnualIncome < 50000 THEN '<50k'
  WHEN AnnualIncome < 100000 THEN '50k-100k'
  WHEN AnnualIncome < 150000 THEN '100k-150k'
  ELSE '150k+'
END;

SELECT *
FROM synthetic_loan_staging;

-- adding credit rating

ALTER TABLE synthetic_loan_staging 
ADD COLUMN CreditRating VARCHAR(15);

UPDATE synthetic_loan_staging
SET CreditRating = CASE
  WHEN CreditScore < 580 THEN 'Poor'
  WHEN CreditScore BETWEEN 580 AND 669 THEN 'Fair'
  WHEN CreditScore BETWEEN 670 AND 739 THEN 'Good'
  ELSE 'Excellent'
END;

SELECT *
FROM synthetic_loan_staging;

-- Data exploration

SELECT LoanApproved, COUNT(*) AS TotalLoans
FROM synthetic_loan_staging
GROUP BY LoanApproved;

SELECT Gender, LoanApproved, COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY Gender, LoanApproved
ORDER BY Gender, LoanApproved;

SELECT IncomeGroup, LoanApproved, COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY IncomeGroup, LoanApproved
ORDER BY IncomeGroup;

SELECT CreditRating, LoanApproved, COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY CreditRating, LoanApproved
ORDER BY CreditRating;

SELECT PurposeOfLoan, COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY PurposeOfLoan
ORDER BY Total DESC;

SELECT 
  CASE 
    WHEN LatePaymentsLastYear = 0 THEN '0'
    WHEN LatePaymentsLastYear BETWEEN 1 AND 3 THEN '1-3'
    WHEN LatePaymentsLastYear BETWEEN 4 AND 6 THEN '4-6'
    ELSE '7+'
  END AS LatePaymentGroup,
  LoanApproved,
  COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY LatePaymentGroup, LoanApproved
ORDER BY LatePaymentGroup;

SELECT CustomerID, Name, CreditScore,
       RANK() OVER (ORDER BY CreditScore DESC) AS CreditRank
FROM synthetic_loan_staging
LIMIT 10;

WITH avg_loans AS (
  SELECT AgeGroup, AVG(LoanAmountRequested) AS AvgLoan
  FROM synthetic_loan_staging
  GROUP BY AgeGroup
)
SELECT * FROM avg_loans;


WITH avg_credit AS (
  SELECT AgeGroup, AVG(CreditScore) AS avg_score
  FROM synthetic_loan_staging
  GROUP BY AgeGroup
)
SELECT s.CustomerID, s.Name, s.AgeGroup, s.CreditScore, a.avg_score
FROM synthetic_loan_staging s
JOIN avg_credit a ON s.AgeGroup = a.AgeGroup
WHERE s.CreditScore > a.avg_score;

SELECT EmploymentStatus, LoanApproved, COUNT(*) AS Total
FROM synthetic_loan_staging
GROUP BY EmploymentStatus, LoanApproved
ORDER BY EmploymentStatus;










