
-- This project demonstrates the use of SQL functions and clauses to analyze stock market data of 20 Indian companies across multiple sectors.
-- Queries utilize selection (SELECT), filtering (WHERE), sorting (ORDER BY), and limiting (LIMIT) to extract specific insights. 
-- Advanced analysis is performed using aggregate functions (AVG, SUM, COUNT, MAX, MIN) combined with GROUP BY for sector- and exchange-level  
-- summaries. Together, these queries showcase how SQL can be applied to financial datasets to derive meaningful insights such as average prices, 
-- total market capitalization, and sectoral comparisons, making it a practical example of business analytics with SQL.


CREATE TABLE StockDataset (
    (StockID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    TickerSymbol VARCHAR(10),
    Sector VARCHAR(50),
    MarketCap DECIMAL(15,2),
    CurrentPrice DECIMAL(10,2),
    OpenPrice DECIMAL(10,2),
    ClosePrice DECIMAL(10,2),
    Volume BIGINT,
    Exchange VARCHAR(50));

INSERT INTO StockDataset (StockID, CompanyName, TickerSymbol, Sector, MarketCap, CurrentPrice, OpenPrice, ClosePrice, Volume, Exchange)
VALUES
(1, 'Reliance Industries', 'RELI', 'Energy', 150000000000.00, 2450.50, 2400.00, 2430.00, 12000000, 'NSE'),
(2, 'Tata Consultancy Services', 'TCS', 'IT Services', 120000000000.00, 3450.75, 3400.00, 3425.00, 8000000, 'BSE'),
(3, 'Infosys', 'INFY', 'IT Services', 70000000000.00, 1550.20, 1525.00, 1540.00, 9500000, 'NSE'),
(4, 'HDFC Bank', 'HDFCB', 'Banking', 90000000000.00, 1650.10, 1620.00, 1635.00, 11000000, 'BSE'),
(5, 'ICICI Bank', 'ICICIB', 'Banking', 80000000000.00, 950.60, 940.00, 945.00, 10000000, 'NSE'),
(6, 'State Bank of India', 'SBI', 'Banking', 60000000000.00, 750.40, 740.00, 745.00, 9500000, 'BSE'),
(7, 'Bharti Airtel', 'AIRTEL', 'Telecom', 50000000000.00, 680.30, 670.00, 675.00, 8500000, 'NSE'),
(8, 'Adani Enterprises', 'ADANIE', 'Conglomerate', 45000000000.00, 2200.90, 2150.00, 2180.00, 7000000, 'BSE'),
(9, 'Wipro', 'WIPRO', 'IT Services', 40000000000.00, 420.50, 410.00, 415.00, 6000000, 'NSE'),
(10, 'Tech Mahindra', 'TECHM', 'IT Services', 35000000000.00, 1250.80, 1230.00, 1245.00, 5000000, 'BSE'),
(11, 'HCL Technologies', 'HCLT', 'IT Services', 30000000000.00, 1150.25, 1130.00, 1140.00, 4800000, 'NSE'),
(12, 'Nestle India', 'NESTLE', 'FMCG', 25000000000.00, 22500.00, 22300.00, 22400.00, 200000, 'BSE'),
(13, 'Hindustan Unilever', 'HUL', 'FMCG', 28000000000.00, 2600.50, 2580.00, 2590.00, 3500000, 'NSE'),
(14, 'Asian Paints', 'ASIANP', 'Consumer Goods', 20000000000.00, 3100.75, 3050.00, 3080.00, 2500000, 'BSE'),
(15, 'Maruti Suzuki', 'MARUTI', 'Automobile', 35000000000.00, 9500.20, 9400.00, 9450.00, 1800000, 'NSE'),
(16, 'Mahindra & Mahindra', 'M&M', 'Automobile', 22000000000.00, 1650.40, 1620.00, 1635.00, 2000000, 'BSE'),
(17, 'Titan Company', 'TITAN', 'Consumer Goods', 18000000000.00, 3200.10, 3150.00, 3180.00, 1500000, 'NSE'),
(18, 'Sun Pharma', 'SUNP', 'Pharmaceuticals', 25000000000.00, 1150.60, 1130.00, 1145.00, 4000000, 'BSE'),
(19, 'Dr. Reddy’s Labs', 'DRL', 'Pharmaceuticals', 20000000000.00, 5200.30, 5100.00, 5150.00, 1200000, 'NSE'),
(20, 'Coal India', 'COAL', 'Energy', 15000000000.00, 250.80, 245.00, 248.00, 10000000, 'BSE');


select * from stockdataset



-- 1.Retrieve all columns from the StockDataset.

SELECT * FROM StockDataset;

-- 2.Display only CompanyName and CurrentPrice of all companies.

SELECT CompanyName, CurrentPrice FROM StockDataset;

-- 3.Show all companies in the IT Services sector.

SELECT * FROM StockDataset WHERE Sector = 'IT Services';

-- 4.Find the details of companies listed on the NSE exchange.

SELECT * FROM StockDataset WHERE Exchange = 'NSE';

-- 5.List the top 5 companies with the highest MarketCap.
    
  SELECT CompanyName, MarketCap FROM StockDataset ORDER BY MarketCap DESC LIMIT 5;
  
-- 6.Get companies where CurrentPrice is greater than 2000.

SELECT CompanyName, CurrentPrice FROM StockDataset WHERE CurrentPrice > 2000;

-- 7.Show companies in the Banking sector with MarketCap above 70 billion.

SELECT CompanyName, MarketCap FROM StockDataset WHERE Sector='Banking' AND MarketCap > 70000000000;

-- 8.Find companies whose ClosePrice is less than their OpenPrice.

SELECT CompanyName, OpenPrice, ClosePrice FROM StockDataset WHERE ClosePrice < OpenPrice;

-- 9.Retrieve companies with Volume greater than 10 million.

SELECT CompanyName, Volume FROM StockDataset WHERE Volume > 10000000;

-- 10.Display companies in the Energy sector.

SELECT * FROM StockDataset WHERE Sector = 'Energy';

-- 11.List companies ordered by CurrentPrice in descending order.

SELECT CompanyName, CurrentPrice FROM StockDataset ORDER BY CurrentPrice DESC;

-- 12.Show the top 3 companies with the lowest MarketCap.

SELECT CompanyName, MarketCap FROM StockDataset ORDER BY MarketCap ASC LIMIT 3;

-- 13.Sort companies by CompanyName alphabetically.

SELECT CompanyName FROM StockDataset ORDER BY CompanyName ASC;

-- 14.Display companies ordered by Volume in ascending order.

SELECT CompanyName, Volume FROM StockDataset ORDER BY Volume ASC;

-- 15.Find the top 5 companies with the highest ClosePrice.

SELECT CompanyName, ClosePrice FROM StockDataset ORDER BY ClosePrice DESC LIMIT 5;

-- 16.Find the average CurrentPrice of all companies.

SELECT AVG(CurrentPrice) AS AvgPrice FROM StockDataset;

-- 17.Calculate the total MarketCap of companies in the IT Services sector.

SELECT SUM(MarketCap) AS TotalCap FROM StockDataset WHERE Sector='IT Services';

-- 18.Count how many companies belong to the Banking sector.

SELECT COUNT(*) FROM StockDataset WHERE Sector='Banking';


-- 19.Find the maximum Volume among all companies.

SELECT MAX(Volume) FROM StockDataset;

-- 20.Get the minimum ClosePrice in the dataset.

SELECT MIN(ClosePrice) FROM StockDataset;

-- 21.Show the average CurrentPrice grouped by Sector.

SELECT Sector, AVG(CurrentPrice) AS AvgPrice FROM StockDataset GROUP BY Sector;

-- 22.Count the number of companies in each Exchange.

SELECT Exchange, COUNT(*) FROM StockDataset GROUP BY Exchange;

-- 23.Find the total MarketCap grouped by Sector.

SELECT Sector, SUM(MarketCap) AS TotalCap FROM StockDataset GROUP BY Sector;

-- 24.Display the highest ClosePrice for each Sector.

SELECT Sector, MAX(ClosePrice) AS MaxClose FROM StockDataset GROUP BY Sector;


-- 25.Show the average Volume grouped by Exchange.

SELECT Exchange, AVG(Volume) AS AvgVol FROM StockDataset GROUP BY Exchange;