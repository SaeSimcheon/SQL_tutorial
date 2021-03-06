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

select customer_id ,sum(amount) from payment group by customer_id ; -- group by 후 n 집계


select customer_id ,sum(amount) as cnt from payment group by customer_id order by cnt desc;

-- 그룹핑에 의한 table 상태에서 특정 조건에 의한 행만 보고 싶다.


select customer_id ,sum(amount) as cnt from payment group by customer_id having sum(amount)  >=200 order by  cnt desc ; -- 이건 됨

select customer_id ,sum(amount) as cnt from payment group by customer_id having cnt  >=200 order by  cnt desc ; -- 이건 안 되네?

select a.customer_id ,b.email ,sum(a.amount) as cnt from payment a,customer b where a.customer_id = b.customer_id group by a.customer_id , b.email order by cnt desc 
select a.customer_id ,b.email ,sum(a.amount) as cnt from payment a,customer b where a.customer_id =148 and a.customer_id = b.customer_id group by a.customer_id , b.email order by cnt desc -- 이건 안 되네?

select a.customer_id ,b.email ,sum(a.amount) as cnt from payment a,customer b where a.customer_id = b.customer_id group by a.customer_id , b.email having sum(a.amount)  >=200 order by  cnt desc ; -- 이건 안 되네?



select store_id ,count(customer_id) as cnt from customer group by store_id having count(customer_id) > 300 ;



/* Basic week2 10 */

select * from sales2007_1 s1 ;
select * from sales2007_2 s2 ;

select * from sales2007_1 s union select * from sales2007_2 s2 ;

select name from sales2007_1 s union select name from sales2007_2 s2 ;

-- 컬럼이름이 같았고, 자료 타입이 같았음
-- 하나의 select 문으로 도출한 table을 집합으로 생각하고 row를 원소로 생각 





/* Basic week2 11 */
select * from sales2007_1 s union all select * from sales2007_2 s2 ;

select name from sales2007_1 s union all select name from sales2007_2 s2 ;

select * from sales2007_1 s union all select * from sales2007_2 s2 order by amount desc;
/* Basic week2 12 */


select * from employees ;

select * from keys k ;

select * from hipos h ;





select employee_id from keys  intersect select employee_id from hipos ; 

select employee_id from keys  intersect select employee_id from hipos order by employee_id desc;


select k.employee_id from keys k inner join hipos h on k.employee_id = h.employee_id


/* Basic week2 13 */


select distinct i.film_id ,f.title from inventory i
inner join film f on f.film_id =inventory_id order by f.title ;


select * from employee ;

select  manager_id ,first_name ,last_name  from employee ;
select distinct manager_id ,first_name ,last_name  from employee ;

select distinct manager_id   from employee ;
select store_id,film_id from inventory i ;
select distinct store_id,film_id from inventory i ;
select distinct * from inventory i ;



select * from inventory i ;


select film_id , title from film f 
except select distinct i.film_id ,f2.title from inventory i inner join film f2 on f2.film_id = i.film_id  order by title ;
select film_id , title from film f except select i.film_id ,f2.title from inventory i inner join film f2 on f2.film_id = i.film_id  order by title ;




/* Basic week2 14 */


select avg(rental_rate) from film f ;

-- 이 방식을 중첩 서브쿼리라고 하네

select film_id ,title,rental_rate from film f where rental_rate  > 2.98; --(a)


select avg(rental_rate) from film f ; -- 한개의 스칼라 값이 나옴

select film_id ,title,rental_rate from film f where rental_rate  > (select avg(rental_rate) from film f);

-- 위 구문은 (a) 구문과 동일한 결과를 보여준다 


-- 인라인 뷰 ~ 라인 안에 들어갔다.


--where 절이 아니라 from 절 안에 들어가 있다

-- 먼저 카르테지안 프로덕트 이후에 where 절을 통해서 filtering이 이루어진다

-- 이때 두번째 테이블이 서브쿼리에 의한 것인데, 스칼라이므로 avg라는 컬럼이 2.98 값으로 추가된 격이 된다.


select f.film_id ,f.title ,f.rental_rate,f2.avg from film f ,(select avg(rental_rate) as avg from film ) f2  

where f.rental_rate > f2.avg ;


select f.film_id ,f.title ,f.rental_rate from film f ,(select avg(rental_rate) as avg from film ) f2  where f.rental_rate > f2.avg ;



-- 스칼라 서브쿼리

select *
from
	(
	select
		f2.film_id ,
		f2.title ,
		f2.rental_rate ,
		(
		select
			avg(f.rental_rate)
		from
			film f) as avg
	from
		film f2 ) A
		where A.rental_rate > A.avg;
		
-- 메인 -> 인라인 뷰 -> 스칼라 서브쿼리 총 3개 계층으로 되어 있음

	
	
select
		avg(f.rental_rate),avg(f.rental_rate)
	from
		film f ;


select
	f2.film_id ,
	f2.title ,
	f2.rental_rate ,
	(
	select
		avg( f.rental_rate)
	from
		film f) as avg
from
	film f2;




select
	f2.film_id ,
	f2.title ,
	f2.rental_rate ,
	(
	select
		 f.rental_rate
	from
		film f ) as avg
from
	film f2;

select
	f2.film_id ,
	f2.title ,
	f2.rental_rate ,
	(
	select
		 f.film_id ,f.rental_rate
	from
		film f where film_id = 1) as avg
from
	film f2;


	select
		f.film_id ,f.rental_rate
	from
		film f where f.film_id =1;


select
	f2.film_id ,
	f2.title ,
	f2.rental_rate ,
	(
	select
		 f.rental_rate
	from
		film f where film_id = 1) as avg
from
	film f2;
	
	
/* Basic week2 15 */

select f.title , f.length from film f where f.length >=any(
select max(f2.length) from film f2,film_category fc
where f2.film_id = fc.film_id group by fc.category_id);


select f.title , f.length from film f where f.length =any(
select max(f2.length) from film f2,film_category fc
where f2.film_id = fc.film_id group by fc.category_id);


/* Basic week2 16 */
select film_id ,length from film where length > all(select round(avg(length),2) from film f group by rating) ; 


/* Basic week2 17 */


select
	first_name ,
	last_name
from
	customer c
where
	exists (
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount >11
		)
order by
	first_name,
	last_name;
	

select * from employee e ; 

select * from employee e where e.employee_id  = e.manager_id ;

select * from employee e,employee a where e.employee_id  = a.manager_id ;



select 1 from payment p ; -- row 개수에 맞춰서 다 1나옴
select count(*) from payment p ; -- 14596
select count(*)  from customer c ; -- 599


 

select
	first_name ,
	last_name
from
	customer c
where
	exists (
	select
		1
	from
		payment p ,customer c2
	where
		p.customer_id = c2.customer_id
		and p.amount >11
		)
order by
	first_name,
	last_name;



	select
		c2.first_name ,c2.last_name 
	from
		payment p ,customer c2
	where
		p.customer_id = c2.customer_id
		and p.amount >11
order by
	first_name,
	last_name;


select
	first_name ,
	last_name
from
	customer c
where
	exists (
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount >11
		)
order by
	first_name,
	last_name;




select
	first_name ,
	last_name
from
	customer c
where
	not exists (
	select
		1
	from
		payment p
	where
		p.customer_id = c.customer_id
		and p.amount >11
		)
order by
	first_name,
	last_name;