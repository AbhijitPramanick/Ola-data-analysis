use Ola;

--select top 1 * from Bookings;

--#1. Retrieve all successful bookings:

CREATE VIEW Successful_Bookings AS 
SELECT * FROM Bookings
WHERE Booking_Status = 'Success';

SELECT COUNT(*) FROM Successful_Bookings;

--#2. Find the average ride distance for each vehicle type:

CREATE VIEW Average_ride_distance_for_each_vehicle_type AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS AvgRideDist
FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM Average_ride_distance_for_each_vehicle_type;

--#3. Get the total number of canceled rides by customers:

CREATE VIEW  number_of_canceled_rides_by_customers AS
SELECT COUNT(*) AS RidesCancelByCustomer 
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM number_of_canceled_rides_by_customers;

--#4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW top_5_customers_booked_highest_number_of_rides AS
SELECT TOP 5 Customer_ID, COUNT(Booking_ID) AS Total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY Total_rides DESC;

SELECT * FROM top_5_customers_booked_highest_number_of_rides;

--#5. Get the number of rides canceled by drivers due to personal and car-related issues:

CREATE VIEW rides_canceled_by_drivers_personal_carRelated_issues AS
SELECT COUNT(*) AS Rides_Canceled_By_Driver FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM rides_canceled_by_drivers_personal_carRelated_issues;


--#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW maximum_and_minimum_driver_ratings_for_Prime_Sedan_bookings AS
SELECT
	MAX(Driver_Ratings) AS MaxRating,
	MIN(Driver_Ratings) AS MinRating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM maximum_and_minimum_driver_ratings_for_Prime_Sedan_bookings;

--#7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_Payment_Booking AS
SELECT * FROM Bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment_Booking;


--#8. Find the average customer rating per vehicle type:

CREATE VIEW average_customer_rating_per_vehicle_type AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS CustomerRating
FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM average_customer_rating_per_vehicle_type;

--#9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Booking_value_of_rides_Completed_Successfully AS
SELECT SUM(Booking_Value) AS TotalValueOfBookingRides
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Total_Booking_value_of_rides_Completed_Successfully

--#10 List all incomplete rides along with reason

CREATE VIEW Incomplete_rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_rides_Reason;