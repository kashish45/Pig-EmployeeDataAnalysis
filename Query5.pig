/*List of employees (employee id and employee name) having no entry in employee_expenses file. */

emp = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int);

emp_expenses = LOAD 'employee_expenses.txt' AS (emp_id:int, expenses:int);

emp_without_exp = JOIN emp BY emp_id LEFT OUTER, emp_expenses BY emp_id;

 emp_without_exp_filter = FILTER emp_without_exp BY emp_expenses::emp_id is null;


 emp_without_exp_filter_data = FOREACH emp_without_exp_filter GENERATE emp::emp_id, emp::emp_name; 

DUMP emp_without_exp_filter_data; 
