```
WITH   recursive q AS 
        (
        SELECT  start_date,end_date,0 as depth
        FROM    (select 
        case when p.start_date in (select p1.end_date from projects p1) then True
        else False 
        end as start_point,
        p.*
        from projects p  ) mytable
        WHERE   start_point = False
        UNION ALL
        SELECT  q.start_date, m.end_date, q.depth +1
        FROM  projects m  
        JOIN    q
        ON      m.start_date = q.end_date
        )
SELECT  start_date,max(end_date) as end_date
FROM    q
group by start_date
order by max(depth),start_date;
```
```
select start_date, 
case when (v1 = 0 and v2 = 1 ) then l_date 
else end_date
end as e
from
(select * , lead(end_date,1) over(order by end_date) as l_date
from (select * from
      (select *,
       case when start_date in (select end_date from projects) then 1
       else 0 end as v1,
       case when  end_date in (select start_date from projects) then 1
       else 0 end as v2
       from projects
       order by start_date,end_date) sb
      where  (v1 = 0 and v2 =1) or (v1 = 1 and v2 = 0) or (v1 = 0 and v2 =0 ) 
) sb1 ) sb2
where (v1 = 0 and v2 = 1 ) or (v1= 0 and v2= 0 )
order by e-start_date,start_date;
```
