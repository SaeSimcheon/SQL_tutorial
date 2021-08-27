/* Advanced 01 */

select * from sales ; 



select brand ,segment ,sum(quantity) from sales group by brand ,segment order by brand;
-- b - s 그룹

select segment ,sum(quantity) from sales group by segment order by segment ;
-- s 그룹

select sum(quantity) from sales ;
-- 전체 합


select brand ,segment ,sum(quantity) from sales group by brand ,segment  union all
-- b - s 그룹

select brand ,null,sum(quantity) from sales group by brand  union all

--b 그룹
select null,segment ,sum(quantity) from sales group by segment  union all
-- s 그룹

select null,null,sum(quantity) from sales 




select brand as c1 ,segment as c2 ,sum(quantity) from sales group by grouping sets ((c1,c2),(c1),(c2),());



select grouping(brand) as gc1,grouping(segment) as gc2 ,brand as c1 ,segment as c2 ,sum(quantity) from sales group by grouping sets ((c1,c2),(c1),(c2),());

/* Advanced 02 */

select brand , segment , sum(quantity) from sales group by rollup (brand,segment)
order by brand ,segment ;


select brand , segment , sum(quantity) from sales group by segment, rollup (brand) order by brand ,segment ;

/* Advanced 03 */

select brand , segment ,sum(quantity) from sales
group by rollup (brand,segment);-- segment 만의 합계는 안 나옴


select brand , segment ,sum(quantity) from sales
group by cube(brand,segment); -- segment 만의 합계도 나옴

select brand , segment ,sum(quantity) from sales
group by brand,cube(segment); 


select brand , segment ,sum(quantity) from sales
group by grouping sets(brand,segment,(brand,segment)); 



/* Advanced 04 */

select count(*) from product p ;

select count(*) over(),p.* from  product p 


/* Advanced 05 */

select B.group_name,avg(price)  from product A inner join product_group B
on( A.group_id = B.group_id) group by B.group_name;


select A.proudct_name ,A.price ,B.group_name,avg(A.price) over (partition by B.group_name)  from product A inner join product_group B
on( A.group_id = B.group_id) ;



select
	A.proudct_name ,
	A.price ,
	B.group_name,
	avg(A.price) over (partition by B.group_name
	order by A.price)
from
	product A
inner join product_group B
on
	( A.group_id = B.group_id) ;

/* Advanced 06 */
select
	p.proudct_name,
	pg.group_name,
	p.price ,
	row_number() over( partition by pg.group_name order by p.price )
from
	product p
inner join product_group pg on
	(p.group_id = pg.group_id);

select
	p.proudct_name,
	pg.group_name,
	p.price ,
	rank() over( partition by pg.group_name order by p.price )
from
	product p
inner join product_group pg on
	(p.group_id = pg.group_id);



select
	p.proudct_name,
	pg.group_name,
	p.price ,
	dense_rank() over( partition by pg.group_name order by p.price )
from
	product p
inner join product_group pg on
	(p.group_id = pg.group_id);


/* Advanced 07 */


select
	p.proudct_name,
	pg.group_name,
	p.price ,
	first_value (p.price) over( partition by pg.group_name order by p.price ) as lowest
from
	product p
inner join product_group pg on
	(p.group_id = pg.group_id);


select
	p.proudct_name,
	pg.group_name,
	p.price ,
	last_value (p.price) over( partition by pg.group_name
order by
	p.price 
	range between unbounded preceding and unbounded following)
from
	product p
inner join product_group pg on
	(p.group_id = pg.group_id);


/* Advanced 08 */

select
	p.proudct_name ,
	pg.group_name ,
	p.price ,
	lag(p.price,1) over(partition by pg.group_name order by p.price) as lagged, 
	p.price - lag(p.price,1) over(partition by pg.group_name order by p.price) as lagged
from
	product p
inner join product_group pg 
on
	p.group_id = pg.group_id
	
	
	
select
	p.proudct_name ,
	pg.group_name ,
	p.price ,
	lead(p.price,1) over(partition by pg.group_name order by p.price) as lagged, 
	p.price - lead(p.price,1) over(partition by pg.group_name order by p.price) as lagged
from
	product p
inner join product_group pg 
on
	p.group_id = pg.group_id

	
/*advanced 09 */
	
-- 원래 구문
select film_id ,title ,(case when length < 30 then 'short'
when length < 30 then 'short'
when length >= 30 and length <90 then 'medium'
when length > 90 then 'long'
end  
) length
from film f ;



-- 원래 구문
with tmp1 as (
select film_id ,title ,(case when length < 30 then 'short'
when length < 30 then 'short'
when length >= 30 and length <90 then 'medium'
when length > 90 then 'long'
end  
) length
from film f )
select * from tmp1 a where a.length = 'long';
