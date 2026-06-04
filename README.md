## 📖 Project Overview

This project explores a Netflix dataset using SQL to answer real-world business and analytical questions. The goal is to uncover trends related to content distribution, release patterns, ratings, countries, directors, and genres.

Through a collection of SQL queries, this project demonstrates:

- 📊 Data exploration
- 🎥 Movie & TV show analysis
- 🌍 Country-wise content trends
- 🎭 Genre-based insights
- 🎬 Director performance analysis
- 📅 Release and platform growth trends
- 🏆 Advanced SQL techniques using CTEs and Window Functions

---

## 🗂️ Dataset

The project uses a table named:

```sql
netflix_data
```

Key fields include:

| Column | Description |
|----------|-------------|
| title | Name of the content |
| type | Movie or TV Show |
| director | Director name |
| country | Country of origin |
| release_year | Year released |
| date_added | Date added to Netflix |
| rating | Content rating |
| duration | Runtime or number of seasons |
| listed_in | Genre/category |

---

## 🔍 Business Questions Solved

### Content Analysis
- Total number of Movies and TV Shows
- Content added each year
- Most common content rating
- Content released in 2020

### Country Insights
- Top 5 countries producing Netflix content
- Oldest movies released in India
- Years with 50+ Indian movie releases

### Director Insights
- Movies directed by Kirsten Johnson
- Top 5 directors by number of movies

### Genre Analysis
- Indian comedy movies
- Documentary movies released after 2015

### Advanced Analytics
- Longest movie on Netflix
- Most recently released movie for each country
- TV Shows with 5+ seasons
- Year Netflix added the most content

---

## 🧠 SQL Concepts Demonstrated

✅ Aggregations (`COUNT`, `GROUP BY`)

✅ Filtering (`WHERE`, `LIKE`)

✅ Sorting (`ORDER BY`)

✅ Limiting Results (`LIMIT`)

✅ Common Table Expressions (CTEs)

✅ Window Functions (`ROW_NUMBER()`)

✅ String Functions (`SUBSTRING_INDEX()`)

✅ Data Type Casting (`CAST()`)

---

## 🚀 Sample Query

```sql
WITH cte AS (
    SELECT
        title,
        country,
        release_year,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY release_year DESC
        ) AS rn
    FROM netflix_data
    WHERE type = 'Movie'
)
SELECT *
FROM cte
WHERE rn = 1;
```

This query identifies the most recently released movie for every country using a window function.

---

## 📈 Key Insights Generated

🎬 Understand Netflix's content mix between Movies and TV Shows

🌎 Identify countries dominating Netflix production

📅 Track content growth over the years

🏆 Discover prolific directors

🎭 Analyze popular genres and categories

📺 Find long-running TV shows

---

## 🛠️ Tech Stack

- SQL
- MySQL
- Netflix Dataset
- Data Analytics

---

## 🎯 Learning Outcomes

This project is ideal for practicing:

- SQL Fundamentals
- Analytical Query Writing
- Business-Oriented Data Analysis
- Window Functions
- CTEs
- Data Exploration Techniques

---

## ⭐ Project Highlights

> "Data tells stories. SQL helps us uncover them."

This project transforms raw Netflix data into meaningful insights through structured SQL analysis, making it an excellent portfolio project for aspiring Data Analysts and SQL Developers.

---

### 👨‍💻 Author

**Netflix SQL Analytics Project**  
Built with SQL, curiosity, and a passion for data analysis.

⭐ If you found this project useful, consider starring the repository!
