
# 첫번째 접근

- 정규표현식
- 첫 문자가 aeiou가 아니거나 마지막 문자가 aeiou가 아님.

# 첫번째 시도

```sql
select distinct city from station where city regexp '^[^aeiou]' or city regexp '[^aeiou]$'
```
