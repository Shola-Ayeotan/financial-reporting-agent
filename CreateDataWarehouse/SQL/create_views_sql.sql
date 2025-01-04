
CREATE VIEW PortfolioAssetAllocation AS
SELECT
    p.PortfolioID,
    p.Name AS PortfolioName,
    pa.AssetID,
    a.Name AS AssetName,
    pa.Allocation,
    a.CurrentValue,
    (pa.Allocation / 100.0) * a.CurrentValue AS AllocatedValue
FROM
    Portfolios p
JOIN
    PortfolioAssets pa ON p.PortfolioID = pa.PortfolioID
JOIN
    Assets a ON pa.AssetID = a.AssetID;




CREATE VIEW ClientPortfolioValue AS
SELECT
    c.ClientID,
    c.Name AS ClientName,
    SUM(pa.Allocation * a.CurrentValue / 100.0) AS TotalPortfolioValue
FROM
    Clients c
JOIN
    Portfolios p ON c.ClientID = p.ClientID
JOIN
    PortfolioAssets pa ON p.PortfolioID = pa.PortfolioID
JOIN
    Assets a ON pa.AssetID = a.AssetID
GROUP BY
    c.ClientID, c.Name;



CREATE VIEW PortfolioSummary AS
SELECT
    p.PortfolioID,
    p.Name AS PortfolioName,
    c.ClientID,
    c.Name AS ClientName,
    SUM(pa.Allocation * a.CurrentValue / 100.0) AS TotalPortfolioValue,
    COUNT(DISTINCT pa.AssetID) AS NumberOfAssets
FROM
    Portfolios p
JOIN
    Clients c ON p.ClientID = c.ClientID
JOIN
    PortfolioAssets pa ON p.PortfolioID = pa.PortfolioID
JOIN
    Assets a ON pa.AssetID = a.AssetID
GROUP BY
    p.PortfolioID, p.Name, c.ClientID, c.Name;



CREATE VIEW AccountTransactionHistory AS
SELECT
    t.TransactionID,
    a.AccountID,
    acc.AccountType,
    a.AssetID,
    t.Date,
    t.Type AS TransactionType,
    t.Amount,
    a.CurrentValue
FROM
    Transactions t
JOIN
    Accounts acc ON t.AccountID = acc.AccountID
JOIN
    Assets a ON t.AssetID = a.AssetID
ORDER BY
    t.Date DESC;


CREATE VIEW OverallWealthSummary AS
SELECT
    a.AssetType,
    COUNT(a.AssetID) AS NumberOfAssets,
    SUM(a.CurrentValue) AS TotalWealth
FROM
    Assets a
GROUP BY
    a.AssetType;
