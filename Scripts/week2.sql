/* Basic week2 01 */

select * from basket_a  ; 
select * from basket_b  ; 


/* Basic week2 02 */

select * 
from basket_a A 
inner join basket_b B
on A.fruit = B.fruit 

select *
from customer A
inner join payment B
on A.customer_id = B.customer_id 

select *
from customer A
inner join payment B
on A.customer_id = B.customer_id 
where A.customer_id =2 ; 

select *
from customer A
inner join payment B
on A.customer_id = B.customer_id
inner join staff C
on B.staff_id = C.staff_id 
/*1대1 관계가 아니라 1대 다 관계인 경우 적은 쪽이 replicate 됨*/

select * from customer where customer_id =341 order by customer_id  desc
select * from payment where customer_id =341 order by customer_id  desc


select * from customer

select distinct on (store_id) * from customer /*store id 기준으로 distinct 하는데 */;
select * from customer;
select * from payment  ;
select * from staff /* 2명*/  

/* Basic week2 03 */

select * 
from basket_a a 
left join basket_b b
on a.fruit = b.fruit ;

select * 
from basket_a a 
left join basket_b b
on a.fruit = b.fruit 
where b.id is not null;

select
	*
from
	basket_a a
left join basket_b b
on
	a.fruit = b.fruit
where
	b.id is null;


select
	*
from
	basket_a a
right join basket_b b
on
	a.fruit = b.fruit ;

select
	*
from
	basket_a a
right join basket_b b
on
	a.fruit = b.fruit
where
	a.id is not null;

/* Basic week2 04 */
/* Basic week2 05 */
/* Basic week2 06 */
/* Basic week2 07 */
/* Basic week2 08 */
/* Basic week2 09 */
/* Basic week2 10 */
/* Basic week2 11 */
/* Basic week2 12 */