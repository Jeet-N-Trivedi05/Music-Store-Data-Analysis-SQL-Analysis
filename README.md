Music Shop Data Analytics Project

Welcome to the Music Shop Data Analytics project! This project involves querying a relational database to derive meaningful insights about the music store's operations. The database schema includes tables such as album, artist, customer, employee, genre, invoice, invoice_line, media_type, playlist, playlist_track, and track.

Business Questions Answered

1. Senior Most Employee by Job Title
Objective: Identify the senior most employee based on job title.
2. Countries with the Most Invoices
Objective: Determine the countries with the highest number of invoices.
3. Top 3 Values of Total Invoice
Objective: Identify the top three values of total invoices.
4. City with the Best Customers
Objective: Determine the city with the highest sum of invoice totals for a promotional Music Festival.
5. Best Customer
Objective: Identify the customer who has spent the most money.
6. Rock Music Listeners
Objective: Retrieve email, first name, last name, and genre of all Rock Music listeners, ordered alphabetically.
7. Top 10 Rock Bands
Objective: Identify the top 10 rock bands based on the total track count.
8. Tracks Longer Than Average
Objective: Retrieve track names and milliseconds for songs longer than the average length, ordered by song length.
9. Amount Spent by Each Customer on Artists
Objective: Determine the amount spent by each customer on artists.
10. Most Popular Music Genre by Country
Objective: Identify the most popular music genre for each country.
11. Top Spending Customer by Country
Objective: Identify the customer that has spent the most on music for each country.
Concepts Utilized

Concepts Utilised:
 

Group By: Aggregated data based on common attributes.

Having Clause: Filtered aggregated results to focus on specific conditions.

Window Functions: Utilised window functions such as ROW_NUMBER(), PARTITION BY, and OVER to perform calculations over specific result sets.

Join Operations: Combined data from multiple tables using inner and outer joins for comprehensive analysis.

Subqueries: Employed subqueries to retrieve intermediate results for further analysis within main queries.

Aliases: Used aliases to provide alternative names for columns or tables, improving query readability.

Distinct: Employed DISTINCT to eliminate duplicate records and focus on unique values.

Filtering with WHERE: Utilised WHERE clause to filter records based on specified conditions.

WITH Clause: Employed the WITH clause to create temporary result sets for simplifying complex queries.

Rank and DENSE_RANK: Utilised ranking functions to assign ranks to rows based on specified criteria.

Multi-Level Joins: Conducted multi-level joins to connect disparate tables and extract comprehensive insights



Database Schema: schema_diagram.png

Feel free to explore the project to gain valuable insights into the Music Shop's operations! If you have any questions or suggestions, feel free to open an issue or contribute to the project. Happy querying! 🎵✨
