## 일정한 수열을 만든 방법 -> with recursive
## &를 구분자로 하는 문자열로 결과를 나타낸 방법 -> group_concat 단, 그룹은 따로 지정하지 않음
## 각 정수가 소수인지 판별한 방법 -> cross join 즉, from table1 join table2를 수행한 후에 조건문을 사용. 1을 처음부터 제외하고 자신을 제외한 다른 수로 나뉘는 경우가 없다면 소수

```
with recursive b as 
( select 2 as a
 union all 
 select a +1 from b
 where a < 1000
)
select group_concat(a separator '&')
from
(select l.a from b as l join b as r
where l.a % r.a =0
group by l.a
having count(*) = 1 ) obs
```


```
0103
```

```
with recursive b as (
select 1 as a
union all
select a +1 from b
where a < 1000
) 
select group_concat(a separator '&' ) 
from(
select b1.a from b as b1
join b as b2
where b1.a % b2.a = 0 and b2.a != 1
group by b1.a 
having count(*) = 1) sb; 
```
