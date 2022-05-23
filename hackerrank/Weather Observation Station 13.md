## 최종 답안
- truncate(a,int) -> 해당 지점 밑의 소수점은 버림.

```sql
select truncate(sum(lat_n),4) from station where lat_n between 38.7880 and 137.2345
```



## 다른 사람들은 어떻게 풀었을까 ?
- between 말고 부등호와 and 사용.
- round는 반

```sql
select ROUND(SUM(LAT_N),4) from station where lat_n > 38.7880 and lat_n < 137.2345;
```
