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


()
