```
총 테이블 3개를 join 하였음.
각 날짜까지 매일 제출한 유저의 수
각 날짜별 가장 많은 제출을 한 유저의 id
hacker_id와 hacker_name

예제를 제대로 보고 이해할 필요가 있었음.
적어도 한 번이라도 제출했는지 확인하면 되었는데 window function을 사용하며 중복을 생략해야한다는 것을 간과하였음.
oracle 기준으로 수행함 extract 을 이용하여 날짜에서 일만 추출함.

```

```
select sb1.submission_date,sb1.cnt,sb2.hacker_id,h.name from
(select submission_date,count(*) as cnt from(
select hacker_id,submission_date, 
count(hacker_id) over(partition by hacker_id order by submission_date rows unbounded preceding)
        - extract(day from submission_date) as ch
        from (select distinct submission_date, hacker_id from submissions) a ) sb1
        where ch = 0
        group by submission_date) sb1
left join
(select * from
(select submission_date, hacker_id, count(submission_id), 
row_number() over(partition by submission_date order by count(submission_id) desc,hacker_id) as rn
 from submissions 
group by submission_date, hacker_id )
where rn = 1) sb2
on sb1.submission_date = sb2.submission_date 
left join hackers h on sb2.hacker_id = h.hacker_id
order by sb1.submission_date
; 
```
