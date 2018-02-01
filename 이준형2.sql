HR@orcl> SELECT ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) "Minimum", ROUND(SUM
  2  (salary),0) "SUM", ROUND(AVG(salary),0) "Average"
  3  FROM employees;

   Maximum    Minimum        SUM    Average                                     
---------- ---------- ---------- ----------                                     
     24000       2500     204400       8887                                     

HR@orcl> SELECT job_id, ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) "Minimum", ROUND(SUM(salary),0) "SUM", ROUND(AVG(salary),0) "Average"
  2  FROM employees
  3  GROUP BY job_id;

JOB_ID        Maximum    Minimum        SUM    Average                          
---------- ---------- ---------- ---------- ----------                          
IT_PROG          9000       4200      19200       6400                          
AC_MGR          12000      12000      12000      12000                          
AC_ACCOUNT       8300       6900      15200       7600                          
ST_MAN           5800       5800       5800       5800                          
AD_ASST          4400       4400       4400       4400                          
AD_VP           17000      17000      34000      17000                          
SA_MAN          10500      10500      10500      10500                          
MK_MAN          13000      13000      13000      13000                          
AD_PRES         24000      24000      24000      24000                          
SA_REP          11000       7000      48600       9720                          
MK_REP           6000       6000       6000       6000                          

JOB_ID        Maximum    Minimum        SUM    Average                          
---------- ---------- ---------- ---------- ----------                          
ST_CLERK         3500       2500      11700       2925                          

12 rows selected.

HR@orcl> SELECT job_id, COUNT(*)
  2  FROM employees
  3  GROUP BY job_id;

JOB_ID       COUNT(*)                                                           
---------- ----------                                                           
AC_ACCOUNT          2                                                           
AC_MGR              1                                                           
AD_ASST             1                                                           
AD_PRES             1                                                           
AD_VP               2                                                           
IT_PROG             3                                                           
MK_MAN              1                                                           
MK_REP              1                                                           
SA_MAN              1                                                           
SA_REP              5                                                           
ST_CLERK            4                                                           

JOB_ID       COUNT(*)                                                           
---------- ----------                                                           
ST_MAN              1                                                           

12 rows selected.

HR@orcl> SELECT COUNT(DISTINCT manager_id) "Number of Managers"
  2  FROM employees;

Number of Managers                                                              
------------------                                                              
                 8                                                              

HR@orcl> SELECT MAX(salary) - MIN(salary) DIFFERENCE
  2  FROM employees;

DIFFERENCE                                                                      
----------                                                                      
     21500                                                                      

HR@orcl> SELECT manager_id, MIN(salary) FROM employees
  2  WHERE manager_id IS NOT NULL
  3  GROUP BY manager_id
  4  HAVING MIN(salary) > 6000
  5  ORDER BY MIN(salary) DESC;

MANAGER_ID MIN(SALARY)                                                          
---------- -----------                                                          
       102        9000                                                          
       149        7000                                                          
       205        6900                                                          

HR@orcl>  SELECT job_id "Job",  SUM(DECODE(department_id, 20, salary)) " Dept 20",
  2  				SUM(DECODE(department_id,50,salary)) "Dept 50",
  3  				SUM(DECODE(department_id,80,salary)) "Dept 80",
  4  				SUM(DECODE(department_id,90,salary)) "Dept 90",
  5  				SUM(salary) "Total"
  6  FROM employees
  7* GROUP BY job_id
HR@orcl> .
HR@orcl> /

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total               
---------- ---------- ---------- ---------- ---------- ----------               
IT_PROG                                                     19200               
AC_MGR                                                      12000               
AC_ACCOUNT                                                  15200               
ST_MAN                      5800                             5800               
AD_ASST                                                      4400               
AD_VP                                            34000      34000               
SA_MAN                                10500                 10500               
MK_MAN                                                      13000               
AD_PRES                                          24000      24000               
SA_REP                                19600                 48600               
MK_REP           6000                                        6000               

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total               
---------- ---------- ---------- ---------- ---------- ----------               
ST_CLERK                   11700                            11700               

12 rows selected.

HR@orcl> SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1995,1,0))"1995",
  2  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1996,1,0))"1996",
  3  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1997,1,0))"1997",
  4  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1998,1,0))"1998"
  5* FROM employees
HR@orcl> /

     TOTAL       1995       1996       1997       1998                          
---------- ---------- ---------- ---------- ----------                          
        23          1          2          2          3                          

HR@orcl> SELECT location_id, street_address, city, state_province, country_name
  2  FROM locations NATURAL JOIN countries;

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
       1400 2014 Jabberwocky Rd                                                 
Southlake                      Texas                                            
United States of America                                                        
                                                                                
       1500 2011 Interiors Blvd                                                 
South San Francisco            California                                       
United States of America                                                        

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
                                                                                
       1700 2004 Charade Rd                                                     
Seattle                        Washington                                       
United States of America                                                        
                                                                                
       1800 460 Bloor St. W.                                                    
Toronto                        Ontario                                          

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
Canada                                                                          
                                                                                
       2500 Magdalen Centre, The Oxford Science Park                            
Oxford                         Oxford                                           
United Kingdom                                                                  
                                                                                

HR@orcl> SELECT last_name, department_id, department_name
  2  FROM employees JOIN departments
  3  USING (department_id);

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                         
------------------------- ------------- ------------------------------          
Abel                                 80 Sales                                   
DEAN                                 60 IT                                      
Davies                               50 Shipping                                
De Haan                              90 Executive                               
Ernst                                60 IT                                      
Fay                                  20 Marketing                               
Gietz                               110 Accounting                              
Hartstein                            40 Human Resource                          
Higgins                             110 Accounting                              
Hunold                               60 IT                                      
King                                 90 Executive                               

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                         
------------------------- ------------- ------------------------------          
Kochhar                              90 Executive                               
Lorentz                              60 IT                                      
Matos                                50 Shipping                                
Mourgos                              50 Shipping                                
Popp                                110 Accounting                              
Rajs                                 50 Shipping                                
Raphealy                             60 IT                                      
Taylor                               80 Sales                                   
Vargas                               50 Shipping                                
Whalen                               10 Administration                          
Zlotkey                              80 Sales                                   

22 rows selected.

HR@orcl>  SELECT e.last_name, e.job_id, e.department_id, d.department_name
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN locations l
  5  ON (d.location_id = l.location_id)
  6* WHERE LOWER(l.city) = 'toronto'
HR@orcl> .
HR@orcl> /

LAST_NAME                 JOB_ID     DEPARTMENT_ID                              
------------------------- ---------- -------------                              
DEPARTMENT_NAME                                                                 
------------------------------                                                  
Fay                       MK_REP                20                              
Marketing                                                                       
                                                                                

HR@orcl> SELECT w.last_name "Employee", w.employee_id "EMP", m.last_name "Manager", m.employee_id "Mgr#"
  2  FROM employees w join employees m
  3* ON (w.manager_id = m.employee_id)
HR@orcl> /

Employee                         EMP Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Kochhar                          101 King                             100       
De Haan                          102 King                             100       
Hunold                           103 De Haan                          102       
Ernst                            104 Hunold                           103       
Lorentz                          107 Hunold                           103       
Mourgos                          124 King                             100       
Rajs                             141 Mourgos                          124       
Davies                           142 Mourgos                          124       
Matos                            143 Mourgos                          124       
Vargas                           144 Mourgos                          124       
Zlotkey                          149 King                             100       

Employee                         EMP Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Abel                             174 Zlotkey                          149       
Taylor                           176 Zlotkey                          149       
Grant                            178 Zlotkey                          149       
Whalen                           200 Kochhar                          101       
Hartstein                        201 King                             100       
Fay                              202 Hartstein                        201       
Higgins                          205 Kochhar                          101       
Gietz                            206 Higgins                          205       
Popp                             113 Higgins                          205       
Raphealy                         114 King                             100       

21 rows selected.

HR@orcl> save lab_06_04.sql
Created file lab_06_04.sql
HR@orcl> @ lab_06_04.sql

Employee                         EMP Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Kochhar                          101 King                             100       
De Haan                          102 King                             100       
Hunold                           103 De Haan                          102       
Ernst                            104 Hunold                           103       
Lorentz                          107 Hunold                           103       
Mourgos                          124 King                             100       
Rajs                             141 Mourgos                          124       
Davies                           142 Mourgos                          124       
Matos                            143 Mourgos                          124       
Vargas                           144 Mourgos                          124       
Zlotkey                          149 King                             100       

Employee                         EMP Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Abel                             174 Zlotkey                          149       
Taylor                           176 Zlotkey                          149       
Grant                            178 Zlotkey                          149       
Whalen                           200 Kochhar                          101       
Hartstein                        201 King                             100       
Fay                              202 Hartstein                        201       
Higgins                          205 Kochhar                          101       
Gietz                            206 Higgins                          205       
Popp                             113 Higgins                          205       
Raphealy                         114 King                             100       

21 rows selected.

HR@orcl> SELECT w.last_name "Employee", w.employee_id "EMP#", m.last_name "Manager",
  2  m.employee_id "Mgr#"
  3  FROM employees w LEFT OUTER JOIN employees m
  4  ON (w.manager_id = m.employee_id)
  5* ORDER BY 2
HR@orcl> /

Employee                        EMP# Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
King                             100                                            
Kochhar                          101 King                             100       
De Haan                          102 King                             100       
Hunold                           103 De Haan                          102       
Ernst                            104 Hunold                           103       
Lorentz                          107 Hunold                           103       
Popp                             113 Higgins                          205       
Raphealy                         114 King                             100       
Mourgos                          124 King                             100       
Rajs                             141 Mourgos                          124       
Davies                           142 Mourgos                          124       

Employee                        EMP# Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Matos                            143 Mourgos                          124       
Vargas                           144 Mourgos                          124       
Zlotkey                          149 King                             100       
Abel                             174 Zlotkey                          149       
Taylor                           176 Zlotkey                          149       
Grant                            178 Zlotkey                          149       
Whalen                           200 Kochhar                          101       
Hartstein                        201 King                             100       
Fay                              202 Hartstein                        201       
Higgins                          205 Kochhar                          101       
Gietz                            206 Higgins                          205       

22 rows selected.

HR@orcl> save lab_06_05.sql
Created file lab_06_05.sql
HR@orcl> @lab_06_05.sql

Employee                        EMP# Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
King                             100                                            
Kochhar                          101 King                             100       
De Haan                          102 King                             100       
Hunold                           103 De Haan                          102       
Ernst                            104 Hunold                           103       
Lorentz                          107 Hunold                           103       
Popp                             113 Higgins                          205       
Raphealy                         114 King                             100       
Mourgos                          124 King                             100       
Rajs                             141 Mourgos                          124       
Davies                           142 Mourgos                          124       

Employee                        EMP# Manager                         Mgr#       
------------------------- ---------- ------------------------- ----------       
Matos                            143 Mourgos                          124       
Vargas                           144 Mourgos                          124       
Zlotkey                          149 King                             100       
Abel                             174 Zlotkey                          149       
Taylor                           176 Zlotkey                          149       
Grant                            178 Zlotkey                          149       
Whalen                           200 Kochhar                          101       
Hartstein                        201 King                             100       
Fay                              202 Hartstein                        201       
Higgins                          205 Kochhar                          101       
Gietz                            206 Higgins                          205       

22 rows selected.

HR@orcl> SELECT e.department_id department, e.last_name employee, c.last_name colleague
  2  FROM employees e JOIN employees c
  3  ON (e.department_id = c.department_id)
  4  WHERE e.employee_id <> c.employee_id
  5  ORDER BY e.department_id, e.last_name, c.last_name;

DEPARTMENT EMPLOYEE                  COLLEAGUE                                  
---------- ------------------------- -------------------------                  
        50 Davies                    Matos                                      
        50 Davies                    Mourgos                                    
        50 Davies                    Rajs                                       
        50 Davies                    Vargas                                     
        50 Matos                     Davies                                     
        50 Matos                     Mourgos                                    
        50 Matos                     Rajs                                       
        50 Matos                     Vargas                                     
        50 Mourgos                   Davies                                     
        50 Mourgos                   Matos                                      
        50 Mourgos                   Rajs                                       

DEPARTMENT EMPLOYEE                  COLLEAGUE                                  
---------- ------------------------- -------------------------                  
        50 Mourgos                   Vargas                                     
        50 Rajs                      Davies                                     
        50 Rajs                      Matos                                      
        50 Rajs                      Mourgos                                    
        50 Rajs                      Vargas                                     
        50 Vargas                    Davies                                     
        50 Vargas                    Matos                                      
        50 Vargas                    Mourgos                                    
        50 Vargas                    Rajs                                       
        60 Ernst                     Hunold                                     
        60 Ernst                     Lorentz                                    

DEPARTMENT EMPLOYEE                  COLLEAGUE                                  
---------- ------------------------- -------------------------                  
        60 Ernst                     Raphealy                                   
        60 Hunold                    Ernst                                      
        60 Hunold                    Lorentz                                    
        60 Hunold                    Raphealy                                   
        60 Lorentz                   Ernst                                      
        60 Lorentz                   Hunold                                     
        60 Lorentz                   Raphealy                                   
        60 Raphealy                  Ernst                                      
        60 Raphealy                  Hunold                                     
        60 Raphealy                  Lorentz                                    
        80 Abel                      Taylor                                     

DEPARTMENT EMPLOYEE                  COLLEAGUE                                  
---------- ------------------------- -------------------------                  
        80 Abel                      Zlotkey                                    
        80 Taylor                    Abel                                       
        80 Taylor                    Zlotkey                                    
        80 Zlotkey                   Abel                                       
        80 Zlotkey                   Taylor                                     
        90 De Haan                   King                                       
        90 De Haan                   Kochhar                                    
        90 King                      De Haan                                    
        90 King                      Kochhar                                    
        90 Kochhar                   De Haan                                    
        90 Kochhar                   King                                       

DEPARTMENT EMPLOYEE                  COLLEAGUE                                  
---------- ------------------------- -------------------------                  
       110 Gietz                     Higgins                                    
       110 Gietz                     Popp                                       
       110 Higgins                   Gietz                                      
       110 Higgins                   Popp                                       
       110 Popp                      Gietz                                      
       110 Popp                      Higgins                                    

50 rows selected.

HR@orcl> DESC JOB_GRADES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 GRADE_LEVEL                                        VARCHAR2(3)
 LOWEST_SAL                                         NUMBER
 HIGHEST_SAL                                        NUMBER

HR@orcl> SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN job_grades j
  5  ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Vargas                    ST_CLERK   Shipping                             2625  
A                                                                               
                                                                                
Matos                     ST_CLERK   Shipping                             2730  
A                                                                               
                                                                                
Davies                    ST_CLERK   Shipping                             3255  
B                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Rajs                      ST_CLERK   Shipping                             3675  
B                                                                               
                                                                                
Lorentz                   IT_PROG    IT                                   4410  
B                                                                               
                                                                                
Whalen                    AD_ASST    Administration                       4620  
B                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Mourgos                   ST_MAN     Shipping                             6090  
C                                                                               
                                                                                
Fay                       MK_REP     Marketing                            6300  
C                                                                               
                                                                                
Ernst                     IT_PROG    IT                                   6300  
C                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Popp                      AC_ACCOUNT Accounting                           7245  
C                                                                               
                                                                                
Gietz                     AC_ACCOUNT Accounting                           8715  
C                                                                               
                                                                                
Hunold                    IT_PROG    IT                                   9450  
C                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Taylor                    SA_REP     Sales                                9933  
C                                                                               
                                                                                
Raphealy                  SA_REP     IT                                  11550  
D                                                                               
                                                                                
Zlotkey                   SA_MAN     Sales                             12127.5  
D                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
Higgins                   AC_MGR     Accounting                          12600  
D                                                                               
                                                                                
Abel                      SA_REP     Sales                               12705  
D                                                                               
                                                                                
Hartstein                 MK_MAN     Human Resource                      13650  
D                                                                               
                                                                                

LAST_NAME                 JOB_ID     DEPARTMENT_NAME                    SALARY  
------------------------- ---------- ------------------------------ ----------  
GRA                                                                             
---                                                                             
De Haan                   AD_VP      Executive                           17850  
E                                                                               
                                                                                
Kochhar                   AD_VP      Executive                           17850  
E                                                                               
                                                                                
King                      AD_PRES    Executive                           25200  
F                                                                               
                                                                                

21 rows selected.

HR@orcl> SELECT last_name, hire_date
  2  FROM employees
  3  WHERE department_id = (SELECT department_id FROM employees
  4  				WHERE last_name = 'Zlotkey')
  5  AND last_name <> 'Zlotkey';

LAST_NAME                 HIRE_DATE                                             
------------------------- ---------                                             
Abel                      11-MAY-96                                             
Taylor                    24-MAY-95                                             

HR@orcl> SELECT employee_id, last_name FROM employees
  2  WHERE salary > (SELECT AVG(salary) FROM employees)
  3  ORDER BY salary;

EMPLOYEE_ID LAST_NAME                                                           
----------- -------------------------                                           
        103 Hunold                                                              
        176 Taylor                                                              
        114 Raphealy                                                            
        149 Zlotkey                                                             
        205 Higgins                                                             
        174 Abel                                                                
        201 Hartstein                                                           
        101 Kochhar                                                             
        102 De Haan                                                             
        100 King                                                                

10 rows selected.

HR@orcl> SELECT employee_id, last_name
  2  FROM employees
  3  WHERE department_id IN (SELECT department_id FROM employees
  4  			WHERE last_name like '%u%');

EMPLOYEE_ID LAST_NAME                                                           
----------- -------------------------                                           
        124 Mourgos                                                             
        141 Rajs                                                                
        142 Davies                                                              
        143 Matos                                                               
        144 Vargas                                                              
        103 Hunold                                                              
        104 Ernst                                                               
        107 Lorentz                                                             
        114 Raphealy                                                            

9 rows selected.

HR@orcl> SELECT last_name, department_id, job_id FROM employees
  2  WHERE department_id IN (SELECT department_id FROM departments
  3  						WHERE location_id = 1700);

LAST_NAME                 DEPARTMENT_ID JOB_ID                                  
------------------------- ------------- ----------                              
King                                 90 AD_PRES                                 
Kochhar                              90 AD_VP                                   
De Haan                              90 AD_VP                                   
Whalen                               10 AD_ASST                                 
Higgins                             110 AC_MGR                                  
Gietz                               110 AC_ACCOUNT                              
Popp                                110 AC_ACCOUNT                              

7 rows selected.

HR@orcl>  SELECT last_name, salary
  2  FROM employees
  3  WHERE manager_id = (SELECT employee_id FROM employees
  4* 			WHERE last_name = 'King')
HR@orcl> /

LAST_NAME                     SALARY                                            
------------------------- ----------                                            
Kochhar                        17850                                            
De Haan                        17850                                            
Mourgos                         6090                                            
Zlotkey                      12127.5                                            
Hartstein                      13650                                            
Raphealy                       11550                                            

6 rows selected.

HR@orcl> SELECT department_id, last_name, job_id
  2  FROM employees
  3  WHERE department_id IN (SELECT department_id FROM departments
  4  				WHERE department_name = 'Executive');

DEPARTMENT_ID LAST_NAME                 JOB_ID                                  
------------- ------------------------- ----------                              
           90 King                      AD_PRES                                 
           90 Kochhar                   AD_VP                                   
           90 De Haan                   AD_VP                                   

HR@orcl> SELECT employee_id, last_name, salary
  2  FROM employees
  3  WHERE department_id IN (SELECT department_id FROM employees
  4  			WHERE last_name like '%u%')
  5* AND salary > (SELECT AVG(salary) FROM employees)
HR@orcl> /

EMPLOYEE_ID LAST_NAME                     SALARY                                
----------- ------------------------- ----------                                
        103 Hunold                          9450                                
        114 Raphealy                       11550                                

HR@orcl> SELECT department_id FROM departments
  2  MINUS
  3  SELECT department_id FROM employees
  4  WHERE job_id = 'ST_CLERK';

DEPARTMENT_ID                                                                   
-------------                                                                   
           10                                                                   
           20                                                                   
           30                                                                   
           40                                                                   
           60                                                                   
           70                                                                   
           80                                                                   
           90                                                                   
          100                                                                   
          110                                                                   
          190                                                                   

DEPARTMENT_ID                                                                   
-------------                                                                   
          200                                                                   

12 rows selected.

HR@orcl> SELECT country_id,country_name FROM countries
  2  MINUS
  3  SELECT l.country_id,c.country_name FROM locations l, countries c
  4  WHERE l.country_id = c.country_id;

CO COUNTRY_NAME                                                                 
-- ----------------------------------------                                     
DE Germany                                                                      

HR@orcl> COLUMN dummy NOPRINT
HR@orcl> SELECT job_id, department_id, 'x' dummy FROM employees
  2  WHERE department_id = 10
  3  UNION
  4  SELECT job_id, department_id, 'y' FROM employees
  5  WHERE department_id = 50
  6  UNION
  7  SELECT job_id, department_id, 'z' FROM employees
  8  WHERE department_id = 20
  9* ORDER BY 3
HR@orcl> /

JOB_ID     DEPARTMENT_ID                                                        
---------- -------------                                                        
AD_ASST               10                                                        
ST_CLERK              50                                                        
ST_MAN                50                                                        
MK_REP                20                                                        

HR@orcl> COLUMM dummy PRINT
SP2-0734: unknown command beginning "COLUMM dum..." - rest of line ignored.
HR@orcl> COLUMN dummy PRINT
HR@orcl> SELECT employee_id, job_id FROM employees
  2  INTERSECT
  3  SELECT employee_id, job_id FROM job_history;

EMPLOYEE_ID JOB_ID                                                              
----------- ----------                                                          
        176 SA_REP                                                              
        200 AD_ASST                                                             

HR@orcl> SELECT last_name, department_id, TO_CHAR(null) FROM employees
  2  UNION
  3  SELECT TO_CHAR(null), department_id, department_name FROM departments;

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                           
------------------------- ------------- ------------------------------          
Abel                                 80                                         
Davies                               50                                         
De Haan                              90                                         
Ernst                                60                                         
Fay                                  20                                         
Gietz                               110                                         
Grant                                                                           
Hartstein                            40                                         
Higgins                             110                                         
Hunold                               60                                         
King                                 90                                         

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                           
------------------------- ------------- ------------------------------          
Kochhar                              90                                         
Lorentz                              60                                         
Matos                                50                                         
Mourgos                              50                                         
Popp                                110                                         
Rajs                                 50                                         
Raphealy                             60                                         
Taylor                               80                                         
Vargas                               50                                         
Whalen                               10                                         
Zlotkey                              80                                         

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                           
------------------------- ------------- ------------------------------          
                                     10 Administration                          
                                     20 Marketing                               
                                     30 Purchasing                              
                                     40 Human Resource                          
                                     50 Shipping                                
                                     60 IT                                      
                                     70 Public Relations                        
                                     80 Sales                                   
                                     90 Executive                               
                                    100 Finance                                 
                                    110 Accounting                              

LAST_NAME                 DEPARTMENT_ID TO_CHAR(NULL)                           
------------------------- ------------- ------------------------------          
                                    190 Contracting                             
                                    200 Support                                 

35 rows selected.




