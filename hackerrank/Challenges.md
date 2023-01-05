```
with 구문으로 반복해서 사용되는 임의의 테이블을 쉽게 이용함.
특이한 조건 : 값중 최대인 경우가 복수개의 row에 있다면 이는 모두 결과에 포함하는 반면, 최대보다 작은 경우에 복수 개가 존재하면 이를 모두 결과에서 제외함.

```


```
with sb as (
select hacker_id , count(distinct challenge_id) as cnt, count(*) over(partition by count(distinct challenge_id)) as rn
from challenges group by hacker_id
)
select sb.hacker_id,name,cnt
from sb
left join hackers h on sb.hacker_id = h.hacker_id
where (cnt = (select max(cnt) from sb) and rn >=2) or rn = 1
order by cnt desc ,hacker_id; 
```
