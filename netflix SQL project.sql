use netflix;

# 1. What is the total number of 'Movies' and 'TV Shows' on Netflix?
select type, count(*) as count  from netflix_data
group by type;

#2. Which country has produced the most content (Movies + TV Shows) on Netflix? List the top 5 countries.
 select country, count(*) as total_content  from netflix_data
 group by country
 order by total_content desc
 limit 5;
 
 #3. Retrieve a list of all movies and TV shows released in the year 2020.
 
select * from netflix_data
where release_year = '2020'
# count
select count(*) from netflix_data
where release_year = '2020';

#4. What are the titles of all movies directed by 'Kirsten Johnson'?

select title from netflix_data
where director = "Kirsten Johnson";

#  5.  Which content rating is the most common on Netflix? (Count of titles byrating).

select rating, count(rating) as total_titles  from netflix_data
group by rating
order by total_titles desc;

#6. Find the list of all 'TV Shows' that have 5 or more seasons

select title, duration from netflix_data
where type = 'TV show'
and cast(substring_index(duration, ' ', 1) as unsigned) >=5;

#7List all the movies produced in 'India' that belong to the 'Comedies' category.

select * from netflix_data
where country = "india"
and listed_in like '%comed%';

#8. How many new shows/movies were released each year? Sort the results in descending order of the release year.

select release_year, count(*) as total_movies from netflix_data
group by release_year
order by release_year desc;

#9. Who are the top 5 directors with the highest number of directed movies (excluding 'Not Given')?
select director , count(director) as total_movies from netflix_data
where type = "Movie" and director <>""
group by director
order by total_movies desc
limit 5;

#10. In which year did Netflix add the highest amount of content to its platform?
select right(date_added,4) as year, count(*) as total_count from netflix_data
group by year
order by total_count desc
limit 1;

#11. Which are the 5 oldest movies released in India on Netflix?
select title, country , release_year from netflix_data
where country = "India"
order by release_year
limit 5;

#12. Find the titles of all movies listed as 'Documentaries' that were released after the year 2015.

select title, release_year, listed_in from netflix_data
where listed_in like '%Documentaries%'
and release_year > 2015
order by release_year;


#13. Which movie has the longest duration in minutes on Netflix?

select title,cast(substring_index(duration," ", 1)as unsigned)as duration from netflix_data
where type = "Movie"
order by duration desc
limit 1

#14. What is the most recently released movie for each country?

with cte as(select title, country, release_year, type,
row_number() over(partition by country order by release_year desc) as rn from netflix_data where type = "Movie")
select * from cte
 
where rn = 1 and country <>""
order by country


#15. Identify the release years in which more than 50 movies from India were released.

with cte as (select release_year ,count(*) as total_films from netflix_data
where country = "India" and type = "Movie"
group by release_year)
select * from cte where total_films>=50
order by release_year desc
