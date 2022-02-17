# Multiple table join 공부할 것
# Multiple key join 공부할 것



# 첫번째 접근
- employee를 기준으로 전부 join하려고 했었음. 

# 두번째 접근
- company에 있는 group by 기준인 founder를 제외하고는 다른 테이블에 필요한 정보가 없었음. -> join할 필요성이 없다고 생각힘.
- company와 employee만 join한 다음에 company_code와 founder를 이용하여 group by 한 다음 count(distinct column name)을 수행함.
 

/*
company_code, founder name, total number of lead manager, total number of senior managers,
total number of managers and total number of employees 

- order output by asc company_code

- employee <- joined with the other tables

how to do left join in mysql?
how to do mutiple join in mysql? -> subquery? or multiple join after from
how to use mutiple keys in join in mysql? -> 

- from A left join B on A.key1 = B.key2


Is it unnecessary to care the tables except for company and employee?
*/

```sql
select E.company_code,C.founder ,count(distinct E.lead_manager_code),
count(distinct E.senior_manager_code),
count(distinct E.manager_code),
count(distinct E.employee_code)
from employee E left join company C on E.company_code = C.company_code 
group by E.company_code,C.founder
```                                    
