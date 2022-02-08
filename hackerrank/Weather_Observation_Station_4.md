# [Weather_Observation_Station_4](https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true)

## 첫번째 접근
- 중복 허용해서 city 의 총 수와 중복을 제거한 city의 총 수의 차를 구함. -> count(city), 
-> count 안에서 distinct 키워드가 사용되는지 확신하지 못했음.


## 첫번째 시도(성공)
``` sql
select count(city)- count(distinct city) from station 
```

### count를 중복을 제거해서 사용하기 위해서 distinct 키워드를 count안에 포함하여 사용할 수 있다. -> 다른 함수들도 그렇지 않을까 ?
