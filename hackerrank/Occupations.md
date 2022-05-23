# 첫번째 접근

- case when then으로 column을 생성하는 것은 모든 row에 대해서 적용되는 것을 잊고 아래처럼 시도해봄
- 여러개 table로 만들어서 세로로 붙이는 방법을 생각했는데 못 찾음.
- pivot table을 
/*
- pivot occupation column
- name is sorted alphabetically and displayed its corr occupation

how to make pivot table in mysql
- group by?
- pivot -> doesn't exist
- occupation -> column doctor professor singer actor -> if there is no case, put null on it.
- subquery -> make seperately a column

how to concat multiple columns
*/

select COALESCE(S.a,) from
(select 
case when occupation = 'Doctor' then name end as a ,
case when occupation = 'Professor' then name end as b,
case when occupation = 'Singer' then name end as c,
case when occupation = 'Actor' then name end as d
from occupations) S


# 두번째 접근

- case when then end를 하나의 column 하나의 column 결과로 생각하기.
- max등 numerical function 적용하면 어떻게 되는지 살펴봄



```sql
select 
max(case when occupation = 'Doctor' then name else null end),
max(case when occupation = 'Professor' then name else null end),
max(case when occupation = 'Singer' then name else null end),
max(case when occupation = 'Actor' then name else null end)
from occupations 
```

```
Priya Priyanka Kristeen Samantha
```




## 최종 답안

- 5월까지 풀었던 것 중에서 가장 오래 걸렸음.
- 가급적이면 찾아보지 않으려 했는데 좋은 방법이 떠오르지 않았음.
- sql reshaping에 포커스를 두고 찾아보았는데 그 중에서 row_number를 생성하여 그것을 기준으로 그룹을 형성하는 방법에 대해서 떠올림.
  - 여기서 다시 각 row num 별로 직업에 맞게 column을 생성하기 위해 아래와 같이 max(case when then end)를 사용하는 방법을 적용.


```sql
select max(case when a.occupation = 'Doctor' then name end),
max(case when a.occupation = 'Professor' then name end),
max(case when a.occupation = 'Singer' then name end),
max(case when a.occupation = 'Actor' then name end)
from (select name,occupation,row_number() over(partition by occupation order by name) as r_num from occupations) a group by a.r_num
```
