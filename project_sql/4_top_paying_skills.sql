/*

Question: What are the top skills based on salary?\
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve

*/

SELECT
    skills,
    TO_CHAR(ROUND(AVG(salary_year_avg), 0), 'FM$999,999,999') AS avg_yearly_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
GROUP BY
    skills
ORDER BY
    ROUND(AVG(salary_year_avg), 0) DESC
LIMIT 25;

/*

Key Trends in Top-Paying Data Analyst Skills:

1.  Big Data and Advanced Tools:
    High salaries are tied to expertise in big data frameworks (e.g., PySpark, Databricks) and specialized platforms
    (e.g., DataRobot, Elasticsearch) critical for large-scale data processing and AI applications.

2.  Hybrid Skills Across Roles
    Employers value cross-functional capabilities, including data engineering (e.g., Airflow, GitLab)
    and cloud/containerization tools (e.g., Kubernetes, Linux), highlighting the demand for end-to-end workflow management.

3.  Core Data Science and Programming Expertise
    Mastery of foundational tools and libraries (e.g., Pandas, Numpy, Jupyter) combined with
    modern programming languages (e.g., Golang, Swift) ensures relevance in analytics and scalable solution development.


[
  {
    "skills": "pyspark",
    "avg_yearly_salary": "$208,172"
  },
  {
    "skills": "bitbucket",
    "avg_yearly_salary": "$189,155"
  },
  {
    "skills": "couchbase",
    "avg_yearly_salary": "$160,515"
  },
  {
    "skills": "watson",
    "avg_yearly_salary": "$160,515"
  },
  {
    "skills": "datarobot",
    "avg_yearly_salary": "$155,486"
  },
  {
    "skills": "gitlab",
    "avg_yearly_salary": "$154,500"
  },
  {
    "skills": "swift",
    "avg_yearly_salary": "$153,750"
  },
  {
    "skills": "jupyter",
    "avg_yearly_salary": "$152,777"
  },
  {
    "skills": "pandas",
    "avg_yearly_salary": "$151,821"
  },
  {
    "skills": "elasticsearch",
    "avg_yearly_salary": "$145,000"
  },
  {
    "skills": "golang",
    "avg_yearly_salary": "$145,000"
  },
  {
    "skills": "numpy",
    "avg_yearly_salary": "$143,513"
  },
  {
    "skills": "databricks",
    "avg_yearly_salary": "$141,907"
  },
  {
    "skills": "linux",
    "avg_yearly_salary": "$136,508"
  },
  {
    "skills": "kubernetes",
    "avg_yearly_salary": "$132,500"
  },
  {
    "skills": "atlassian",
    "avg_yearly_salary": "$131,162"
  },
  {
    "skills": "twilio",
    "avg_yearly_salary": "$127,000"
  },
  {
    "skills": "airflow",
    "avg_yearly_salary": "$126,103"
  },
  {
    "skills": "scikit-learn",
    "avg_yearly_salary": "$125,781"
  },
  {
    "skills": "jenkins",
    "avg_yearly_salary": "$125,436"
  },
  {
    "skills": "notion",
    "avg_yearly_salary": "$125,000"
  },
  {
    "skills": "scala",
    "avg_yearly_salary": "$124,903"
  },
  {
    "skills": "postgresql",
    "avg_yearly_salary": "$123,879"
  },
  {
    "skills": "gcp",
    "avg_yearly_salary": "$122,500"
  },
  {
    "skills": "microstrategy",
    "avg_yearly_salary": "$121,619"
  }
]

*/