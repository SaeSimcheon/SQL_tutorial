## 최종 답안
- max가 where 안에서 안 써져서 다른 방법을 찾음.

```sql
select total,count(*) from (select months * salary as total from employee) t1
where t1.total in (select max(months * salary) as total from employee) group by total
```



## 다른 사람들은 어떻게 풀었을까 ?


```sql


select months*salary,count(*) from Employee group by 1 order by 1 desc limit 1
```

```sql
select e1.m, count(*) from (select max(salary*months) m from employee) e1, employee e2 where e1.m=(e2.salary*e2.months);

```
