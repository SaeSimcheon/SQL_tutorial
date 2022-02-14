# 첫번째 접근

- 6번과 동일한 문제
- a,e,i,o,u를 문자 끝에 매칭시켜서 정규표현식을 사용하면 됐었음.

# 첫번째 시도 (통과)

```sql
select distinct city from station where city regexp '[aeiou]$'
