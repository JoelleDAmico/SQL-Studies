# Write your MySQL query statement below
#select author_id as 'id' from Views where author_id = viewer_id;

# Main concepts from this example
# 'as' keyword changes the column title output
# How to Delete Duplicate rows

# CTE is a temporary table that can be used for data manipulation
WITH CTE (article_id,
    author_id,
    viewer_id,
    repeatrow) # create a new row that keeps track if it is a duplicate row
AS (SELECT article_id,author_id,viewer_id,
        ROW_NUMBER()OVER(PARTITION BY article_id,author_id,viewer_id ORDER BY article_id,author_id,viewer_id) AS RepeatRow
    FROM Views WHERE author_id = viewer_id # selects rows where the author is their own viewer
)

#Need repeat row to be equal to 1 
#(if it has a value greater than 1 then it is a duplicate and should not be repeated)
#SELECT author_id,repeatrow FROM CTE;
SELECT author_id as 'id' FROM CTE WHERE RepeatRow = 1 ORDER BY author_id; 
