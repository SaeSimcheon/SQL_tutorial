# 첫번째 접근

- 정규표현식
- 마지막 글자 aeiou를 제외한 문자로 시작. -> [[] 안에서 ^는 주어진 문자를 포함하지 않는 문자를 매칭시킴.](https://en.wikipedia.org/wiki/Regular_expression)
```
/*
1. regex -> do not end with a,e,i,o or u. -> '^[^aeiou]'
*/
```
# 첫번째 시도 (통과)


```sql
select distinct city from station where city regexp '[^aeiou]$'
```
