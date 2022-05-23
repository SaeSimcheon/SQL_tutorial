


## 최종 답안
- 처음에 left join으로 했었는데 해결이 안 돼서 discussion 참고하여 inner join 이라는 것을 발견함.
- 그런데 


```sql


select t1.continent,coalesce(floor(avg(t2.population)),0) from country t1 inner join city t2 on t1.code = t2.countrycode group by t1.continent


```

### left join으로 풀었을때


```
North America 0
Asia 693038
Europe 175138
Oceania 109189
Africa 274439
South America 147435
Antarctica 0
```

### inner join으로 풀었을 때와 비교했을 때 대륙 2개가 차이가 있었음.

- 개인적으로 문제의 조건을 놓고 보았을때 설명이 불충분하지 않았나 생각함.

```
Asia 693038
Oceania 109189
Europe 175138
South America 147435
Africa 274439
```
