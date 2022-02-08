# [Weather Observation Station 5](https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true&h_r=next-challenge&h_v=zen)

## 첫번째 접근

- station shortest and longest names  -> length 라는 함수가 있나 ? 
- sort and choose first one -> order by

### query 동작 순서가 기억이 안 남 

## 첫번째 시도와 확인

``` sql
select * from station order by length(city)
```
```
    457 Chester CA 69.8129509200 123.9310828000
    928 Coaling AL 144.2558559000 52.2061892500
    213 Calpine CA 46.5140174400 43.2848995800
    685 Anthony KS 45.0053660100 161.1266931000
    455 Granger IA 33.4187514900 102.0769844000
    824 Loma Mar CA 48.6978857200 130.5393541000
    811 Dorrance KS 102.0888316000 121.5614372000
    325 Monument KS 70.5230095300 141.7680413000
    113 Prescott IA 39.9323442100 65.7932782300
    473 Highwood IL 27.2544581400 150.9227402000
    399 Republic MI 75.4218200000 130.1266717000
    3 Hesperia CA 106.0569286000 71.1187671100
    375 Culdesac ID 47.8418268000 78.0655123600
    467 Roselawn IN 87.7070816900 51.74506986
```

### length라는 함수로 문자열 길이를 구할 수 있었고, order by 가 가능했다.


## 두번째 접근

- length를 통한 결과의 max와 min 값을 갖는 경우를 추출하자. -> sub query ?
- where 안에서 조건문을 통해서 min max를 갖는 case를 각각 추출하는 것이 좋지 않을까 ?
- 안 되면 subquery로 table을 좀 바꿔서 시도해보려고 했음.

## 두번째 시도와 확인

### 1.
``` sql


select * from station where length(city) = max(length(city)) or length(city) = min(length(city))
```
```
runtime error
```


### 2.
```sql

select * from (select * ,length(city) as name_len from station) A 
where A.name_len = max(name_len)

```
```

Runtime Error
Error (stderr)
ERROR 1111 (HY000) at line 3: Invalid use of group function

```

## 세번째 접근
### - 검색해서 mysql에서 위부터 정해진 row를 추출하는 방법이 limit이라는 것을 알아냄.
### - union을 통해서 내림차순, 오름차순으로 각각 table의 결과를 합치려고 했음.
- 두번째 접근처럼 되지 않는 이유는 뭘까 ?
- 만약 길이 같은 case가 있다면 알파벳순으로 정렬한 후에 가장 첫번째를 추출. -> order by에 또 넣어서 해결.


### sum() over() 였나 ? 어떻게 썼었지 ? 이걸 뭐라고 불렀었지 ?

## 세번째 시도와 확인(성공)



```sql
(select city,length(city) as len from station order by len , city limit 1)

union 

(select city,length(city) as len from station order by len desc , city limit 1)
```


