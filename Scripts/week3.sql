/* Advanced 01 */

select * from sales ; 



select brand ,segment ,sum(quantity) from sales group by brand ,segment order by brand;
-- b - s �׷�

select segment ,sum(quantity) from sales group by segment order by segment ;
-- s �׷�

select sum(quantity) from sales ;
-- ��ü ��


select brand ,segment ,sum(quantity) from sales group by brand ,segment  union all
-- b - s �׷�

select brand ,null,sum(quantity) from sales group by brand  union all

--b �׷�
select null,segment ,sum(quantity) from sales group by segment  union all
-- s �׷�

select null,null,sum(quantity) from sales 




select brand as c1 ,segment as c2 ,sum(quantity) from sales group by grouping sets ((c1,c2),(c1),(c2),());



select grouping(brand) as gc1,grouping(segment) as gc2 ,brand as c1 ,segment as c2 ,sum(quantity) from sales group by grouping sets ((c1,c2),(c1),(c2),());

/* Advanced 02 */

/* Advanced 03 */

/* Advanced 04 */

/* Advanced 05 */

/* Advanced 06 */

/* Advanced 07 */

/* Advanced 08 */
