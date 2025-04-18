/*What skills are required for the top paying data analyst jobs?
 -Use the first query (top 10 highest paying Data Analyst jobs)
 -Add the specific skills required for these jobs
 -Why? Helps job seekers understand which skills are more in demand.
 */
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
    /* -SQL remains the most in-demand skill, often a baseline requirement for data roles.
     - Python follows closely, with libraries like pandas and numpy also appearing, indicating demand for data manipulation and analysis.
     - Tableau and Power BI both show up, highlighting the importance of data visualization tools.
     - Cloud technologies like Azure and AWS are becoming more relevant.
     - Tools supporting collaboration and DevOps (e.g., GitLab, Bitbucket, Jira, Jenkins) also appear, showing the cross-functional nature of some analyst roles.
     */