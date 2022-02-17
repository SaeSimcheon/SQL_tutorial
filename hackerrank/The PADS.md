
# 첫번째 접근
```
문자열을 붙여서 해결하고 싶은데 mysql에서 문자열을 paste하는 함수가 기억이 안 남.
2개 쿼리를 짰었어야 했음.
occupation을 group으로 해서 group.
```

## [문자열을 합치기 위한 concate이라는 것이 있음.](https://www.w3resource.com/mysql/string-functions/mysql-concat-function.php)
  - 숫자도 자동으로 문자열로 합쳐줌.
  - 사용방법은 다른 언어의 함수들과 다르지 않았음.

#### a function to paste strings -> +? doesn't work
#### How to paste strings in mysql? 

# 첫번째 시도
```sql
/*
part1
- alphabet order names and the first letter of each profession as a parenthetical

part2 
- Sort the occurences in ascending order , output them in the format : There are a total of [counts] []s.

2queries

needed
#### a function to paste strings -> +? doesn't work
#### How to paste strings in mysql?
#### Count group case -> group by and count
#### lower string -> lower function
*/


select concat(name,'(',substr(occupation,1,1),')') from occupations order by name; 

select concat('There are a total of ',count(*),' ',lower(occupation),'s.') from occupations group by occupation order by count(*)


```


# 다른 사람들은 어떻게 풀었을까 ?

## 1. substr 대신 left.
- [left도 string에서 원하는 길이만큼 문자열을 뺀다.](https://www.w3schools.com/sql/func_sqlserver_left.asp)

```sql
SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') FROM Occupations ORDER BY Name;
SELECT CONCAT('There are total ', COUNT(*), ' ', LOWER(Occupation), 's.') FROM Occupations GROUP BY Occupation ORDER BY COUNT(*);
```
## 2. cast를 이용해 char 타입으로.


```sql
select concat(name, '(', substring(occupation, 1, 1), ')') from occupations order by name asc;
select concat("There are total ", cast(count(*) as char), " ", lower(occupation), "s.") from occupations group by occupation order by count(*) asc;
```

## 3. lcase를 통해서 lower를 대체하자.

```sql
select concat(Name, '(', substring(Occupation from 1 for 1), ')') from Occupations order by Name;
select concat('There are total ', count(*), ' ', lcase(Occupation), 's.') from Occupations group By Occupation order by Count(*);
```


# D+1
- lcase 사용해서 lower 대체, left를 통해 substr 
```
/*
Two queries
- alphabetically ordered list of names : name(Capital of occupation) 
- order by count(name) in a group. write sentences in the following form :
There are a total of [count] [occupation]s. -> group by and count
*/
```

```sql
select concat(name,'(',left(occupation,1),')') from occupations order by name;

select concat('There are a total of ',count(name),' ',lcase(occupation),'s.') from occupations group by occupation order by count(name);
```
