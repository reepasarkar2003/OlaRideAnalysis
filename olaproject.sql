Create Database ola;
use ola;

SHOW TABLES

### 1. Retriving all successfull Bookings 

CREATE VIEW Successfull_Bookings AS  
SELECT * FROM  bookings
WHERE Booking_Status = 'Success' ;

SELECT * FROM  Successfull_Bookings

#### 2. Find THE AVERAGE RIDE DISTANCE FOR EACH VEHICLE TYPE

CREATE VIEW RIDE_DISTANCE_FOR_EACH_VEHICLE AS
SELECT Vehicle_Type , AVG(Ride_Distance)
AS avg_distance FROM bookings
GROUP BY Vehicle_Type

SELECT * FROM RIDE_DISTANCE_FOR_EACH_VEHICLE

### 3. GET THE TOTAL NUMBER OF CANCELED RIDES BY CUSTOMERS:
CREATE VIEW Canceled_Ride_By_Customers AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer'

SELECT * FROM Canceled_Ride_By_Customers 

#### 4. List THE top 5 customers who booked the highest number of rides:
SELECT * FROM  bookings

CREATE VIEW top_5_customers_who_booked_the_highest_number_of_rides AS
SELECT Customer_ID , COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customers_who_booked_the_highest_number_of_rides ;

#### 5 . Get the number of rides canceled by drivers due to personal and car-related issues :
SELECT * FROM  bookings

CREATE VIEW rides_canceled_by_drivers_due_to_p_c_issues  AS 
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue'

SELECT * FROM rides_canceled_by_drivers_due_to_p_c_issues 

#### 6 FIND THE MAXIMUM AND MINIMUM DRIVER RATINGS FOR PRICE SEDAN BOOKINGS :

SELECT * FROM  bookings

CREATE VIEW MAX_AND_MIN_DRIVER_RATINGS_FOR_PRICE_SEDAN AS
SELECT 
   MAX(Driver_Ratings) AS max_rating ,
   MIN(Driver_Ratings)AS min_rating
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan' 

SELECT* FROM MAX_AND_MIN_DRIVER_RATINGS_FOR_PRICE_SEDAN


#### 7. RETRIVE ALL RIDES WHERE PAYMENT WAS MADE USING UPI:
CREATE VIEW UPI_PAYMENT AS
SELECT * FROM  bookings
WHERE Payment_Method = 'UPI'

SELECT * FROM UPI_PAYMENT

#### 8. FIND THE AVERAGE CUSTOMER RATING PER VEHICLE TYPE:

CREATE VIEW AVG_CUSTOMER_RATING AS
SELECT Vehicle_Type,AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type

SELECT * FROM AVG_CUSTOMER_RATING 

##### 9. CALCULATE THE TOTAL BOOKING VALUE OF RIDES COMPLETED SUCCESSFULLY :

SELECT * FROM  bookings

CREATE VIEW total_successfull_ride_value AS
SELECT SUM(Booking_Value) AS total_successfull_ride_value
FROM bookings
WHERE Booking_Status = 'Success'

SELECT * FROM total_successfull_ride_value

##### 10. LIST ALL INCOMPLETE RIDES ALONG WITH THE REASON : 
CREATE VIEW  Incomplete_Rides_Reason  AS
SELECT Booking_ID , Incomplete_Rides_Reason 
FROM bookings
WHERE Incomplete_Rides = 'Yes'

SELECT * FROM Incomplete_Rides_Reason

####### 11. The 62% ride success rate
SELECT * FROM  bookings
 
SELECT 
    (COUNT(CASE WHEN Booking_status = 'Success' THEN 1 END )* 100.0 ) / COUNT(*) AS success_rate
FROM bookings;

############ 

SELECT 
    ((b.avg_wait_time_before - a.avg_wait_time_after) * 100.0) / b.avg_wait_time_before AS wait_time_reduction_percentage
FROM 
    (SELECT AVG(C_TAT - V_TAT) AS avg_wait_time_before 
     FROM bookings 
     WHERE ï»¿Date BETWEEN '2024-07-01' AND '2024-07-15') AS b,
    (SELECT AVG(C_TAT - V_TAT) AS avg_wait_time_after 
     FROM bookings 
     WHERE ï»¿Date BETWEEN '2024-07-16' AND '2024-07-31') AS a;

#############

SELECT 
    Customer_ID, 
    COUNT(Booking_ID) AS total_bookings, 
    MIN(ï»¿Date) AS first_booking, 
    MAX(ï»¿Date) AS last_booking, 
    DATEDIFF(MAX(ï»¿Date), MIN(ï»¿Date)) AS repeat_usage_days 
FROM bookings
GROUP BY Customer_ID
HAVING COUNT(Booking_ID) > 1
ORDER BY total_bookings DESC;


SELECT 
    (COUNT(DISTINCT CASE WHEN repeat_bookings > 1 THEN Customer_ID END) * 100.0) 
    / COUNT(DISTINCT Customer_ID) AS repeat_usage_percentage
FROM (
    SELECT Customer_ID, COUNT(Booking_ID) AS repeat_bookings 
    FROM bookings 
    GROUP BY Customer_ID
) AS customer_repeat_data;


select 
COALESCE(Customer_ID , 'Uknown') as Customer_ID,
COALESCE(Driver_Ratings, 0) as Driver_Rating, 
Booking_Status
from bookings 
where Booking_Status in('Success', 'Cancelled')


##### cancelation rate

SELECT 
    (COUNT(CASE WHEN Booking_Status LIKE 'Canceled%' THEN 1 END) * 100.0) / COUNT(*) AS cancellation_rate
FROM bookings;







------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

### 1. Retriving all successfull Bookings 

SELECT * FROM  Successfull_Bookings

#### 2. Find THE AVERAGE RIDE DISTANCE FOR EACH VEHICLE TYPE

SELECT * FROM RIDE_DISTANCE_FOR_EACH_VEHICLE

### 3. GET THE TOTAL NUMBER OF CANCELED RIDES BY CUSTOMERS:

SELECT * FROM Canceled_Ride_By_Customers 

#### 4. List THE top 5 customers who booked the highest number of rides:

SELECT * FROM top_5_customers_who_booked_the_highest_number_of_rides ;

#### 5 . Get the number of rides canceled by drivers due to personal and car-related issues :

SELECT * FROM rides_canceled_by_drivers_due_to_p_c_issues 

#### 6 FIND THE MAXIMUM AND MINIMUM DRIVER RATINGS FOR PRICE SEDAN BOOKINGS :

SELECT* FROM MAX_AND_MIN_DRIVER_RATINGS_FOR_PRICE_SEDAN

#### 7. RETRIVE ALL RIDES WHERE PAYMENT WAS MADE USING UPI:

SELECT * FROM UPI_PAYMENT

#### 8. FIND THE AVERAGE CUSTOMER RATING PER VEHICLE TYPE:

SELECT * FROM AVG_CUSTOMER_RATING 

##### 9. CALCULATE THE TOTAL BOOKING VALUE OF RIDES COMPLETED SUCCESSFULLY :

SELECT * FROM total_successfull_ride_value

##### 10. LIST ALL INCOMPLETE RIDES ALONG WITH THE REASON : 

SELECT * FROM Incomplete_Rides_Reason


























