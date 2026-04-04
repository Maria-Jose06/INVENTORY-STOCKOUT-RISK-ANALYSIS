# INVENTORY-STOCKOUT-RISK-ANALYSIS
End-to end inventory stockout risk analysis using MySql, Python, Excel and Power BI. This project is focused on identifying supply chain inefficiencies by analysing the different key metric to detect the high-risk SKUs. I also created a dashboard to facilitate the decision-taking and actions ahead to reduce possible future stockouts. 

BUSINESS PROBLEM
- Identify SKUs in risk of stockout.
- Identify the financial impact of these risky SKUs.
- Identify the inventory adjustment that must be made to avoid future stockouts.

KEY INSIGHT

The inital inventory of 20% of the SKUs do not cover the lead time due to understocking, which most probably will eventually lead to an stockout of, on average, ~5,18 days. Furthermore, initial inventory levels are below the ROP (reorder point) in, on average, ~111 less units than optimal, which suggests a potential misalignment between replenishment parameters and current demand or supply conditions. This might result in revenue losses of aproximately ~378.957k. It is recommended to review initial invenory calculations and immediately place replenishmenr orders to mitigate the financial impact.  


DATASET DESCRIPTION
- Source: Kaggle. I simulated missing data that was required for the project, such as: Lead time and Initial inventory
- Size: 1000 rows, 7 columns
- Note: Seasonality was not considered.
