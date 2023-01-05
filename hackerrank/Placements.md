```
id와 고유한 값값을 공유하는 friend_id 변수를 이용하여 salary를 비교해 조건을 만족하는 행을 추출하는 문제.

한 row당 친구와 자신 모두의 salary가 필요하기 때문에 salary를 변수로 갖는 packages table을 id와 friend_id에 join 함.

```

```
select name from
friends f left join students s on f.id = s.id 
left join packages p1 on f.friend_id = p1.id
left join packages p2 on f.id = p2.id
where p1.salary > p2.salary
order by p1.salary;
```
