-- Viewing All Dataset

SELECT *
FROM BankLoanData



-- Number of Total Loan Applications

SELECT COUNT(id) AS TotalLoanApplications
FROM BankLoanData


-- Number of Month to Date Loan Applictions (MTD)

SELECT COUNT(id) AS MTD_LoanApplications
FROM BankLoanData
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021




-- Number of Month to Month Loan Applictions (MTM)

SELECT COUNT(id) AS MTM_LoanApplications
FROM BankLoanData
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021





-- Total Funded Amount

SELECT SUM(loan_amount) AS TotalFundedAmount
FROM BankLoanData




-- Total Month to Date Funded Amount(MTD)
SELECT SUM(loan_amount) AS MTD_FundedAmount
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021



-- Total Month to Month Funded Amount(MTM)

SELECT SUM(loan_amount) AS MTM_FundedAmount
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



-- Total Recieved Amount

SELECT SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData




-- Total Month to Date Recieved Amount (MTD)

SELECT SUM(total_payment) AS MTD_RecievedAmount
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021



-- Total Month to Month Recieved Amount (MTM)

SELECT SUM(total_payment) AS MTM_RecievedAmount
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



-- Average Overall Interest Rate 

SELECT ROUND(AVG(int_rate), 4)*100 AS AverageInterestRate
FROM BankLoanData




-- Average Month to Date Interest Rate

SELECT ROUND(AVG(int_rate), 4)*100 AS MTD_InterestRate
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021




-- Average Month to Month Interest Rate

SELECT ROUND(AVG(int_rate), 4)*100 AS MTM_InterestRate
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



--Average Overall Date to Income (DTI)

SELECT ROUND(AVG(dti), 4)*100 AS AverageDTI
FROM BankLoanData


--Average Month to Date DTI

SELECT ROUND(AVG(dti), 4)*100 AS Average_MTD_DTI
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021




--Average Month to Month DTI

SELECT ROUND(AVG(dti), 4)*100 AS Average_MTM_DTI
FROM BankLoanData
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


-- Good Loan Applications Percentage

SELECT
      COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN 1 END)*100
	  /
	  COUNT(id) AS GoodLoanPercentage
FROM BankLoanData




-- Good Loan Applications

SELECT COUNT(ID) AS GoodLoanApplications
FROM BankLoanData
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'



-- Good Loan Funded Amount

SELECT SUM(loan_amount) AS GoodLoanFundedAmount
FROM BankLoanData
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'




-- Good Loan Recieved Amount

SELECT SUM(total_payment) AS GoodLoanRecievedAmount
FROM BankLoanData
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'










-- Bad Loan Applications Percentage

SELECT
      COUNT(CASE WHEN loan_status = 'Charged off' THEN 1 END)*100
	  /
	  COUNT(id) AS BadLoanPercentage
FROM BankLoanData




-- Bad Loan Applications

SELECT COUNT(ID) AS BadLoanApplications
FROM BankLoanData
WHERE loan_status = 'Charged off'



-- Bad Loan Funded Amount

SELECT SUM(loan_amount) AS BadLoanFundedAmount
FROM BankLoanData
WHERE loan_status = 'Charged off'




-- Bad Loan Recieved Amount

SELECT SUM(total_payment) AS BadLoanRecievedAmount
FROM BankLoanData
WHERE loan_status = 'Charged off'





-- Loan Status Grid View

SELECT 
       loan_status,
	   COUNT(id) AS TotalLoanApplications,
	   SUM(loan_amount) AS TotalFundedAmount,
	   SUM(total_payment) AS TotalRecievedAmount,
	   AVG(int_rate)*100 AS AverageInterestRate,
	   AVG(dti)*100 AS AverageDTI
FROM BankLoanData
GROUP BY loan_status



SELECT 
       loan_status,
	   SUM(loan_amount) AS MTD_FundedAmount,
	   SUM(total_payment) AS MTD_RecievedAmount
FROM BankLoanData
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status




-- Bank Loan Overview Report



-- Monthly Trends by Issue Date 

SELECT
      DATENAME(MONTH, issue_date) AS 'Month',
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY DATENAME(MONTH, issue_date), MONTH(issue_date)
ORDER BY MONTH(issue_date)




-- Regional Analysis by State 

SELECT
      address_state,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY address_state
ORDER BY address_state




-- Loan Term Analysis 

SELECT
      term,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY term
ORDER BY term





-- Employee Length Analysis 

SELECT
      emp_length,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY emp_length
ORDER BY COUNT(id) DESC





-- Loan Purpose Breakdown 

SELECT
      purpose,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY purpose
ORDER BY COUNT(id) DESC





-- Home Ownership Analysis 

SELECT
      home_ownership,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
GROUP BY home_ownership
ORDER BY COUNT(id) DESC





-- Details

SELECT
      home_ownership,
	  COUNT(id) AS TotalLoanApplications,
	  SUM(loan_amount) AS TotalLoanAmpint,
	  SUM(total_payment) AS TotalRecievedAmount
FROM BankLoanData
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC