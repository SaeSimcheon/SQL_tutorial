# 첫번째 접근

접근 자체는 틀리지 않았음. 
- 정규표현식이 기억이 나지 않아서 substr(컬럼이름, 시작, 끝)으로 시도해보니 첫글자만 추출되는 것을 확인함
- where 사용.
- distinct 사용.
- lower을 딱히 적용할 필요 없었음.

## 함수 정리
### [substr](https://www.w3schools.com/sql/func_mysql_substr.asp)

- SUBSTR(string, start, length) 
- **확인할 수 있는 것처럼 맨마지막 parameter는 length이고, 끝이 아님.**
- start를 음수로 설정할 수 있음.

### [Regular expression](https://dev.mysql.com/doc/refman/8.0/en/regexp.html)


```
1. a e i o u start station ->regex ? how to deal with string / how to slice string? 
    - substr
2. distinct (no duplicates) 

3. lower -> what is lower
    - I just use capital
    - I saw that it is not needed to use lower function. 
```

# 첫번째 시도(통과)
```sql
 select distinct S.city from station S where substr(S.city,1,1) in ('a','e','i','o','u'); 
```
 
 # 두번째 시도(통과) <- 
```sql
 select distinct city from station where city regexp '^[AEIOU]'; 
```
 
 
 # 다름 사람 들은 어떻게 풀었을까 ?
```sql
 select distinct CITY from STATION where CITY RLIKE '^[AEIOU]' (정규 표현식)
 SELECT CITY FROM STATION WHERE CITY REGEXP '^[AEIOU]' (정규표현식)
 select city from station where city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%' order by city;
 (번거롭긴하지만 위와 like를 통해서 위와 같은 방식도 가능함.)
```
 


# D+1
/*
city starting with vowels -> regexp
no duplicates -> distinct
*/
```sql
select city from station where city regexp '^[aeiou]'
```


# D+2

```sql
select city  from station where city regexp '^[aeiou]'
```
