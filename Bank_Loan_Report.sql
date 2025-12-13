use [Bank Loan DB];
select * from bank_loan_data;

select count(id) as Total_Loan_Applications from bank_loan_data;

select count(id) as MTD_Total_Loan_Applications from bank_loan_data where MONTH(issue_date)=12;

select count(id) as PMTD_Total_Loan_Applications from bank_loan_data where MONTH(issue_date)=11;

select sum(loan_amount) as Total_Funded_Amount from bank_loan_data;

select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=12;

select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=11;

select sum(total_payment) as Total_Amount_Collected from bank_loan_data;

select sum(total_payment) as MTD_Total_Amount_Collected from bank_loan_data where month(issue_date)=12;

select sum(total_payment) as PMTD_Total_Amount_Collected from bank_loan_data where month(issue_date)=11;

select avg(int_rate)*100 as Average_Interest_Rate from bank_loan_data;

select avg(int_rate)*100 as MTD_Average_Interest_Rate from bank_loan_data where month(issue_date)=12;

select avg(int_rate)*100 as PMTD_Average_Interest_Rate from bank_loan_data where month(issue_date)=11;

select avg(dti)*100 as Average_Debt_to_Income from bank_loan_data;

select avg(dti)*100 as MTD_Average_Debt_to_Income from bank_loan_data where month(issue_date)=12;

select avg(dti)*100 as PMTD_Average_Debt_to_Income from bank_loan_data where month(issue_date)=11;

select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100.0)/count(id) as Good_Loan_Percentage from bank_loan_data;\

select count(id) as Good_Loan_Applications from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';

select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';

select sum(total_payment) as Good_Loan_Amount_Received from bank_loan_data where loan_status='Fully Paid' or loan_status='Current';

select (count(case when loan_status='Charged Off' then id end)*100.0)/count(id) as Bad_Loan_Percentage from bank_loan_data;

select count(id) as Bad_Loan_Applications from bank_loan_data where loan_status='Charged Off';

select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data where loan_status='Charged Off';

select sum(total_payment) as Bad_Loan_Amount_Received from bank_loan_data where loan_status='Charged Off';

SELECT loan_status, 
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
FROM bank_loan_data GROUP BY loan_status;

SELECT loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data WHERE MONTH(issue_date) = 12 GROUP BY loan_status;

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date) ORDER BY MONTH(issue_date);

SELECT address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data GROUP BY address_state ORDER BY address_state;

SELECT term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data GROUP BY term ORDER BY term;

SELECT emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data GROUP BY emp_length ORDER BY emp_length;

select purpose as Purpose,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received 
from bank_loan_data group by purpose order by purpose;

SELECT home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data GROUP BY home_ownership ORDER BY home_ownership;







