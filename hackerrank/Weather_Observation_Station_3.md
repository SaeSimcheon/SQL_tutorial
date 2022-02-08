
# [Weather_Observation_Station_3](https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true&h_r=next-challenge&h_v=zen)

## 첫번째 문제 접근
- station table로부터 -> select id, city from station
- even ID number -> 나머지 연산자가 기억이 안 나서 /로 넣음.
- exclude duplicates -> 중복 제거 distinct

## 첫번째 시도


```sql
select id,city from station where id / 2 ==1;
```

## 두번째 문제 접근

- station table로부터 -> select id, city from station -> city 만을 원한다는 사실을 알게 됨.
- even ID number -> 나머지 연산자가 기억이 안 나서 /로 넣음. -> 나머지 연산자 %가 아닐까 ? 
  -> [my sql에서 %는 나머지 연산자](https://www.educba.com/mysql-operators/)
- exclude duplicates -> 중복 제거 distinct.
- **== 가 아니라 = 였음.**

## 두번째 시도 (성공)
```sql
select distinct city from station where id % 2 =0;
```

