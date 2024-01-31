SELECT *
FROM data_analyst_jobs;

-- 1. How many rows are in the data_analyst_jobs table? 
-------- 1793
SELECT COUNT(title)
FROM data_analyst_jobs;

-- 2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-------- ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-------- 21, 27
SELECT COUNT("location")
FROM data_analyst_jobs
WHERE "location" = 'TN' OR "location" = 'KY';

-- 4. How many postings in Tennessee have a star rating above 4?
-------- 3
SELECT title, "location"
FROM data_analyst_jobs
WHERE "location" = 'TN' AND star_rating > 4;

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-------- 151
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count >=500 AND review_count <=1000;

-- 6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
-------- NE
SELECT DISTINCT("location") AS "state",
	   AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY DISTINCT("location")
ORDER BY avg_rating;

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?
-------- 881 ## remove count for list
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

-- 8. How many unique job titles are there for California companies?
-------- 230
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE "location" = 'CA';

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-------- 41
SELECT DISTINCT(company), AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-------- 
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC
LIMIT 10;

--SELECT company, review_count, star_rating
--FROM data_analyst_jobs
--WHERE company ILIKE '%Walmart%';

--SELECT COUNT(company)
--FROM data_analyst_jobs
--WHERE company ILIKE '%walmart%';

--SELECT company, review_count, star_rating
--FROM data_analyst_jobs
--WHERE review_count > 5000
--ORDER BY star_rating ASC
--LIMIT 10;

--SELECT *
--FROM data_analyst_jobs
--WHERE star_rating NOTNULL AND review_count > 5000
--ORDER BY star_rating DESC;

-- 11. Find all the job titles that contain the word 'Analyst'. HOw many different job titles are there? 
-------- 
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-------- 3 different, Developer, Consultant and Risk
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%ANALYST%' AND title NOT ILIKE '%Analytics%';

-- BONUS 
--- number of jobs in each of top 3 industries hard to fill 
-------- 403 jobs; Aerospace and Defense, Auto, Banks and Financial Services
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE "domain" NOTNULL AND days_since_posting > 21 AND skill ILIKE '%SQL%';

SELECT DISTINCT("domain"), skill, title, days_since_posting
FROM data_analyst_jobs
WHERE "domain" NOTNULL AND days_since_posting >21 AND skill ILIKE '%SQL%'
ORDER BY days_since_posting DESC;