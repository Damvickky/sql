CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
)
 
INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3')

  Select *
 From sales
 where product_id=3

  CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
)

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12')

select *
From menu

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
)

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09'),
  ('C', '2021-01-11')

  INSERT INTO members
  ("customer_id", "join_date")
VALUES
   ('C', '2021-01-11')

drop table members

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
)

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09'),
  ('C', '2021-01-11')

select *
from members
  
select *
from sales
where customer_id = 'B'


/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?

select customer_id as Customer
, SUM(price) as TotalSpent
from [8week challenge].[dbo].[sales] as S
left join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
group by customer_id
order by 1


-- 2. How many days has each customer visited the restaurant?
select customer_id as Customer
, Count (distinct order_date) as 'Number of Days Customer Visted'
from [8week challenge].[dbo].[sales]
group by customer_id


-- 3. What was the first item from the menu purchased by each customer?

select
customer_id
, product_name
, price
, order_date
, DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as count
from [8week challenge].[dbo].[sales] as S
inner join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
Group by customer_id, product_name, price, order_date
order by count


SELECT customer_id AS customer
	       , STRING_AGG(product_name,', ') AS first_order
	FROM [8week challenge].[dbo].[sales] as S
	left join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
	group by customer_id

SELECT 
customer_id AS customer
, m.product_name AS first_order
	FROM [8week challenge].[dbo].[sales] as S
	join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
	WHERE order_date = (
    SELECT MIN(order_date)
    FROM [8week challenge].[dbo].[sales] as p
    WHERE customer_id = p.customer_id
)
	group by customer_id, m.product_name


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

select top 1
product_name as 'Product Name'
, COUNT(s.product_id) "number of orders"
from [8week challenge].[dbo].[sales] as S
inner join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
group by product_name
order by 2 Desc

-- 5. Which item was the most popular for each customer?

SELECT 
customer_id
, product_name
, COUNT(*) AS purchase_count
FROM [8week challenge].[dbo].[sales] as S
inner join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
GROUP BY customer_id, product_name
HAVING COUNT(*) = (
    SELECT MAX(purchase_count)
    FROM (
        SELECT customer_id, product_name, COUNT(*) AS purchase_count
        FROM [8week challenge].[dbo].[sales] as S
inner join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
        GROUP BY customer_id, product_name
    ) AS counts
    WHERE counts.customer_id = s.customer_id
)


select top 3
customer_id
,product_name
, count ( m.product_name) as 'Times Ordered'
from [8week challenge].[dbo].[sales] as S
inner join [8week challenge].[dbo].[menu] as M on s.product_id=m.product_id
group by customer_id,product_name 
order by 'Times Ordered' desc


-- 6. Which item was purchased first by the customer after they became a member?

SELECT top 2
m.customer_id AS "Customer ID"
, product_name AS "Product Name"
, MIN(order_date) AS "First purchase date"
FROM [8week challenge].[dbo].[members] as M
inner join [8week challenge].[dbo].[sales] as S on m.customer_id=s.customer_id
inner join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id
WHERE order_date > join_date
GROUP BY m.customer_id, product_name

select *
from sales

select *
from members
where customer_id = 


-- 7. Which item was purchased just before the customer became a member?

select
m.customer_id AS customer
	, join_date
	, order_date
	, product_name
from [8week challenge].[dbo].[members] as m
join [8week challenge].[dbo].[sales] as s on m.customer_id=s.customer_id
join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id
where join_date > order_date
group by m.customer_id, join_date, order_date, product_name

SELECT
m.customer_id AS customer
, product_name
, order_date
FROM
  [8week challenge].[dbo].[members] as m
join [8week challenge].[dbo].[sales] as s on m.customer_id=s.customer_id
join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id
WHERE
 order_date < join_date
 group by m.customer_id, join_date, order_date, product_name
ORDER BY
 Order_date DESC
limit 1



-- 8. What is the total items and amount spent for each member before they became a member?

SELECT m.customer_id AS customer
       , COUNT(s.product_id) AS "number of items"
       , SUM(price) AS "Amount Spent"
from [8week challenge].[dbo].[members] as m
join [8week challenge].[dbo].[sales] as s on m.customer_id=s.customer_id
join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id
where join_date > order_date
group by m.customer_id


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT 
customer_id AS customer
, SUM(CASE
		WHEN product_name = 'sushi' THEN price * 20
		ELSE price * 10
	 END) AS "Total Points"
FROM [8week challenge].[dbo].[sales] as s 
join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id
GROUP BY customer_id
ORDER BY 2 desc

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

SELECT
s.customer_id AS customer
, SUM(
    CASE
      WHEN order_date BETWEEN join_date AND DATEADD(DAY, 6, join_date) 
	  THEN price * 2
      ELSE price
    END
  ) AS "Total Points"

 FROM [8week challenge].[dbo].[members] as m
join [8week challenge].[dbo].[sales] as s on m.customer_id=s.customer_id
join [8week challenge].[dbo].[menu] as ME on s.product_id=ME.product_id

WHERE
  s.customer_id IN ('A', 'B')
  AND order_date >= '2021-01-01'
  AND order_date <= '2021-01-31'

  group by s.customer_id


  Select *
  from members

