/*List of employees (employee id and employee name) having entries in employee_expenses file. */

emp = LOAD 'employee_details' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int); 



emp_expenses = LOAD 'employee_expenses' AS (emp_id:int, expenses:int);



emp_with_exp = JOIN emp BY emp_id, emp_expenses BY emp_id; 



emp_with_exp_data = FOREACH emp_with_exp GENERATE emp::emp_id, emp::emp_name; 



emp_with_exp_distinct_data = DISTINCT emp_with_exp_data; 



dump emp_with_exp_distinct_data;