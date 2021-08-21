/* Basic 04 */
SELECT * FROM actor ;


/* Basic 05 */

select * from customer ; /* *�� ��� columns*/

select * from customer ; 
/* *�� ��� columns*/



select first_name ,last_name ,email from customer ;



/* ���� ���� : 
 *  from - ���
 * select -��� 
 * ������� ��*/

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



/* distinct �ǽ�*/
select bcolor from ttt1 order by bcolor;
select distinct bcolor from ttt1 order by bcolor; 


/* distinct �ǽ� - 2*/


select bcolor,fcolor from ttt1 order by bcolor,fcolor;

select distinct on (bcolor)bcolor,fcolor from ttt1 order by bcolor,fcolor;


select distinct on (bcolor)bcolor,fcolor from ttt1 order by bcolor,fcolor desc;

