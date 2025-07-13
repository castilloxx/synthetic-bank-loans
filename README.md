# Loan Portfolio Analysis

## Project overview
This project focuses on cleaning, exploring, and visualizing a synthetic loan dataset. It simulates real-world loan application data, with the aim of identifying patterns in loan approval, credit risk, and borrower behavior.

<img width="1366" height="768" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/7b73baee-9f64-44b3-9d6e-c45e433b7e40" />


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

###  Phase 1: Data Cleaning (MySQL)
- Checking for duplicates
- Checking and removing of nulls and inconsistent entries
- Standardizing data
- Adding age grouping, income grouping and credit ratings column

###  Phase 2: Data Exploration (MySQL)
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

### Phase 3: Visualization (Tableau Public)
#### Key Charts:
-  KPI Cards (Total Applicants, Average creditscore, Average loan amount.)
-  Loan Approvals by Gender
-  Loan Purpose Distribution (Pie Chart)
-  Credit rating vs Approval
-  Approval by income group
-  Approval rate
-  Late payment vs Approval

## Tableau Dashboard Preview

🔗 [View Dashboard on Tableau Public](https://public.tableau.com/app/profile/favour.chukwudozie.ndu.arinze/viz/Book1_17516151748530/Dashboard1)


## Results/ Key insights and findings
- Majority of loan applications are approved.
- Approval rates are relatively balanced between genders.
- Higher income groups (100k+) show greater approval rates and applicants with income <50k have notably lower approval likelihood.
- Applicants rated "Excellent" or "Good" have significantly higher approval rates while those rated "Poor" are rarely approved, even if income is high.
- Top loan purposes include; Personal, Home and Education.

  ## Recomendations
- Consider tightening approval thresholds for applicants with poor credit + high late payments.
- Use CreditRating and LatePayments as top variables in spoting risky applicants.
- Explore flexible rates for high-income applicants with lower credit scores.


