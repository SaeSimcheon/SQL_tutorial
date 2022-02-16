# 첫번째 접근
- a list of names having salary > 2000 -> where
- who have been employees ~ -> where ~ and ~
- order by employee_id

```
- a list of names for employees having a salary greater than 2000 per month 
who have been employees for less than 10 months.
- order by employee_id
```

# 첫번째 시도(통과)

```sql
select name from employee E where E.salary > 2000 and E.months < 10 order by E.employee_id asc;
```



# D+1

/*
a list of names having a salary > 2000 per month / < 10 months 
order by employee_id

*/

```sql
select name from employee where salary > 2000 and months < 10 order by employee_id
```

# D+2

```sql
select name from employee where salary > 2000 and months < 10
```
