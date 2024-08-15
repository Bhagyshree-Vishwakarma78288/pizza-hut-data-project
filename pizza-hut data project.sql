create database pizzahut; 
use pizzahut; 
-- create table 
create table customer(
customer_id int auto_increment primary key ,
first_name varchar(50) not null,
last_name varchar(65) not null,
email varchar(25) not null,
phone_number varchar(50) not null,
address varchar(70) not null) ;

create table orders(
order_id int auto_increment primary key,
customer_id int,
order_date date not null,
total_amount decimal(10,5) not null); 

create table ordersitem(
orderiteam_id int auto_increment primary key,
order_id int not null, 
pizza_id int not null,
quantity int not null,
price decimal(10,2));

create table pizzas(
pizza_id int auto_increment primary key,
pizza_name varchar(45) not null,
price decimal(5,5) not null); 

create table Employees(
Employees_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(45) not null,
possition varchar(35) not null); 

alter table ordersitem modify price varchar(300);
alter table pizzas modify price varchar(300); 
alter table orders add foreign key (customer_id) references customer (customer_id);
alter table ordersitem add foreign key (order_id) references orders (order_id) ; 
alter table ordersitem add foreign key (pizza_id) references pizzas (pizza_id) ; 

insert into customer values(
1,"john","doe","john.doe@example.com",123-456-7890,"123 Elm St, Anytown");
insert into customer values(
2,"jane","smith","jane.smith@example.com",987-654-3210,"456 Oak St, Othertown"); 
insert into customer values(
3,"shiv","shankar","shiv@123example.com",578-154-1548,"263 gy st,onlytown"); 

insert into orders values(
101,1,"2024-08-01",25); 
insert into orders values(
102,2,"2024-08-02",30); 
insert into orders values(
103,3,"2024-08-03",35); 

insert into ordersitem values(
1001,101,01,5,100);
insert into ordersitem values(
1002,102,02,10,150); 
insert into ordersitem values(
1003,103,03,15,200); 

insert into pizzas values(
01,"corn_pizza",100);
insert into pizzas values(
02,"cheez_pizza",250);
insert into pizzas values(
03,"sandwich_pizza",300);

insert into Employees values(
001,"shree","karma","data_scientist");
insert into Employees values( 
002,"babita","sharma","HR"); 
insert into Employees values(
003,"shivi","singh","manager");

-- Q1 Select All Data from a Table
select * from customer; 

-- Q2 How can you find all orders from the Orders 
-- table where the TotalAmount is greater than $25.00?
-- filter the data
select * from orders 
where total_amount>25; 

-- Q3 How can you calculate the total sales amount from the Orders table?
select sum(total_amount) as total_sales from orders;

-- Q4 How can you determine the average order amount from the Orders table?
select avg(total_amount) as avg_amount from orders;

-- Q5 How can you find the total spending per customer, showing their first name, 
-- last name, and total spent?
select * from customer;
select * from orders; 
select c.first_name,c.last_name,sum(o.total_amount) from customer c 
join orders o 
on c.customer_id = o.customer_id 
group by c.customer_id,c.first_name,c.last_name; 

-- Q6 How can you find the total quantity of each pizza ordered, 
-- including the pizza name and the quantity?
select * from pizzas; 
select * from ordersitem; 
select p.pizza_name,o.quantity from pizzas p 
join ordersitem o 
on p.pizza_id = o.pizza_id 
group by p.pizza_id,p.pizza_name,o.quantity; 

-- Q7 Get the total amount of each order, including the 
-- order_id and customer_id.
select * from orders;
select * from customer; 
select c.customer_id, o.order_id,o.total_amount from orders o 
join customer c 
on c.customer_id = o.customer_id;

-- Q8 Find the total quantity and price of items in order with order_id 101.
select * from orders; 
select * from ordersitem; 
select order_id,sum(quantity) as totat_quantity,sum(price) as total_price from ordersitem 
where order_id = 101; 

-- Q8 Get the name and price of the pizza with pizza_id 2.
select * from pizzas; 
select pizza_id,pizza_name, price from pizzas
where pizza_id = 2; 

-- Q9 Update the email address of customer with customer_id 3.
select * from customer; 
update customer
set email = "maa.shiv@example.com"
where customer_id = 3; 

-- Q10 Retrieve all employees with the position 'HR'.
select * from employees
where possition = "HR";

-- Q11 Get the highest priced pizza.
select * from pizzas; 
select max(price) as high_price from pizzas; 

-- Q12 Retrieve all details from ordersitem where the 
-- price is greater than 150.
select * from ordersitem 
where price>150; 

 -- Q13 Find all orders placed in August 2024.
 select * from orders
 where order_date = "2024-08-01"; 
 
 -- Q14 Join ordersitem with pizzas to get the pizza name along 
 -- with the order details.
 select * from ordersitem; 
 select * from pizzas;
 select o.pizza_id,p.pizza_name,o.order_id,o.quantity,o.orderiteam_id from ordersitem o 
 join pizzas p 
 on p.pizza_id = o.pizza_id; 
 
 -- Q15 Retrieve all employees' names and their positions, 
 -- sorted by position.
 select * from employees; 
 select concat(first_name," ",last_name) as full_name , possition from employees 
 order by possition desc; 
 
 -- Q16 List all orders along with the total price of 
 -- items in each order.
 select * from orders; 
 select * from ordersitem; 
 select o.order_id,sum(price) as total_price from ordersitem r 
 join orders o 
 on o.order_id = r.order_id
 group by o.order_id; 
 
 -- Q17 Show all pizzas and the count of orders containing each pizza.
 select * from pizzas; 
 select * from ordersitem; 
 select p.pizza_name,count(oi.order_id) as orders from pizzas p 
 join ordersitem oi  
 on p.pizza_id = oi.pizza_id
 group by p.pizza_id; 
 
 -- Q18 List all customers who have placed more than one order.
 select * from customer; 
 select * from orders; 
 select c.customer_id ,concat(first_name," ",last_name) as full_name from customer c 
 join orders o
 on c.customer_id = o.customer_id 
 group by c.customer_id
 having count(o.order_id) >1; 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 


















 



 



 



  





















































































































 


