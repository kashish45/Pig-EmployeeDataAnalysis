/*Top 3 employees (employee id and employee name) with highest salary, whose
employee id is an odd number. (In case two employees have same salary, employee
with name coming first in dictionary should get preference)*/

emp = LOAD 'gs://pigquery/employee.txt' USING PigStorage(',') AS (emp_id:int,emp_name:chararray,emp_salary:int,emp_rating:int);

emp_sal_name = ORDER emp BY emp_salary desc;

emp_sal_id = FILTER emp_sal BY emp_id%2==1;

emp_final = FOREACH emp_sal_id GENERATE emp_id,emp_name;

emp_final_limit = LIMIT emp_final 3;

DUMP emp_final_limit;



	