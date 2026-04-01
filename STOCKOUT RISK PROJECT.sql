SELECT *
FROM sales_data;

SELECT Product_ID
FROM sales_data 
WHERE Product_ID < 1100;

SELECT MIN(Product_ID)
FROM sales_data;

-- DELETE 
-- 	Sales representative, sales amount, discount, customer type, payment method, sales channel

CREATE TABLE `sales` (
  `product_id` int DEFAULT NULL,
  `sdate` text,
  `Sales_Rep` text,
  `region` text,
  `Sales_Amount` double DEFAULT NULL,
  `units_sold` int DEFAULT NULL,
  `product_category` text,
  `unit_cost` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `Customer_Type` text,
  `Discount` double DEFAULT NULL,
  `Payment_Method` text,
  `sales_Channel` text,
  `Region_and_Sales_Rep` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sales 
SELECT *
FROM sales_data;

SELECT *
FROM sales;

ALTER TABLE sales
DROP COLUMN Sales_Rep;

ALTER TABLE sales
DROP COLUMN Sales_Amount;

ALTER TABLE sales 
DROP COLUMN Customer_Type;

ALTER TABLE sales 
DROP COLUMN Discount;

ALTER TABLE sales 
DROP COLUMN Payment_Method;

ALTER TABLE sales
DROP COLUMN sales_Channel;

ALTER TABLE sales 
DROP COLUMN Region_and_Sales_Rep;

ALTER TABLE sales 
DROP COLUMN region;

SELECT ROUND(unit_price,2)
FROM sales;

UPDATE sales
SET unit_price = ROUND(unit_price,2);
    
SELECT unit_price 
FROM sales;

SELECT *
FROM sales;
    
SELECT *
FROM sales 
WHERE product_id = 1100;

SELECT COUNT(DISTINCT product_id)
FROM sales;

SELECT COUNT(DISTINCT product_id, sdate)
FROM sales;

SELECT MIN(sdate), MAX(sdate)
FROM sales; 

SELECT count(product_id)
FROM sales 
WHERE product_id = 1001;

SELECT product_id, units_sold, unit_price
FROM sales
WHERE product_id = 1001;

SELECT product_id, units_sold, unit_price
FROM sales
WHERE product_id = 1002sales;

CREATE TABLE `params` (
  `product_id` int DEFAULT NULL,
  `avg_daily_demand` double DEFAULT NULL,
  `demand_std` double DEFAULT NULL,
  `tunits_sold` int DEFAULT NULL,
  `trevenue` double DEFAULT NULL,
  `initial_inventory` int DEFAULT NULL,
  `lead_time_days` int DEFAULT NULL,
  `safety_stock` double DEFAULT NULL,
  `rop` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `params`
SELECT *
FROM sku_params;


SELECT *
FROM sales s
LEFT JOIN sku_params p
ON s.product_id = p.product_id;
    
SELECT COUNT(rop_close), at_risk
FROM sku_params
WHERE rop_close < 0 
	AND at_risk = 'True'
ORDER BY rop_close ASC;


SELECT MIN(sdate), MAX(sdate)
FROM sales
WHERE product_id = 1002;

SELECT COUNT(units_sold)
FROM sales 
WHERE product_id = 1002;

SELECT sdate, units_sold, unit_price, (units_sold * unit_price) AS ind
FROM sales
WHERE product_id = 1002
ORDER BY unit_price DESC;

--

SELECT *
FROM sku_params;

SELECT product_id,
	lead_time_days,
	trevenue
FROM sku_params
WHERE lead_time_days > days_cover
	AND initial_inventory < rop
    AND rop_close > 0
    AND at_risk = 'True'
ORDER BY trevenue;

-- COMPARE INITIAL INVENTORY, ROP AND SS

SELECT product_id
FROM sku_params
WHERE initial_inventory < rop
AND at_risk = 'True';

SELECT product_id, no_stock_days
FROM sku_params
WHERE no_stock_days > 0
ORDER BY no_stock_days DESC;

SELECT COUNT(*)
FROM sku_params
WHERE no_stock_days > 0;

SELECT *
FROM sku_params
ORDER BY revenue_risk DESC;

SELECT *
FROM sku_params
WHERE revenue_risk > 0
ORDER BY revenue_risk DESC;

SELECT product_id
FROM sku_params
WHERE revenue_risk > 0
ORDER BY revenue_risk DESC;

SELECT COUNT(*)
FROM sku_params
WHERE revenue_risk > 0
ORDER BY revenue_risk DESC;

SELECT SUM(revenue_risk)
FROM sku_params
WHERE revenue_risk > 0
ORDER BY revenue_risk DESC;

SELECT product_id, revenue_risk, sku_risk_pctg
FROM sku_params
WHERE sku_risk_pctg > 0
ORDER BY sku_risk_pctg DESC; 

--

SELECT product_id, revenue_risk, sku_risk_pctg
FROM sku_params
WHERE sku_risk_pctg > 0
ORDER BY sku_risk_pctg DESC; -- FINANCIAL IMPACT

--

SELECT product_id, priority 
FROM sku_params
ORDER BY priority DESC;

SELECT product_id, prior
FROM sku_params
ORDER BY prior DESC; -- PRIORITY 

-- ROOT CAUSES 

SELECT 	
	product_id, 
    demand_std, 
    avg_daily_dmd,
    lead_time_days,
	days_cover,
    no_stock_days,
    safety_stock,
    rop, 
    rop_close,
	initial_inventory
FROM sku_params 
WHERE at_risk = 'True';

SELECT 	
	product_id, 
    demand_std, 
    avg_daily_dmd,
    lead_time_days,
	days_cover,
    no_stock_days,
    safety_stock,
    rop, 
    rop_close,
	initial_inventory
FROM sku_params 
WHERE at_risk = 'False';


-- Lead times longer than cover days 

SELECT 
	MAX(no_stock_days),
    MIN(no_stock_days),
    AVG(no_stock_days)
FROM sku_params
WHERE at_risk = 'True';    

SELECT 
	MAX(no_stock_days),
    MIN(no_stock_days),
    AVG(no_stock_days)
FROM sku_params
WHERE at_risk = 'False';  

SELECT 
	product_id,
    no_stock_days
FROM sku_params
WHERE at_risk = 'True'
ORDER BY no_stock_days DESC;

SELECT COUNT(product_id)
FROM sku_params
WHERE no_stock_days > 0;


-- Rop negative

SELECT COUNT(product_id)
FROM sku_params
WHERE rop_close < 0
AND at_risk = 'True';

SELECT 
	MAX(rop_close),
    MIN(rop_close),
    AVG(rop_close)
FROM sku_params
WHERE at_risk = 'True';  

SELECT 
	MAX(rop_close),
    MIN(rop_close),
    AVG(rop_close)
FROM sku_params
WHERE at_risk = 'False';  

SELECT 
	product_id,
    rop_close
FROM sku_params
WHERE at_risk = 'True'
ORDER BY rop_close DESC;

SELECT 
	COUNT(product_id)
FROM sku_params 
WHERE rop_close < 0;

SELECT rop_close 
FROM sku_params;


-- Safety stock and initial invetory

SELECT product_id
FROM sku_params
WHERE initial_inventory < safety_stock; 

SELECT 
	COUNT(product_id)
FROM sku_params
WHERE initial_inventory < safety_stock; 



-- Demand volatility

SELECT 
	MAX(demand_std),
    MIN(demand_std),
    AVG(demand_std)
FROM sku_params
WHERE at_risk = 'True';  

SELECT 
	MAX(demand_std),
    MIN(demand_std),
    AVG(demand_std)
FROM sku_params
WHERE at_risk = 'False'; 
 
SELECT 
	AVG(demand_std)
FROM sku_params;

SELECT COUNT(product_id)
FROM sku_params
WHERE demand_std > 0
AND at_risk = 'True';


SELECT demand_std
FROM sku_params;


-- SKU params cleaning because decimals are too extense 

SELECT *
FROM sku_params;

SELECT 	
	ROUND(demand_std,2),
    ROUND(trevenue,2), 
    ROUND(avg_daily_dmd,2),
    ROUND(safety_stock,2),
    ROUND(rop,2),
    ROUND(days_cover,2),
    ROUND(rop_close,2),
    ROUND(no_stock_days,2),
    ROUND(dmd_lost,2),
    ROUND(avg_price,2),
    ROUND(sku_risk_pctg,2),
    ROUND(ac_risk_pct,2),
    ROUND(priority,2),
    ROUND(initial_inventory_op, 2)
FROM sku_params;

UPDATE sku_params 
	SET 
		demand_std = ROUND(demand_std,2),
        trevenue = ROUND(trevenue, 2),
        avg_daily_dmd = ROUND(avg_daily_dmd,2),
        safety_stock = ROUND(safety_stock,2),
        rop = ROUND(rop,2),
        days_cover = ROUND(days_cover,2),
        rop_close = ROUND(rop_close,2),
        no_stock_days = ROUND(no_stock_days,2),
        dmd_lost = ROUND(dmd_lost,2),
        avg_price = ROUND(avg_price,2),
        sku_risk_pctg = ROUND(sku_risk_pctg,2),
        ac_risk_pct = ROUND(ac_risk_pct,2),
        priority = ROUND(priority,2),
        revenue_risk = ROUND(revenue_risk, 2), 
        avg_daily_revenue = ROUND(avg_daily_revenue, 2),
        prior = ROUND(prior, 2),
        initial_inventory_op = ROUND(initial_inventory_op, 2)
	;
    
SELECT *
FROM sku_params;

SELECT initial_inventory_op
FROM sku_params
WHERE product_id = '1019'; -- VERIFYING THE OPTIMAL INVENTORY 
    
-- Selecting priority
    
SELECT product_id
FROM sku_params 
WHERE at_risk = 'True'
ORDER BY prior DESC;

SELECT SUM(revenue_risk)
FROM sku_params; -- SUM REVENUE IN RISK

    
    
    
    
    
    