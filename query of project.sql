use project;
select * from d3;
-- MEASURES

-- DATE REJECTED QUANTITY
select Doc_Date,
       sum(RejectedQty) as Date_Rejected_Qty
from d3
group by Doc_Date;

-- ESTIMATED DAYS 
select Wo_number,datediff(unit_delivery_date,wo_date) as Estimated_Days
from d3;

-- FINAL PROCESSED QUANTITY
SELECT wo_number,sum(finalprocessedqty)as Final_Processed_Qty
from d3
group by wo_number;

-- FINAL PROCESSED QUANTITY
SELECT sum(finalprocessedqty)as Final_Processed_Qty
from d3;


-- REJECTED QUANTITY F
select sum( rejectedqty) as Rejected_Qty_F
from d3;

-- TOTAL WASTAGE %
select wo_number,
       (sum(rejectedqty)*100/ nullif(sum(processedqty),0)) as Total_Wastage_percentage
from d3
group by wo_number;

-- TOTAL WASTAGE %
select
       sum(rejectedqty)*100/ nullif(sum(processedqty),0) as Total_Wastage_percentage
from d3;	

-- DELIVERY PERCENTAGE
SELECT 
    Customer_Name,
    (SUM(CASE WHEN `Delivery_Period` = 'On Time' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) 
    AS Delivery_Percentage
FROM D3
GROUP BY Customer_Name;

-- MANUFACTURED QUANTITY
SELECT sum(manufacturedqty) as Manufactured_Qty
from d3;

-- MANUFACTURING COST 
SELECT 
    SUM(`ManufacturedQty` * `PerdayMachineCostmade`) AS Manufacturing_Cost
FROM D3;

-- PROCESSED QUANTITY
SELECT SUM(processedqty) as Processed_Quantity
from d3;