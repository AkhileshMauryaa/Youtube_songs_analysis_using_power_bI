-- 1. What is the total number of reservations in the dataset? 
select count(*) as total_reservation
 from reservation;

-- 2. Which meal plan is the most popular among guests?  
select type_of_meal_plan, count(*) as count
from reservation
group by type_of_meal_plan
order by count desc
limit 1;

-- 3. What is the average price per room for reservations involving children?  
select avg(avg_price_per_room) as avg_price
from reservation
where no_of_children > 0;

-- 4. How many reservations were made for the year 20XX (replace 20 with the desired year)? 
select count(*) as total_reservations
from reservation
where year(arrival_date) = 2020;

-- 5. What is the most commonly booked room type?  
select room_type_reserved, count(*) as no_count
from reservation
group by room_type_reserved
order by no_count desc
limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as weekend_reservations
from reservation
where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as highest_lead_time, 
min(lead_time) as lowest_lead_time
from reservation;

-- 8. What is the most common market segment type for reservations? 
select market_segment_type, count(*) as most_common
from reservation
group by market_segment_type
order by most_common desc
limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?  
select count(*) as total_confirmed_reservations
from reservation
where booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations? 
select sum(no_of_adults) as total_adults, 
sum(no_of_children) as total_children
from reservation;

-- 11. What is the average number of weekend nights for reservations involving children? 
select avg(no_of_weekend_nights) as avg_weekend_nights
from reservation
where no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 
select month(str_to_date(arrival_date, '%d-%m-%Y')) as month,
 count(*) as total_reservations
from reservation
group by month
order by month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
select room_type_reserved,
avg(no_of_weekend_nights + no_of_week_nights) as avg_nights
from reservation
group by room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?  
select room_type_reserved, COUNT(*) as num_reservations, 
avg(avg_price_per_room) AS avg_price
from reservation
where no_of_children > 0
group by room_type_reserved
order by num_reservations DESC
limit 1;

-- 15. Find the market segment type that generates the highest average price per room.
select market_segment_type, 
avg(avg_price_per_room) as avg_price
from reservation
group by market_segment_type
order by avg_price desc
limit 1;



