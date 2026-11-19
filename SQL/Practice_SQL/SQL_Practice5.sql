select *,row_number() over(order by salary desc) as Row_No
from employees;

select *,rank() over(order by salary desc) as Rank_No
from employees;

select *,dense_rank() over(partition by dept_id order by salary desc) as Rank_No
from employees;

select emp_id,emp_name,rank_no from
(select emp_id,emp_name,dense_rank()
over(partition by dept_id order by salary desc) as rank_no
from employees
) t 
where rank_no <= 3;

select emp_id,emp_name,rank_no from
(select emp_id,emp_name,dense_rank()
over(partition by dept_id order by salary desc) as rank_no
from employees
) t 
where rank_no = 2;

select *,dense_rank() over(partition by dept_id order by hire_date desc) as Rank_No
from employees;

select emp_id,emp_name,dept_id,salary,sum(salary) over(partition by dept_id) as Department_Total_Salary
from employees;

select emp_id,emp_name,dept_id,salary,avg(salary) over(partition by dept_id) as Department_Average_Salary
from employees;

select distinct d.dept_id,d.dept_name,count(e.emp_name) over(partition by e.dept_id)
from employees e join departments d on e.dept_id = d.dept_id;

select distinct dept_id,max(salary) over(partition by dept_id) as Max_Salary,min(salary) over(partition by dept_id) as Min_Salary
from employees;

select emp_name,sum(salary) over(order by emp_id) as Running_Total
from employees;

select emp_name,avg(salary) over(order by emp_id) as Cumulative_Average
from employees;

select emp_name,salary,(salary/sum(salary) over(partition by dept_id))*100 as Percentage
from employees;

select emp_name,salary,lag(salary) over(order by emp_id) as Previous_Employee from employees;

select emp_name,salary,lead(salary) over(order by emp_id) as Next_Employee from employees;

select distinct *,first_value(salary) over(order by salary desc) Highest_Value
from employees;
