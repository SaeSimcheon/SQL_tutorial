# 첫번째 접근

- case when then 구문을 중첩해서 접근하려고 했음. -> 
- 여러 컬럼의 값을 동시에 비교하는 함수가 안 떠오름.
- 여러 컬럼의 값 중에서 두 번째, 세 번째를 추출하는 함수가 기억이 안 남.
/*
lenth equal condition -> one by one comparision -> is there any specific function

- Check case when then end

- it's tricky -> make it legacy 

- not a triangle -> I have to choice second and third side through comparison. -> check the function for it.

- find a function to check the sameness of values over several columns.


-> it's incorrect

# How to find the second largest value across multiple columns and third
# Multiple case when then end
# How to chekc check the sameness of values over several columns.
*/


# 첫번째 시도
```sql
select case when (A+B > C) or (C+A > B) or (B+C > A) then 'Not A Trianlge' 
else (
    case when (A = B) then (case when B = C then 'Equilateral'
                            else 'Isosceles' 
                           end)
    else (
        case when (B=C) then 'Isosceles'
        else 'Scalene'
        end
    )
) end from TRIANGLES;
```

# 두번째 접근

- subquery를 통해서 길이 비교를 한 binary column을 여러개(3개) 만들어서 그 합이 3 이면 세변이 모두 같은 것이고, 1이면 두 변만 같은 것. 하나도 같지 않으면 0
- 셋 중에서 작은 두 변의 합은 어떻게 구할까 ?
- 가장 긴변 > 나머지변의 합 -> 이


# 두번째 시도 (미완성)
```sql
select * , 
case when S.col1+S.col2+S.col3 =3 then 'Equilateral'
when S.col1+S.col2+S.col3 =1 then 'Isosceles'
else 'Scalene'
end
from(
select *,
case when A = B then 1 else 0 end as col1,
case when B = C then 1 else 0 end as col2,
case when C = B then 1 else 0 end as col3
from triangles) S
```


# D+1
```
첫번째날 두번째 접근을 완성시켜서 성공함
굳이 세 개 중 크기가 작은 순으로 두개를 고르거나, 가장 큰 것을 제외하는 생각 필요 없이 부등식 양변에 더해졌다고 생각하면 아래와 같음.
- S.A+S.B+S.C <= 2 * greatest(S.A,S.B,S.C)

그런데 case when then 조건문 세울때 유의할 필요가 있을 것 같음. 겹으로 case when then 이 안 되나 ? 그렇게 해도 복잡하긴 함
```

## SQL에서 True False 덧셈이 되는지 모르겠음. -> legacy -> 됨.
```sql
/*select True + True from triangles*/
select True + True;
```

```
2
```

# 통과
```sql
select case when col1+col2+col3 = 3 and S.A+S.B+S.C > 2 * greatest(S.A,S.B,S.C) then "Equilateral"
when col1+col2+col3 = 1 and S.A+S.B+S.C > 2 * greatest(S.A,S.B,S.C) then "Isosceles" 
when col1+col2+col3 = 0 and S.A+S.B+S.C > 2 * greatest(S.A,S.B,S.C) then "Scalene" 
when S.A+S.B+S.C <= 2 * greatest(S.A,S.B,S.C) then "Not A Triangle" 
end
from(select *,case when A = B then True else False end as col1,
case when B = C then True else False end as col2,
case when A = C then True else False end as col3 from triangles) S
```




# 다른 사람들은 어떻게 풀었을까 ?

## 1. case when then으로 깔끔하게 풀 수 있음.
- not a triangle 조건은 적어도 하나만 만족하면 되니까 부등식 3개로 or로 엮어서 사용하면 됨
- Equilateral은 셋다 같으므로 A = B and B = C로 짜면 됨
- 적어도 한 쌍만 같으면 되므로 , Isosceles도 두 개씩 잡고 or로 엮어서 사용하면 됨.
- 이외에는 else
- 보면서 든 생각은 case when then에서 조건이 맞는 순서로 이탈하나 ? 라는 생각이 들었음. -> 그런데 애초에 모든 조건문이 그렇지 않나 ?
- 생각해보니 내가 잘 못 짠 것 같음 이전에
```sql
select
CASE 
when A + B <= C OR A + C <= B OR B + C <= A THEN "Not A Triangle"
when A = B AND B=C THEN "Equilateral" 
when A = B OR B = C or A=C then "Isosceles"
else "Scalene" 

end from Triangles;
```

## 2. sql에도 한줄 if 구문을 사용한다. if (조건,참일때, 거짓일때)
- 여러 겹으로 사용했음.
- Not A Triangle 조건은 나랑 똑같이 짰음.
```sql
select 
if(A+B+C <= 2*greatest(A,B,C),"Not A Triangle",
if(A=B and B=C,"Equilateral",
if(A=B or B=C or C=A,"Isosceles","Scalene")))
from Triangles;
```

## 3. <>가 뭘까 ? -> legacy [not equal의 의미이다.](https://stackoverflow.com/questions/39075213/what-is-the-meaning-of-in-mysql-query/39075250)
```sql
select
    (
    CASE 
        WHEN A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
        WHEN A=C AND A <> B OR A=B AND A<>C OR C=B AND A<>C THEN 'Isosceles'
        WHEN A=B AND B=C THEN 'Equilateral'
        ELSE 'Scalene'
    END) AS total
 from TRiangles;
```


# D+2

- 이전에 찾은 부등식을 greatest를 이용해서 사용
- case when then은 하나의 큰 조건문이다.

```sql

select case when A + B + C <= 2*greatest(A,B,C) then 'Not A Triangle'
when A = B and B = C then 'Equilateral'
when A = B or B = C or C = A then 'Isosceles'
else 'Scalene'
end
from triangles
```
