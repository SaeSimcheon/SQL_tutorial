# 첫번째 접근

- 정규표현식
- aeiou가 

# 첫번째 시도

```sql
select distinct city from station where city regexp '^[^aeiou]' and city regexp '[^aeiou]$'
```
