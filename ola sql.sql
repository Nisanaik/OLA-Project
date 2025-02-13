Create Database ola;
use ola ;

---1. Retrieve all successful bookings:--
create view Successful_Bookings As
select * from bookings
WHERE Booking_status = 'Success';

select * from Successful_Bookings;

---2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle AS 
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

Select * from ride_distance_for_each_vehicle  


---3. Get the total number of cancelled rides by customers:--
CREATE VIEW Canceled_Rides_by_Customer AS  
SELECT COUNT(*) AS total_canceled_rides  
FROM bookings  
WHERE Booking_Status = 'Canceled by Customer';

Select * from Canceled_Rides_by_Customer;


---4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
WITH RankedCustomers AS (
    SELECT Customer_ID, 
           COUNT(Booking_ID) AS total_rides
    FROM bookings
    GROUP BY Customer_ID
)
SELECT TOP 5 Customer_ID, total_rides
FROM RankedCustomers
ORDER BY total_rides DESC;

select * from Top_5_Customers;

---5. Get the number of rides cancelled by drivers due to personal and car-related issues:

 SELECT COUNT(*) FROM bookings WHERE Canceled_Rides_by_Driver = 'Personal & Car
related issue';

Create View Canceled_Rides_by_Driver As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

CREATE VIEW Canceled_Rides_by_Driver AS  
SELECT COUNT(*) AS total_canceled_rides  
FROM bookings  
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * From Canceled_Rides_by_Driver;


---6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

Select * From  Max_Min_Driver_Rating;

SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';
---7. Retrieve all rides where payment was made using UPI:

SELECT * FROM bookings WHERE Payment_Method = 'UPI';

Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

Select * from UPI_Payment;

---8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

Select * from AVG_Cust_Rating;

---9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

select * from total_successful_ride_value;

---10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason  
FROM bookings  
WHERE Incomplete_Rides = 1; -- Use 1 instead of 'Yes' for BIT values


DROP VIEW IF EXISTS Incomplete_Rides_Reason;

CREATE VIEW Incomplete_Rides_Reason AS  
SELECT Booking_ID, Incomplete_Rides_Reason  
FROM bookings  
WHERE Incomplete_Rides = 1; -- Correct for BIT data type



Select * from Incomplete_Rides_Reason; 
