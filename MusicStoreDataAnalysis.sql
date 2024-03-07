USE Music;
SELECT * FROM artist a2;
SELECT * FROM track pt;

ALTER TABLE track 
MODIFY COLUMN name VARCHAR(250);

ALTER TABLE track 
MODIFY COLUMN composer VARCHAR(250);

/* WHO IS THE SENIOR MOST EMPLOYEE BASED ON THE JOB TITLE */

SELECT * FROM employee e
ORDER BY levels DESC LIMIT 1;

/* WHICH COUNTRIES HAVE THE MOST INVOICE */
SELECT billing_country, COUNT(*) AS COUNT FROM invoice i
GROUP BY billing_country
ORDER BY 2 DESC; 

/* WHAT ARE THE TOP 3 VALUES FROM INVOICE */
SELECT total FROM invoice i 
ORDER BY total DESC 
LIMIT 3;

/* GET ONE CITY THAT HAS THE HIGHEST SUM OF INVOICE TOTALS */
SELECT * FROM invoice i;
SELECT SUM(TOTAL) AS TOTAL, billing_city  FROM invoice i
GROUP BY billing_city 
ORDER BY 1 DESC
LIMIT 1;

/* WHO IS THE BEST CUSTOMER ? GET THE CUSTOMER WHO HAS SPENT MOST MONEY */

SELECT 
    CUSTOMER.customer_id, 
    CUSTOMER.first_name, 
    CUSTOMER.last_name, 
    SUM(INVOICE.TOTAL) AS TOTAL
FROM 
    customer
JOIN 
    invoice ON CUSTOMER.customer_id = INVOICE.customer_id 
GROUP BY 
    CUSTOMER.customer_id, CUSTOMER.first_name, CUSTOMER.last_name
ORDER BY 
    TOTAL DESC 
LIMIT 1;

/* FETCH ANY SINGLE CUSTOMER'S CUSTOMER_ID,INVOICE_ID,NAME & TOTAL */
SELECT 
    CUSTOMER.customer_id, 
    INVOICE.invoice_id,
    CUSTOMER.first_name, 
    CUSTOMER.last_name,
    INVOICE.total 
FROM 
customer
JOIN 
    INVOICE ON CUSTOMER.customer_id = INVOICE.customer_id 
WHERE CUSTOMER.customer_id in ("18");

/* FETCH EACH CUSTOMER'S CUSTOMER_ID,INVOICE_ID,NAME & TOTAL */
SELECT 
    CUSTOMER.customer_id, 
    INVOICE.invoice_id,
    CUSTOMER.first_name, 
    CUSTOMER.last_name,
    INVOICE.total 
FROM 
customer
JOIN 
    INVOICE ON CUSTOMER.customer_id = INVOICE.customer_id 
ORDER BY CUSTOMER.customer_id;

/* FETCH DETAILS ABOUT OF ALL ROCK MUSIC LISTNERS */

SELECT DISTINCT email ,first_name ,last_name 
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id 
JOIN invoice_line il  ON i.invoice_id  = il.invoice_id  
WHERE  track_id in (
	SELECT track_id
	FROM track t
	JOIN genre g ON t.genre_id = g.genre_id
	WHERE g.name LIKE 'Rock' 
)
order by email;





/* Fetch the artist who have written the most rock music in the category */


SELECT a.name AS ARTIST_NAME ,t.name AS SONG_NAME --  ,count(a.name)
from artist a 
JOIN album a2 on a.artist_id = a2.artist_id  
JOIN track t on a2.album_id = t.album_id 
WHERE track_id in (
SELECT track_id
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.genre_id  LIKE 1 
) 

SELECT ARTIST_NAME, COUNT(*) AS SONG_COUNT
FROM (
	SELECT a.name AS ARTIST_NAME ,t.name AS SONG_NAME 
	from artist a 
	JOIN album a2 on a.artist_id = a2.artist_id  
	JOIN track t on a2.album_id = t.album_id 
	WHERE track_id in (
		SELECT track_id
		FROM track t
		JOIN genre g ON t.genre_id = g.genre_id
		WHERE g.genre_id  LIKE 1 
	) 
) AS Temp_Table
GROUP BY ARTIST_NAME
ORDER BY SONG_COUNT desc
limit 10;

/* Fetch all the track name that have a song lenght longer than the avarage song length. */

SET @avg_milliseconds := (SELECT AVG(milliseconds) FROM track);
SELECT @avg_milliseconds;

SELECT t.track_id , t.name, t.milliseconds  from track t
WHERE milliseconds > @avg_milliseconds
ORDER BY milliseconds DESC; 

-- OR THE OTHER WAY --
SELECT t.track_id , t.name, t.milliseconds  from track t
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC; 

/* HOW MUCH AMOUNT SPENT BY EACH CUSTOMER ON ARTIST  */ 

/* GET THE MOST POPULAR MUSIC GENRE IN EACH COUNTRY BY TOTAL SPENDING */

WITH POPULAR_GENRE AS 
(SELECT COUNT(il.quantity) as purchase , g.genre_id,g.name, i.billing_country,
 		ROW_NUMBER() OVER (PARTITION BY i.billing_country ORDER BY COUNT(il.quantity) DESC ) AS R_NO
	from invoice_line il
		join invoice i on i.invoice_id = il.invoice_id 
		join track t on il.track_id  = t.track_id 
		join genre g on t.genre_id = g.genre_id 
		GROUP BY g.genre_id,g.name,i.billing_country
		ORDER BY i.billing_country, purchase desc 
)
SELECT * FROM POPULAR_GENRE WHERE R_NO <= 1;

/* GET THE BEST COSTOMER IN EACH COUNTRY BY TOTAL SPENDING */




 




