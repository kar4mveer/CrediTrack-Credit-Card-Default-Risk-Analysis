# CrediTrack — Credit Card Default Risk Analysis

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-T--SQL-red?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server">
  <img src="https://img.shields.io/badge/Power%20BI-Dashboard-yellow?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI">
  <img src="https://img.shields.io/badge/Exploratory-Data%20Analysis-blue?style=for-the-badge" alt="Exploratory Data Analysis">
  <img src="https://img.shields.io/badge/Risk-Analytics-purple?style=for-the-badge" alt="Risk Analytics">
  <img src="https://img.shields.io/badge/Project-Completed-brightgreen?style=for-the-badge" alt="Project Status">
</p>

> An end-to-end SQL Server and Power BI project analyzing historical credit card default patterns, repayment delays, credit limits, billing amounts, and customer payment behaviour to derive actionable business insights.

---

## Project Overview

**CrediTrack** is a data analytics project focused on understanding credit card default patterns and identifying customer segments with higher observed default rates.

The project uses SQL Server for data exploration and business analysis, followed by Power BI for interactive visualization and reporting. It examines customer demographics, credit limits, repayment status, billing amounts, and payment-to-bill ratios to understand how these factors relate to historical payment defaults.

The analysis converts raw customer records into portfolio-level metrics, comparative analysis, and business recommendations for risk monitoring.

### Project Objectives

- Measure the overall observed credit card default rate.
- Compare default rates across customer segments and credit-limit ranges.
- Investigate the relationship between repayment delays and defaults.
- Compare billing and payment behaviour between default-status groups.
- Examine payment-to-bill ratios across six historical payment periods.
- Develop an interactive Power BI dashboard for portfolio analysis.
- Translate findings into practical business recommendations.

## Dataset Overview

The project uses the **Default of Credit Card Clients** dataset from the UCI Machine Learning Repository.

| Metric | Details |
|---|---|
| Total Customer Records | 30,000 |
| Historical Data Context | Taiwan, 2005 |
| Target Variable | `default_payment_next_month` |
| Defaulted Customers | 6,636 |
| Non-Defaulted Customers | 23,364 |
| Overall Observed Default Rate | 22.12% |

**Dataset Source:** [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/350/defaultofcreditcardclients)

*The dataset is historical. Its results should not be assumed to represent the behaviour of a current credit card portfolio.*

## Project Architecture

```text
Raw Customer Dataset
        |
        v
SQL Server Database
        |
        v
Data Exploration & Validation
        |
        v
SQL-Based Business Analysis
        |
        v
Customer Segmentation & Risk Analysis
        |
        v
Power BI Dashboard
        |
        v
Business Insights & Recommendations
```

## SQL Analysis

The project is organized around business questions, with SQL used to calculate metrics, compare customer groups, and investigate historical repayment patterns.

### 1. Portfolio Overview & Customer Segmentation

**Business Question:** How common is default, and which customer groups have higher observed default rates?

**Analysis Performed**
- Calculated total customers, defaulted customers, and non-defaulted customers.
- Measured the overall observed default rate.
- Compared default rates across age groups.
- Examined education and marital-status categories.
- Segmented customers by credit-limit ranges.
- Compared credit-limit distributions across default-status groups.

**Key Findings**
- The overall observed default rate was **22.12%**.
- Customers with credit limits below 50K had a **36.07% observed default rate**.
- Observed default rates generally decreased across higher credit-limit ranges.
- Default rates varied across customer segments.

### 2. Repayment Delay Analysis

**Business Question:** Are repayment delays associated with higher observed default rates?

**Analysis Performed**
- Examined repayment-status codes across multiple payment periods.
- Calculated default rates for different repayment-delay codes.
- Compared customers with positive delay codes against those with zero or negative codes.
- Evaluated differences in observed default rates between these groups.

**Key Findings**

| Repayment Status Group | Customers | Defaulted | Observed Default Rate |
|---|---:|---:|---:|
| Zero or Negative Code | 23,182 | 3,207 | 13.83% |
| Positive Delay Code | 6,818 | 3,429 | 50.29% |

Customers with positive repayment-delay codes had approximately **3.64 times the observed default rate** of customers with zero or negative codes.

This highlights repayment behaviour as an important area for further account review and monitoring.

### 3. Credit Limit Analysis

**Business Question:** How do approved credit limits differ between customers who defaulted and those who did not?

**Analysis Performed**
- Calculated average, minimum, and maximum credit limits by default status.
- Compared credit-limit ranges across customer groups.
- Examined observed default rates within each range.

**Key Findings**

| Metric | Non-Defaulted | Defaulted |
|---|---:|---:|
| Customers | 23,364 | 6,636 |
| Average Credit Limit | 178,099 | 130,109 |
| Minimum Credit Limit | 10,000 | 10,000 |
| Maximum Credit Limit | 1,000,000 | 740,000 |

The average approved credit limit was lower among customers who defaulted.

Credit limits represent approved limits, not outstanding balances or actual financial losses. These findings describe an association and do not establish causation.

### 4. Billing & Payment Analysis

**Business Question:** How do billing amounts and payment behaviour differ between default-status groups?

**Analysis Performed**
- Compared average bill amounts across six historical periods.
- Calculated average payment amounts by default status.
- Examined first-period bill amounts across customer groups.
- Compared payment behaviour between defaulted and non-defaulted customers.

**Key Findings**
- Average first-period bill amount was **51.99K** among non-defaulted customers and **48.51K** among defaulted customers.
- Average first-period payment amount was **6.31K** among non-defaulted customers and **3.40K** among defaulted customers.
- Average bill amounts alone did not clearly distinguish the two groups.
- Payment behaviour provided additional context for understanding the differences between the groups.

### 5. Payment-to-Bill Ratio Analysis

**Business Question:** How does the proportion of a bill paid relate to observed default rates?

**Analysis Performed**
- Grouped customers by payment-to-bill ratio.
- Compared observed default rates across ratio bands.
- Repeated the analysis across six historical periods.
- Examined differences between customers paying lower and higher proportions of their bills.

**Key Findings — First Period**

| Payment-to-Bill Ratio | Customers | Defaulted | Observed Default Rate |
|---|---:|---:|---:|
| Below 10% | 16,786 | 4,096 | 24.40% |
| 10%–49.99% | 5,176 | 1,084 | 20.94% |
| 50%–99.99% | 1,569 | 213 | 13.58% |
| 100% and Above | 3,871 | 600 | 15.50% |

Customers paying less than 10% of their bills had a higher observed default rate than customers in the 50%–99.99% group.

The pattern was not perfectly linear: the 100%-and-above group also had a higher observed default rate than the 50%–99.99% group.

Across all six periods, the below-10% group consistently showed higher observed default rates than the 50%–99.99% group.

## Power BI Dashboard

The Power BI report combines the analytical findings into an interactive portfolio-monitoring dashboard.

### Dashboard Pages

| Page | Focus | Key Components |
|---|---|---|
| Page 1 | Overview | Portfolio KPIs, customer counts, overall default rate |
| Page 2 | Segmentation | Customer groups, demographic filters, default-rate comparisons |
| Page 3 | Credit Limit Analysis | Average credit limits, credit-limit bands, observed default rates |
| Page 4 | Repayment Behaviour | Repayment-delay analysis, default-rate comparisons, delay trends |
| Page 5 | Bill & Payment Analysis | Bill amounts, payment amounts, payment-to-bill ratios |
| Page 6 | Insights & Recommendations | Portfolio summary, risk indicators, business recommendations |

### Dashboard Features

- KPI cards for portfolio-level metrics.
- Interactive slicers for age, education, marital status, credit limit, and gender.
- Comparative charts for customer segments.
- Repayment-delay analysis.
- Credit-limit range analysis.
- Billing and payment behaviour comparisons.
- Payment-to-bill ratio analysis.
- Consolidated business insights and recommendations.

## Dashboard Preview

The Power BI report includes six pages covering portfolio overview, customer segmentation, credit-limit analysis, repayment behaviour, billing and payment analysis, and final recommendations.

*Open `CrediTrack.pdf` in the repository to explore the dashboard pages.*

## Key Business Insights

### 1. Repayment Delays Are Strongly Associated with Defaults

Customers with positive repayment-delay codes had a **50.29% observed default rate**, compared with **13.83%** for customers with zero or negative codes.

### 2. Lower Credit-Limit Segments Show Higher Observed Default Rates

Customers with credit limits below 50K had a **36.07% observed default rate**. This segment may warrant further examination alongside repayment history and other customer information.

### 3. Payment Behaviour Provides Additional Insight

Customers who defaulted had lower average payment amounts than non-defaulted customers in the first historical period.

### 4. Persistently Low Payment-to-Bill Ratios Deserve Attention

Customers paying less than 10% of their bills consistently showed higher observed default rates than those paying 50%–99.99% of their bills.

### 5. Bill Amounts Alone Do Not Clearly Separate the Groups

Average bill amounts were relatively similar between the two groups, suggesting that billing amounts should be considered alongside repayment behaviour rather than in isolation.

## Business Recommendations

| Area | Recommendation | Purpose |
|---|---|---|
| Repayment Monitoring | Flag accounts with positive repayment-delay codes for review. | Identify accounts that may require attention. |
| Customer Outreach | Consider timely reminders and appropriate follow-up for delayed payments. | Encourage repayment and support account management. |
| Credit Limit Review | Examine lower credit-limit segments alongside repayment history and other available information. | Better understand where elevated observed default rates are concentrated. |
| Payment Behaviour | Review persistently low payment-to-bill ratios. | Identify accounts that may benefit from additional review. |
| Portfolio Reporting | Monitor observed default rates across customer segments and repayment behaviour. | Support consistent portfolio analysis. |
| Ongoing Validation | Reassess findings using recent portfolio data before operational use. | Ensure recommendations remain relevant to current customers. |

*These are proposed recommendations based on descriptive analysis. Their effectiveness has not been tested through a live intervention or a validated predictive model.*

## Skills Demonstrated

### SQL & Database Analysis
- Microsoft SQL Server and SSMS
- T-SQL
- Aggregate functions
- `CASE` statements and conditional logic
- Common Table Expressions (CTEs)
- Subqueries
- Data grouping and segmentation
- Window functions

### Data Analytics
- Exploratory Data Analysis (EDA)
- KPI calculation
- Default-rate analysis
- Customer segmentation
- Repayment behaviour analysis
- Comparative analysis
- Business insight generation

### Power BI & Business Intelligence
- Interactive dashboards
- KPI cards and charts
- Slicers and filters
- Data visualization
- Business reporting

### Business Analysis
- Risk-segment monitoring
- Payment behaviour interpretation
- Business recommendations
- Communicating analytical findings

## Repository Structure

```text
CrediTrack-Credit-Card-Default-Risk-Analysis/
│
├── Dataset/
│   └── Dataset files
│
├── SQL_Queries/
│   └── SQL analysis scripts
│
├── CrediTrack.pdf
│
└── README.md
```

*Ensure the folder names and files shown above match the actual repository contents.*

## Limitations

- The dataset represents historical credit card customer behaviour from Taiwan in 2005.
- Observed relationships do not establish causation.
- The project uses exploratory and descriptive analytics, not a machine learning model.
- Small customer groups may produce unstable observed default rates.
- Findings should be validated on current portfolio data before being applied to real-world credit decisions.

## 👨‍💻 Author

**Karamveer Singh**  
*Aspiring Data Analyst | SQL | Power BI | Python | Business Intelligence*

### Connect with me

- 💻 **GitHub:** [kar4mveer](https://github.com/kar4mveer)
- 🔗 **LinkedIn:** [Karamveer Singh](https://www.linkedin.com/in/kar4mveer/)

---

⭐ If you find this project useful, consider starring the repository.
