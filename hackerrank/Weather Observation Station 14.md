## 최종답안

- truncate -> 소숫점 넷째자리 밑으로 버림
- where 를 통해서 제약 조건 충족
- order by desc를 통해서 내림 차순으로 정렬한 후에 limit을 통해서 row case 추출


```sql
select truncate(lat_n,4) from station where lat_n < 137.2345 order by lat_n desc limit 1
```
