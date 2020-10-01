/*
Employee (employee id and employee name) with maximum expense 
(In case two employees have same expense, employee with name coming first in dictionary should get preference) 
*/

emp = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int);
empexpense = LOAD 'employee_expenses.txt' USING PigStorage(',') AS (emp_id:int, emp_expense:int);

Joinempempexpense = join emp by emp_id,empexpense by emp_id;
maxexpense = ORDER Joinempempexpense by empexpense::emp_expense desc;

Limitmaxepnse = LIMIT maxexpense 1;
Limitmaxexpensefinal = foreach Limitmaxepnse generate emp::emp_id,emp::emp_name;

dump Limitmaxexpensefinal;