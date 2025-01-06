# Write your MySQL query statement below
# content only has characters from American Keyboard
# Find ids of invalid tweets

# Main Concept: Counting characters in a data entry
# Important Note: MySQL does not have a built-in LEN() function
# need to use LENGTH() instead

#select LENGTH(content) as tweet_length from Tweets;

# Create temporary table with another column that contains the length of content
WITH
    cte_length as (select tweet_id, content, LENGTH(content) as tweet_length from Tweets)
SELECT tweet_id from cte_length where tweet_length > 15;
