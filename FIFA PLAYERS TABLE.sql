

-- This project uses the fifa_player dataset to explore SQL functions through 25 practice queries. 
-- It applies Window Functions (ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, MIN with PARTITION BY), Aggregate Functions 
-- (AVG, MAX, COUNT, SUM, GROUP BY), String Functions (UPPER, LENGTH, CONCAT), Date/Time Functions (NOW), and 
-- NULL Handling (IFNULL, COALESCE). Clauses like OVER, PARTITION BY, ORDER BY are integrated to structure window operations. 
-- The questions cover ranking, aggregation, string manipulation, handling missing values, and advanced analytical queries, 
-- demonstrating how these SQL functions can be used for player performance and market value analysis.


use newclass;

select * from fifa_player;



-- 1.ROW_NUMBER – List top 10 players by overall_rating with row numbers.

SELECT player_name, overall_rating,
ROW_NUMBER() OVER (ORDER BY overall_rating DESC) AS row_num
FROM fifa_player
LIMIT 10;

-- 2.RANK – Rank players by market_value_million_eur.stocks

SELECT player_name, market_value_million_eur,
RANK() OVER (ORDER BY market_value_million_eur DESC) AS rank_val
FROM fifa_player;

-- 3.DENSE_RANK – Rank players by goals scored.

SELECT player_name, goals,
DENSE_RANK() OVER (ORDER BY goals DESC) AS dense_rank_val
FROM fifa_player;

-- 4.LAG – Show previous player’s overall_rating compared to current.

SELECT player_name, overall_rating,
LAG(overall_rating,1) OVER (ORDER BY player_id) AS prev_rating
FROM fifa_player;

-- 5.LEAD – Show next player’s potential_rating.

SELECT player_name, potential_rating,
LEAD(potential_rating,1) OVER (ORDER BY player_id) AS next_potential
FROM fifa_player;

-- 6.MIN with PARTITION BY – Find minimum age per club.

SELECT club, MIN(age) OVER (PARTITION BY club) AS youngest_player
FROM fifa_player;

-- 7.AVG – Average overall_rating of all players.

SELECT AVG(overall_rating) AS avg_rating FROM fifa_player;


-- 8.MAX – Highest market_value_million_eur.

SELECT MAX(market_value_million_eur) AS max_value FROM fifa_player;


-- 9.COUNT – Count total players from Liverpool.

SELECT COUNT(*) AS liverpool_players
FROM fifa_player WHERE club='Liverpool';

-- 10.SUM – Total goals scored by Brazilian players.

SELECT SUM(goals) AS total_goals
FROM fifa_player WHERE nationality='Brazil';

-- 11.GROUP BY with AVG – Average overall_rating per club.

SELECT club, AVG(overall_rating) AS avg_rating
FROM fifa_player GROUP BY club;


-- 12.UPPER – Convert all player names to uppercase.

SELECT UPPER(player_name) AS upper_name FROM fifa_player;

-- 13.LENGTH – Find length of each player’s name.

SELECT player_name, LENGTH(player_name) AS name_length
FROM fifa_player;

-- 14.CONCAT – Combine player_name and club.

SELECT CONCAT(player_name,' - ',club) AS player_info
FROM fifa_player;

-- 15.NOW – Show current system date/time with player info.

 SELECT player_name, club, FROM fifa_player LIMIT 5;
select now()as current_time;

-- 16.IFNULL – Replace NULL contract_years_left with 0.

SELECT player_name, IFNULL(contract_years_left,0) AS contract_years
FROM fifa_player;

-- 17.COALESCE – Replace NULL assists with default value 0.

SELECT player_name, COALESCE(assists,0) AS assists_val
FROM fifa_player;

-- 18.PARTITION BY – Rank players within each club by goals.

SELECT player_name, club, goals,
RANK() OVER (PARTITION BY club ORDER BY goals DESC) AS club_rank
FROM fifa_player;

-- 19.ORDER BY in Window – Show cumulative goals ordered by player_id.

SELECT player_name, goals,
SUM(goals) OVER (ORDER BY player_id) AS cumulative_goals
FROM fifa_player;

-- 20.ROW_NUMBER with PARTITION BY – Assign row numbers per nationality.

SELECT player_name, nationality,
ROW_NUMBER() OVER (PARTITION BY nationality ORDER BY overall_rating DESC) AS nat_rank
FROM fifa_player;

-- 21.Find top 5 youngest players with highest potential_rating.

SELECT player_name, age, potential_rating
FROM fifa_player
ORDER BY age ASC, potential_rating DESC
LIMIT 5;

-- 22.Show players with NULL or missing minutes_played replaced by 0.

SELECT player_name, COALESCE(minutes_played,0) AS minutes_played
FROM fifa_player;

-- 23.Find players with above-average overall_rating.

SELECT player_name, overall_rating
FROM fifa_player
WHERE overall_rating > (SELECT AVG(overall_rating) FROM fifa_player);

-- 24.Show top 3 clubs with most players.

SELECT club, COUNT(*) AS player_count
FROM fifa_player GROUP BY club
ORDER BY player_count DESC LIMIT 3;

-- 25.Rank players by market_value_million_eur within each nationality.

SELECT player_name, nationality, market_value_million_eur,
DENSE_RANK() OVER (PARTITION BY nationality ORDER BY market_value_million_eur DESC) AS nat_value_rank
FROM fifa_player;



