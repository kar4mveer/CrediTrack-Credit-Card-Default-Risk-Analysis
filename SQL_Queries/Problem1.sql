--     BUSINESS PROBLEM: HOW COMMON IS DEFAULT, AND WHICH GROUPS HAVE HIGHER RATES?

USE CrediTrackDB

--CALCULATING DEFAULT RATE
SELECT
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(CASE
        WHEN default_payment_next_month = 1 THEN 1
        ELSE 0
    END) AS DEFAULTED_CUSTOMERS,
    SUM(CASE
        WHEN default_payment_next_month = 0 THEN 1
        ELSE 0
    END) AS NON_DEFAULTED_CUSTOMERS,
    CAST(
        100.0 * SUM(CASE
            WHEN default_payment_next_month = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS DEFAULT_RATE_PERCENTAGE
FROM dbo.CreditCardData;

--DEFAULT RATES ACROSS DIFFERENT AGE GROUPS
SELECT
    CASE
        WHEN AGE < 25 THEN 'UNDER 25'
        WHEN AGE BETWEEN 25 AND 34 THEN '25-34'
        WHEN AGE BETWEEN 35 AND 44 THEN '35-44'
        WHEN AGE BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 AND ABOVE'
    END AS AGE_GROUP,

    COUNT(*) AS TOTAL_CUSTOMERS,

    SUM(CASE
        WHEN default_payment_next_month = 1 THEN 1
        ELSE 0
    END) AS DEFAULTED_CUSTOMERS,

    CAST(
        100.0 * SUM(CASE
            WHEN default_payment_next_month = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS DEFAULT_RATE_PERCENTAGE

FROM dbo.CreditCardData
GROUP BY
    CASE
        WHEN AGE < 25 THEN 'UNDER 25'
        WHEN AGE BETWEEN 25 AND 34 THEN '25-34'
        WHEN AGE BETWEEN 35 AND 44 THEN '35-44'
        WHEN AGE BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 AND ABOVE'
    END
ORDER BY MIN(AGE);


--DEFAULT RATES ACROSS EDUCATION
SELECT
    EDUCATION AS EDUCATION_CATEGORY,
    COUNT(*) AS TOTAL_CUSTOMERS,

    SUM(CASE
        WHEN default_payment_next_month = 1 THEN 1
        ELSE 0
    END) AS DEFAULTED_CUSTOMERS,

    CAST(
        100.0 * SUM(CASE
            WHEN default_payment_next_month = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS DEFAULT_RATE_PERCENTAGE

FROM dbo.CreditCardData
GROUP BY EDUCATION
ORDER BY EDUCATION;



--DEFAULT RATES ACROSS MARITAL STATUS
SELECT
    MARRIAGE AS MARITAL_STATUS_CATEGORY,
    COUNT(*) AS TOTAL_CUSTOMERS,

    SUM(CASE
        WHEN default_payment_next_month = 1 THEN 1
        ELSE 0
    END) AS DEFAULTED_CUSTOMERS,

    CAST(
        100.0 * SUM(CASE
            WHEN default_payment_next_month = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS DEFAULT_RATE_PERCENTAGE

FROM dbo.CreditCardData
GROUP BY MARRIAGE
ORDER BY MARRIAGE;


--DEFAULT RATES ACROSS APPROVED CREDIT-LIMIT RANGE
SELECT
    CASE
        WHEN LIMIT_BAL < 50000 THEN 'BELOW 50K'
        WHEN LIMIT_BAL < 100000 THEN '50K-99,999'
        WHEN LIMIT_BAL < 200000 THEN '100K-199,999'
        WHEN LIMIT_BAL < 500000 THEN '200K-499,999'
        ELSE '500K AND ABOVE'
    END AS CREDIT_LIMIT_RANGE,

    COUNT(*) AS TOTAL_CUSTOMERS,

    SUM(CASE
        WHEN default_payment_next_month = 1 THEN 1
        ELSE 0
    END) AS DEFAULTED_CUSTOMERS,

    CAST(
        100.0 * SUM(CASE
            WHEN default_payment_next_month = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS DEFAULT_RATE_PERCENTAGE

FROM dbo.CreditCardData
GROUP BY
    CASE
        WHEN LIMIT_BAL < 50000 THEN 'BELOW 50K'
        WHEN LIMIT_BAL < 100000 THEN '50K-99,999'
        WHEN LIMIT_BAL < 200000 THEN '100K-199,999'
        WHEN LIMIT_BAL < 500000 THEN '200K-499,999'
        ELSE '500K AND ABOVE'
    END
ORDER BY MIN(LIMIT_BAL);