```
with recursive 구문을 이용해서 시작일을 기준으로 한 그룹을 형성하였음
초기를 table로 설정할 수 있음.
end_date에 start_date가 있는지만 확인해서 시작일인지 여부를 확인할 수 있음.
반복하여 table을 추출해 union 하는데 start_date와 end_date가 같은 경우를 순서대로 추가함.
이때 depth 하는 변수를 두어 시작일일때 0에서 1씩 늘려 한 프로젝트에서의 연속일수를 반영.
```
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
