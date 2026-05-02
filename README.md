# INVENTORY-STOCKOUT-RISK-ANALYSIS
End-to end inventory stockout risk analysis using MySql, Python, Excel and Power BI. This project is focused on identifying supply chain inefficiencies by analysing the different key metric to detect the high-risk SKUs. I also created a dashboard to facilitate the decision-taking and actions ahead to reduce possible future stockouts. 

BUSINESS PROBLEM
- Identify SKUs in risk of stockout.
- Identify the financial impact of these risky SKUs.
- Identify the inventory adjustment that must be made to avoid future stockouts.


KEY INSIGHT

The inital inventory of 20% of the SKUs do not cover the lead time due to understocking, which most probably will eventually lead to an stockout of, on average, ~5,18 days. Furthermore, initial inventory levels are below the ROP (reorder point) in, on average, ~111 less units than optimal, which suggests a potential misalignment between replenishment parameters and current demand or supply conditions. This might result in revenue losses of aproximately ~378.957k. It is recommended to review initial invenory calculations and immediately place replenishmenr orders to mitigate the financial impact.  
<img width="882" height="504" alt="image" src="https://github.com/user-attachments/assets/750c02e2-525c-4ddc-a644-b94948e06ee2" />

- Some project pictures:

Python calculations:

<img width="1094" height="592" alt="image" src="https://github.com/user-attachments/assets/a61168f1-a289-4c06-9183-c0344fa8c6e8" />

MySQL data consulting:

<img width="598" height="469" alt="image" src="https://github.com/user-attachments/assets/94de9ec9-fd84-473c-b593-4e5215c6d43e" />


DATASET DESCRIPTION
- Source: Kaggle. I simulated missing data that was required for the project, such as: Lead time and Initial inventory
- Size: 1000 rows, 7 columns
- Note: Seasonality was not considered in this project. 
<img width="598" height="456" alt="image" src="https://github.com/user-attachments/assets/b4d4391e-b5e9-47ff-88c2-e6a97ae9fd6f" />

