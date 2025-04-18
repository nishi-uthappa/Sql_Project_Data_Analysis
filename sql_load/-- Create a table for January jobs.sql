-- Create a table for January jobs
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1;
-- Create a table for February jobs
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2;
-- Create a table for March jobs
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3;