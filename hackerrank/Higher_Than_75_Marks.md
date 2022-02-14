# 첫번째 접근

- marks가 75 초과 -> where
- order -> order by 
- last three characters -> substr(- ,-3(시작),3(개수) )
- order by 기준 1 , 기준 2 asc


```
- students who scored higher than 75 marks.
- order output by the last three characters of each name. -> If there are ties, sort them by ascending Id
```


# 첫번째 시도 (통과)


```
select name from students S where S.marks > 75 order by substr(S.name,-3,3), id asc;
```
