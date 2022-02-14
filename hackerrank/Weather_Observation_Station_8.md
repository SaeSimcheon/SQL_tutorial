# 첫번째 접근

- 이것도 정규표현식 문제였음.
- aeiou가 첫번째와 마지막 문자에 모두 있는 도시. -> and로 / 다른 사람들도 이렇게 풀었음.
- distinct


```
1. regex / have aeiou  as both first and last
```


# 첫번째 시도

```sql
select distinct city from station where city regexp '^[aeiou]' and city regexp '[aeiou]$';
```


# 다른 사람들은 어떻게 풀었을까 ?


- 대부분 내가 푼거랑 비슷하게 풀었는데 딱 하나의 정규표현식만 써서 푼 사람이 있을까 찾아봤는데 아래와 같은 방법을 사용.
- ^[aeiou] : 주어진 조건으로 첫 글자. 
- .(아무 문자나 가능)*(0개 이상)
- [aeiou]$ : 주어진 조건으로 마지막 글자.

```sql
select distinct(CITY) from STATION where CITY REGEXP '^[aeiou].*[aeiou]$' order by CITY;
```
