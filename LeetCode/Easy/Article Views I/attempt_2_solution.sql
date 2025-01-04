# Simple solution that provides the same outcome and resolves edgecase dependency issues.
# Main Lessons:
# 1) use 'as' keyword to change the column output name
# 2) use 'distinct' function to select non-repeat rows for the output table

SELECT distinct(author_id) as 'id' from Views where author_id=viewer_id order by author_id;
