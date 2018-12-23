-- 1) Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
SELECT model, speed, hd FROM PC
WHERE price < 500;

--2) List all printer makers. 
SELECT DISTINCT maker
FROM product
where type = 'Printer';

--3) Find the model number, RAM and screen size of the laptops with prices over $1000. 
SELECT model, ram, screen FROM Laptop
WHERE price > 1000;

--4) Find all records from the Printer table containing data about color printers. 
SELECT * FROM Printer
WHERE color = 'y';

--5) Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive. 
SELECT model, speed, hd FROM PC
WHERE price < 600 AND
 cd IN ('12x','24x');

--6) For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops.
select maker, speed
from product
inner join laptop
on product.model = laptop.model
where laptop.hd >= 10
group by maker, speed;

--7) Get the models and prices for all commercially available products (of any type) produced by maker B. 
select a.model, price
from (select model, price
from PC
union
select model, price
from Laptop
union
select model, price
from Printer) as a join 
Product as p on a.model = p.model
where p.maker = 'B';


--8) Find the makers producing PCs but not laptops. 
select maker
from Product
where type = 'PC'
except(
select maker
from Product
where type = 'PC'
intersect 
select maker
from Product
where type = 'Laptop')

--9) Find the makers of PCs with a processor speed of 450 MHz or more.
select distinct maker
from Product 
inner join PC on PC.model = Product.model and PC.speed >= 450;

--10) Find the printer models having the highest price.
select model, price
from Printer
where price = (select max(price)
from Printer)



