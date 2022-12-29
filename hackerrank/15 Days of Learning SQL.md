```
select submission_date,count(*)
from
(select submission_date,hacker_id,count(submission_id) over(partition by hacker_id 
                                   order by submission_date 
                                   ROWS UNBOUNDED PRECEDING) - extract(day from submission_date) as cri
from submissions order by submission_date,hacker_id) sb
where cri = 0 
group by submission_date;
```
