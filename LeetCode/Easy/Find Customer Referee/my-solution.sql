# Write your MySQL query statement below
SELECT name FROM Customer WHERE referee_id != 2 || referee_id IS null;

# Main lesson from this problem: NULL values must use the IS or IS NOT operator
