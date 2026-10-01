CREATE DATABASE PIZZA_PROJECT;

USE PIZZA_PROJECT;

create table order_details(
	order_details_id int not null,
	order_id int not null,
	pizza_id text not null,
	quantity int not null,
	primary key(order_details_id)
);

select * from orders;
select * from order_details;
select * from [dbo].[pizzas];
select * from pizza_types;

--sp_help order_details

--Basic:
	--Retrieve the total number of orders placed.
		select count(order_id) as total_orders from orders;

	--Calculate the total revenue generated from pizza sales.
		select round(sum(quantity*price), 2) as total_rev 
		from order_details od join pizzas p 
		on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)

	--Identify the highest-priced pizza.
		select top 1 pizza_id, price from pizzas order by price desc
		-- or we can also use max aggregator function
		select max(price) from pizzas 

	--Identify the most common pizza size ordered.
		select top 1 p.size, sum(od.quantity) as ordered_pizza_total_quantity 
		from pizzas p inner join
		order_details od on cast(p.pizza_id as nvarchar) = cast(od.pizza_id as nvarchar)
		group by p.size 
		order by ordered_pizza_total_quantity desc

	--List the top 5 most ordered pizza types along with their quantities.
		select top 5 cast(pt.pizza_type_id as nvarchar) as pizza_types, sum(cast(od.quantity as int)) as total_quantity 
		from order_details od
		inner join pizzas p on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)
		inner join pizza_types pt on cast(p.pizza_type_id as nvarchar) = cast(pt.pizza_type_id as nvarchar)
		group by pt.pizza_type_id
		order by total_quantity desc

--Intermediate:
	--Join the necessary tables to find the total quantity of each pizza category ordered.
		select pt.category, sum(od.quantity) as total_quantity from order_details od 
		inner join pizzas p on cast(od.pizza_id as nvarchar) =  cast(p.pizza_id as nvarchar) 
		inner join pizza_types pt on cast(p.pizza_type_id as nvarchar)= cast(pt.pizza_type_id as nvarchar) 
		group by category

	--Determine the distribution of orders by hour of the day.
		select datepart(hour, time) as hour_of_day, count(order_id) as total_orders from orders 
		group by datepart(hour, time)
		order by hour_of_day asc
		
	--Join relevant tables to find the category-wise distribution of pizzas.
		select pt.category, round(sum(od.quantity*price), 2) as sales from order_details od 
		inner join pizzas p on cast(od.pizza_id as nvarchar) =  cast(p.pizza_id as nvarchar) 
		inner join pizza_types pt on cast(p.pizza_type_id as nvarchar)= cast(pt.pizza_type_id as nvarchar) 
		group by category

	--Group the orders by date and calculate the average number of pizzas ordered per day.
		with grouped_order_date as (
		select o.date, sum(od.quantity) as total_orders from orders o
		inner join order_details od
		on cast(o.order_id as int) = cast(od.order_id as int)
		group by o.date 
		)

		select avg(total_orders) as avg_order_per_day from grouped_order_date

	--Determine the top 3 most ordered pizza types based on revenue.
		select top 3 p.pizza_type_id, sum(od.quantity * p.price) as total_revenue from order_details od 
		inner join pizzas p on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)
		group by p.pizza_type_id
		order by total_revenue desc

--Advanced:
	--Calculate the percentage contribution of each pizza type to total revenue.
		with total_revenue as (
		select sum(od.quantity * p.price) as total_rev from order_details od 
		inner join pizzas p on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)
		)

		select p.pizza_type_id, round((sum(od.quantity * p.price)/(select total_rev from total_revenue)*100), 2) as total_revenue_PERCENTAGE	 from order_details od 
		inner join pizzas p on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)
		group by p.pizza_type_id
		

	--Analyze the cumulative revenue generated over time.
		with per_day as (
		select o.date, round(sum(od.quantity * p.price), 2) as per_day_rev from orders o 
		inner join order_details od on cast(o.order_id as int) = cast(od.order_id as int) 
		inner join pizzas p on cast(p.pizza_id as nvarchar) = cast(od.pizza_id as nvarchar)
		group by o.date)

		select *, sum(per_day_rev) over(order by date) as commulative_revenue from per_day 


	--Determine the top 3 most ordered pizza types based on revenue for each pizza category.
		with most_order as (
		select pt.name, pt.category, sum(od.quantity * p.price) as total_rev,
		row_number() over(partition by pt.category order by sum(od.quantity * p.price) desc) as rank_no
		from pizza_types pt 
		inner join pizzas p on cast(pt.pizza_type_id as nvarchar) = cast(p.pizza_type_id as nvarchar)
		inner join order_details od on cast(od.pizza_id as nvarchar) = cast(p.pizza_id as nvarchar)
		group by pt.name, pt.category
		)

		select * from most_order where rank_no <=3
		