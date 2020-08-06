/* tranche 1 */
/* q1 */
select * from customers where creditLimit > 20000

/* q2 */
select * from customers where creditLimit > 20000 and country = "USA"

/* q3 */
select * from customers where customerName like "%gift%"

/* q4 */
select * from customers where country="France" or (country="USA" and creditLimit < 20000)

/* q5 */
select customerNumber, customerName, salesRepEmployeeNumber, 
employees.firstName, employees.lastName 
from customers join employees 
on customers.salesRepEmployeeNumber = employees.employeeNumber

/* alternatively */
select customerNumber, customerName, salesRepEmployeeNumber, 
employees.firstName as "sales_rep_first_name", employees.lastName as "sales_rep_last_name"
from customers join employees 
on customers.salesRepEmployeeNumber = employees.employeeNumber

/* tranche 2 */
/* q1 */
select * from products where productVendor = "Welly Diecast Productions";

/* q2 */
select * from products where productName like "%car%"

select * from products where productName REGEXP "[[:<:]]car[[:>:]]"

select * from products where productName like "% car %" OR
productName like "% car" OR productName like "car %"

/* q3 */
select * from products where buyPrice >=50 and buyPrice <= 80

/* q4 */
select * from products where (productName like "%car%") and (buyPrice >= 50 and buyPrice <=80)

/* q5 */
select * from products where quantityInStock >= 7000 and buyPrice <= 50;

/* tranch 3 */
/* q1 */
SELECT * FROM payments where year(paymentDate) = '2004' and month(paymentDate)='6';
SELECT * FROM payments where paymentDate >= "2004-06-01" and paymentDate < "2004-07-01";

/* q2 */
select SUM(amount) from payments where paymentDate between '2004-06-01' and '2005-03-31';
select sum(amount) from payments where paymentDate >= '2004-06-01' and paymentDate <='2005-03-31';

/* q3 */
select distinct contactFirstName, contactLastName from customers 
join orders on orders.customerNumber = customers.customerNumber
where year(orderDate) = '2005'

/* q4 */
select distinct customerName from customers join payments on
customers.customerNumber = payments.customerNumber
where year(now()) - year(payments.paymentDate) >= 15 

/* q5 */
select country, sum(amount) from customers join payments 
on customers.customerNumber = payments.customerNumber
group by country
order by sum(amount) desc

/* q6 */
select customerName, payments.customerNumber from customers join payments on 
payments.customernumber = customers.customerNumber
group by payments.customerNumber
having sum(amount) > 20000

/* q7 */
select customerName, payments.customerNumber, sum(amount) from customers join payments on 
payments.customernumber = customers.customerNumber
group by payments.customerNumber
order by sum(amount) desc
limit 3

/* q8 */
select sum(amount), employeeNumber, firstName, lastName
from payments join customers 
	on payments.customerNumber = customers.customerNumber
join employees 
	on employees.employeeNumber = customers.salesRepEmployeeNumber
group by employeeNumber
order by sum(amount) desc
limit 3
	
/* q9 */
select products.productCode, productName, sum(quantityOrdered) from products 
join orderdetails 
	on products.productCode = orderdetails.productCode
group by products.productCode
order by sum(quantityOrdered) asc
limit 3