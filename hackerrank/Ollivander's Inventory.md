
```
power와 age를 그룹으로 두고 최소인 coins_needed를 구하면 되는줄 알았는데, id까지 포함하여 "그 행" 자체를 구해야함.
따라서 window function인 row_number를 이용하여 아래와 같이 구함.

```

```
with sb as (
    select id,age,coins_needed,power, row_number() over(partition by age,power order by 
                                                    coins_needed) as rn
    from wands w left join wands_property wp
    on w.code = wp.code
    where is_evil = 0)
select * from sb 
where rn = 1
order by power desc, age desc; 
```
