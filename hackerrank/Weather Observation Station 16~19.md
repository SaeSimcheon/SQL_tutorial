Weather Observation Station 16
select round(lat_n,4) from station where lat_n > 38.7780 order by lat_n asc limit 1


Weather Observation Station 17
select round(long_w,4) from station where lat_n > 38.7780 order by lat_n limit 1

Weather Observation Station 18
select round(abs(max(long_w)-min(long_w)) + abs(max(lat_n)-min(lat_n)),4) from station



Weather Observation Station 19

- mysql에서 ^2는 제곱이 아니다.
- 최초에는 아래와 같이 시도 해서 얻은 결과는 16.2480으로 오답.
- power 또는 pow 사용할 것.

select truncate(sqrt((max(long_w)-min(long_w)^2+(max(lat_n)-min(lat_n))^2),4) from station


- 184.1616
select truncate(sqrt(power(max(long_w)-min(long_w),2)+power(max(lat_n)-min(lat_n),2)),4) from station
