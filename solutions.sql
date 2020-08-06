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