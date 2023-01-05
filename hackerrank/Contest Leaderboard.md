```
각 hacker가 각 contest에서 얻은 최대 점수를 유저마다 합해서 출력.
단, 데이터 순서와 score =0인 경우 제외.

group by 를 2회에 걸쳐 수행해 hacker,contest -> hacker 순으로 취합하였음.

```

```
select sb1.hacker_id, h.name ,s from
(select hacker_id,sum(max_score) as s from
(select hacker_id,challenge_id,max(score) as max_score
from submissions 
group by hacker_id,challenge_id) sb
group by hacker_id) sb1 left join hackers h on sb1.hacker_id = h.hacker_id
where s != 0 
order by s desc, hacker_id
;
```
