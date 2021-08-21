/* Basic 04 */
SELECT * FROM actor ;


/* Basic 05 */

select * from customer ; /* *은 모든 columns*/

select * from customer ; 
/* *은 모든 columns*/



select first_name ,last_name ,email from customer ;



/* 실행 순서 : 
 *  from - 대상
 * select -대상 
 * 순서라고 함*/

select A.first_name ,A.last_name ,A.email from customer A ;



/* Basic 06 */

select first_name ,last_name from customer
order by first_name asc; 

select first_name ,last_name from customer
order by first_name desc; 


select first_name ,last_name from customer
order by first_name ,last_name desc ; 

select first_name ,last_name from customer
order by 1 asc ,2 desc ;





/* Basic 07 */

create table ttt1 (id serial not null primary key, bcolor varchar , fcolor varchar);
drop table ttt1;


select * from ttt1;

insert 
	into ttt1 (bcolor,fcolor)
	values 
		('red','red'),
		('red','red'),
		('red',null),
		(null,'red'),
		('red','green'),
		('red','blue'),
		('green','red'),
		('green','blue'),
		('green','green'),
		('blue','red'),
		('blue','green'),
		('blue','blue')
		;
		
commit ;


	
	
select * from ttt1;



/* distinct 실습*/
select bcolor from ttt1 order by bcolor;
select distinct bcolor from ttt1 order by bcolor; 


/* distinct 실습 - 2*/


select bcolor,fcolor from ttt1 order by bcolor,fcolor;

select distinct on (bcolor)bcolor,fcolor from ttt1 order by bcolor,fcolor;


select distinct on (bcolor)bcolor,fcolor from ttt1 order by bcolor,fcolor desc;




/* Basic 08 */


select last_name  ,first_name from customer where first_name = 'Jamie' ;

select
	last_name ,
	first_name
from
	customer
where
	first_name = 'Jamie'
	and last_name = 'Rice';



select
	customer_id ,
	amount ,
	payment_date
from
	payment
where
	amount <= 1
	or amount >= 8;



/* Basic 09 */


select film_id ,title , release_year from film order by film_id  limit 5

select film_id ,title , release_year from film order by film_id  limit 4 offset 3;




select film_id ,title , release_year from film order by rental_rate  desc limit 10;



/* Basic 10 */ 


select film_id ,title  from film order by title fetch first row only ;

select film_id ,title  from film order by title fetch first 1 row only ;


select film_id ,title  from film order by title fetch first 4 row only ;

select
	film_id ,
	title
from
	film
order by
	title 
	offset 5 rows
fetch first 4 row only ;



/* Basic 11 */

select
	customer_id ,
	rental_id ,
	return_date
from
	rental
where
	customer_id in (1, 2)
order by
	rental_date desc ;





select
	customer_id ,
	rental_id ,
	return_date
from
	rental
where
	customer_id = 1 or 
	customer_id  = 2
order by
	rental_date desc ;



select
	customer_id ,
	rental_id ,
	return_date
from
	rental
where
	customer_id not in (1, 2)
order by
	rental_date desc ;




select
	customer_id ,
	rental_id ,
	return_date
from
	rental
where
	customer_id <> 1
	and customer_id <> 2
order by
	rental_date desc ;


/*조건 */
select customer_id from rental where cast(return_date as date) = '2005-05-27';

select
	first_name ,
	last_name
from
	customer
where
	customer_id in (
	select
		customer_id
	from
		rental
	where
		cast(return_date as date) = '2005-05-27') ;