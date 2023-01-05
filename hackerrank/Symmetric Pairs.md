```
self join을 통해서 한 table 안에서 서로 조건을 충족하는 row의 조합이 있는지 파악하였음.
이때, x와 y좌표가 동일한 경우에는 자기자신과 조건을 만족하는 페어가 만들어지는 문제가 있었음.
이를 해결하기 위하여 row_number()를 통해 고유한 값을 주고 서로 같지 않은 경우만 추출하였음.
x <= y인 경우만 추출하기 위하여 조건에 추가하였음.
row_number를 가진 table을 임시로 with 을 통하여 생성하고 이후 절차를 진행.

```


```
with a as(select *,row_number() over(order by x,y) as rn from
functions)
select distinct a1.x,a1.y
from a a1 join a a2 
where a1.x = a2.y and a1.y = a2.x and a1.x <= a1.y and a1.rn != a2.rn
order by a1.x;

```
