# Loan Portfolio Analysis

## Project overview
This project focuses on cleaning, exploring, and visualizing a synthetic loan dataset. It simulates real-world loan application data, with the aim of identifying patterns in loan approval, credit risk, and borrower behavior.

## Data set overview
The dataset contains synthetic records of 1,000+ loan applicants with features related to:

- Demographics (Age, Gender, Marital Status)
- Financial Status (Income, Credit Score, Existing Loans)
- Loan Details (Loan Amount, Purpose, Approval Status)

### Tools
- Mysql – Data cleaning, transformation, and exploratory SQL analysis
- Tableau – Interactive visualizations and dashboards

###  Key Fields

| Column Name               | Description                                         |
|---------------------------|-----------------------------------------------------|
| Customer ID               | Unique applicant ID                                 |
| Gender                    | Male / Female                                       |
| Age                       | Applicant's age                                     |
| Marital Status            | Single / Married / Divorced / Widowed               |
| Employment Status         | Employment type                                     |
| Annual Income             | Total yearly income                                 |
| Income Group              | Income category (Low, Middle, High)                 |
| Credit Score              | Numeric score (300–850)                             |
| Credit Rating             | Grouped credit score (Poor, Fair, Good, Excellent)  |
| Loan Amount Requested     | Amount applied for                                  |
| Existing Loans Count      | Number of existing loans                            |
| Late Payments Last Year   | Count of late payments                              |
| Loan Purpose              | Reason for loan (Business, Education, etc.)         |
| Loan Approved             | Loan status (Yes / No)                              |


##  Project Workflow

### ✅ Phase 1: Data Cleaning (MySQL)
- Checking for duplicates
- Checking and removing of nulls and inconsistent entries
- Standardizing data
- Adding age grouping, income grouping and credit ratings column

### ✅ Phase 2: Data Exploration (MySQL)
- Loan approval rate
- Approval rate by gender
- Approval rate by income group
- Approval rate by credit rating
- Top purpose of loan
- Loan approval vs late payments
- Top 10 ranking customers by credit scores
- Average loan amount by age group
- Customers with above average credit score in their age group
- Employment status impact on approval


## Results/ Key insights and findigs
- Majority of loan applications are approved.
- Approval rates are relatively balanced between genders.
- Higher income groups (100k+) show greater approval rates and applicants with income <50k have notably lower approval likelihood.
- Applicants rated "Excellent" or "Good" have significantly higher approval rates while those rated "Poor" are rarely approved, even if income is high.
- Top loan purposes include; Personal, Home and Education.

  ## Recomendations
- Consider tightening approval thresholds for applicants with poor credit + high late payments.
- Use CreditRating and LatePayments as top variables in spoting risky applicants.
- Explore flexible rates for high-income applicants with lower credit scores.


