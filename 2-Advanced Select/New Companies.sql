--Company  : CO
--Lead_Manager  : LM
--Senior_Manager  : SM
--Manager  : MA
--Employee  : EP

SELECT CO.company_code, CO.founder, COUNT(DISTINCT LM.lead_manager_code), 
       COUNT(DISTINCT SM.senior_manager_code), COUNT(DISTINCT MA.manager_code), 
       COUNT(DISTINCT EP.employee_code)
       
FROM Company AS CO JOIN Lead_Manager AS LM
        ON CO.company_code = LM.company_code
    JOIN Senior_Manager AS SM 
        ON CO.company_code = SM.company_code
    JOIN Manager AS MA
        ON CO.company_code = MA.company_code
    JOIN Employee AS EP
        ON CO.company_code = EP.company_code
        
GROUP BY CO.company_code, CO.founder
ORDER BY CO.company_code;