# Main Concept: Comparing column entries against last previous entry or yesterday's date
# LAG() function & Implementation
# DATEDIFF() function & Implementation
# OVER keyword and ORDER BY keyword

WITH cte AS (
    SELECT id, 
    recordDate, 
    temperature, #Creates temporary table
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    DATEDIFF(LAG(recordDate) OVER (ORDER BY recordDate), recordDate) AS yesterday 
    FROM Weather) #Includes previous temperature and validation that previous date input is yesterday
SELECT id as Id FROM cte 
WHERE prev_temp < temperature AND yesterday = -1; 
# Only select days which are 'yesterday' for previous temperature comparison
