


#showing databases
show databases 

#selecting database start
use start

#showing tables int the database
show tables

#showing columns in table
show columns from Uber

#showing conents
select * from uber



#showing starting rows
select * from Uber
limit 5;

#showing distinct values
select distinct(Pickup) from Uber;

select distinct(Status) from Uber;


#cols and count per category

select Pickup ,count(Pickup)
from Uber group by Pickup;

select Status,count(Status)
from Uber group by Status;

select distinct(Status) from Uber 

select Pickup,Status ,count(Status)
from Uber group by Status,Pickup;

#creating Views 

create view area as
select Pickup,count(Pickup)
from Uber group by Pickup

#showing trip success count for airport and City
select Pickup,Status,count(*) from Uber
where Pickup='Airport' and Status='Trip Completed'

select Pickup,count(*) from Uber
where Pickup='City' and Status='Trip completed'

select * from Uber
where Pickup='Airport' and Status='Trip Completed'

select * from area;


#How many total ride requests were made?
select count(*) from Uber;

#What is the count of each trip status (Completed, Cancelled, No Cars Available)?
select Status,count(Status)  from Uber
group by Status

#What are the total requests from each pickup point?
select Pickup,count(Pickup)
from Uber group by Pickup

#At what hour of the day are most requests made?

alter table Uber
add column rides int;
SET SQL_SAFE_UPDATES = 0;

update Uber
set rides=hour(Request)

select rides,count(rides) from Uber 
group by rides
order by rides desc 
limit 1

select * from  Uber;

#How many unique drivers are in the dataset?
select count(distinct(Driver)) from Uber 

#Which pickup point has the highest rate of trip completion?
select Pickup,count(Pickup) from uber
where Status='Trip Completed'
group by Pickup 
order by count(Pickup) desc
limit 1

# Find the top 3 hours with the highest number of trip cancellations.


select Rides as hours,count(Status) as cancelled from Uber 
where Status='Cancelled'
group by Rides
Order by count(Status) desc
limit 3

#Rank drivers by the number of completed trips using window functions
SELECT Driver, COUNT(*) AS completed_trips,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS trip_rank
FROM Uber
WHERE Status = 'Trip Completed'
GROUP BY Driver


#highest no of bookings in hour 

select rides as hour ,count(rides) as bookings
from Uber
group by rides
order by count(rides)desc
limit 1




# What is the most common pickup point for cancelled trips?
select Pickup,count(Pickup) from Uber
where Status='Cancelled'
group by Pickup
order by  count(Pickup) desc
limit 1


#What is the distribution of request statuses by pickup point?

select Pickup,Status,count(Status)
from Uber
group by PIckup,Status

# For each driver, how many trips did they complete?

select Driver,count(Driver)
from Uber
where Status='Trip Completed'
group by Driver

# What is the average number of requests per hour of the day?
select rides as hour,count(*) as bookings
from Uber
group by rides
order by rides

#Driver with highest Cancellations
select Driver,count(*) as cancellations
from Uber where Status='Cancelled'
group by Driver
order by Driver desc

#How many requests were made each day, and how many were completed?
select rides as hours,count(*) as total_requests,sum(Status='Trip Completed') as complted
from Uber
group by rides

#What percentage of requests were completed for each pickup point?
select Pickup ,count(*) as requests,round(sum(Status='Trip Completed')*100.0/count(*),2) as percentage_completion
from Uber group by Pickup

#Which drivers have a high cancellation rate ?
select Driver,count(*) as total_req,round(sum(Status='Cancelled')*100/count(*),2) as rate_of_cancellation
from Uber group by Driver

#What are the peak hours for ride requests?
select Rides as hours,count(*) as rides
from Uber
group by Rides
Order by count(*) desc

#How many requests were made from each pickup point by hour?
select Pickup,Rides as hour ,count(*) as req from Uber
group by Pickup,Rides


























