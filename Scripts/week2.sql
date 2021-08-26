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

select * from employee ;


select
	e.first_name || ' ' || e.last_name manager 
,
	m.first_name || ' ' || m.last_name employee
from
	employee e
inner join employee m 
on
	m.employee_id = e.manager_id
order by
	manager;

select
	e.first_name || ' ' || e.last_name manager 
,
	m.first_name || ' ' || m.last_name employee
from
	employee e
left join employee m 
on
	m.employee_id = e.manager_id
order by
	manager;

select
	e.first_name || ' ' || e.last_name manager 
,
	m.first_name || ' ' || m.last_name employee
from
	employee e
right join employee m 
on
	m.employee_id = e.manager_id
order by
	manager;


select * from film f1
inner join film f2
on f1.film_id <>f2.film_id 
and f1.length =f2.length ;

/* Basic week2 05 */

select *
from basket_a a 
full outer join
basket_b b
on a.fruit = b.fruit ;

select *
from basket_a a 
full outer join
basket_b b
on a.fruit = b.fruit 
where a.id is null or b.id is null;



select * from departments ;
select * from employees ;

select * from employees e 
full outer join departments d 
on d.department_id  = e.department_id ;


select * from employees e 
full outer join departments d 
on d.department_id  = e.department_id 
where e.department_id is null or d.department_id is null;

/* Basic week2 06 */

select * from cross_t1 c1; 
select * from cross_t1 c2;


select *
from cross_t1 
cross join 
cross_t2 ct;

select * from cross_t1 ,cross_t2;




/* Basic week2 07 */


select * 
from products A
natural join
categories B


select *
from products a 
natural join 
categories b 
;


select * from products p inner join categories c on p.category_id = c.category_id ;

/* Basic week2 08 */

select * from payment; 

SELECT count(customer_id)  FROM payment ;
SELECT customer_id,count(customer_id) FROM payment group by customer_id ;

select distinct customer_id from payment  


select customer_id ,sum(amount) as A from payment group by customer_id order by A desc;


select customer_id ,sum(amount) as A from payment group by customer_id order by 2 desc;
--이런 방법도 있지만, 열이 추가 되고 제거됨에 따라 문제가 생길 수 있으므로 비선호

select * from customer where customer_id =148;



select staff_id ,count(staff_id) as cnt from payment group by staff_id ;

select * from staff ;

select * from staff where staff_id =1;


select * from payment ;

select * from payment a left join staff s on a.staff_id = s.staff_id ;



select * from payment p inner join staff s on p.staff_id =s.staff_id ;

select * from payment p,staff s where p.staff_id =s.staff_id ;

select * from employee ,staff ; 

select * from employee cross join staff ; 

select * from employee e;

select *from staff s;

select *from employees e ;


select 2 * 8 * 16;


select * from employee ,staff ,employees ; 

--cross join = select from tb1,tb2 ...
-- where 조건 없이 그대로 실행하면 카르테지안 곱의 결과를 나옴
-- 결국 카르테지안 곱의 결과에 where 조건 중 특정 key 값이 같은 조건을 넣어줘서 equi join을 만듦

select p.staff_id s from payment p , staff s where p.staff_id = s.staff_id group by p.staff_id ,s.staff_id;
select p.staff_id ,s.staff_id from payment p , staff s where p.staff_id = s.staff_id group by p.staff_id ,s.staff_id;
select p.staff_id ,s.staff_id ,s.first_name  from payment p , staff s where p.staff_id = s.staff_id group by p.staff_id ,s.staff_id;
select p.staff_id ,s.staff_id ,s.first_name ,s.last_name from payment p , staff s where p.staff_id = s.staff_id group by p.staff_id ,s.staff_id;
select p.staff_id ,s.staff_id ,s.first_name ,s.last_name,count(p.customer_id) as cnt from payment p , staff s where p.staff_id = s.staff_id group by p.staff_id ,s.staff_id,s.first_name,s.last_name ;







/* Basic week2 09 */



/* Basic week2 10 */



/* Basic week2 11 */


/* Basic week2 12 */




