--WHOLE DATA
SELECT * 
FROM dbo.CreditCardData

--TOP 5
SELECT TOP 5 *
FROM dbo.CreditCardData

--MIN AND MAX ID, JUST TO CHECK
SELECT
    MIN(ID) AS FirstCustomerID,
    MAX(ID) AS LastCustomerID
FROM dbo.CreditCardData



--UNIQUE AND TOTAL CHECK
SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT ID) AS UniqueCustomerIDs
FROM dbo.CreditCardData;


--DUPLICATE CHECK
SELECT
    ID,
    COUNT(*) AS IDCount
FROM dbo.CreditCardData
GROUP BY ID
HAVING COUNT(*) > 1;


--MISSING CHECK
SELECT
    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS MissingIDs,
    SUM(CASE WHEN LIMIT_BAL IS NULL THEN 1 ELSE 0 END) AS MissingCreditLimits,
    SUM(CASE WHEN AGE IS NULL THEN 1 ELSE 0 END) AS MissingAges
FROM dbo.CreditCardData;


--DEFAULT VALUE CHECK
SELECT
    default_payment_next_month AS DefaultLabel,
    COUNT(*) AS CustomerCount
FROM dbo.CreditCardData
GROUP BY default_payment_next_month
ORDER BY DefaultLabel;