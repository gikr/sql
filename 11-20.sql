--11) Find out the average speed of PCs. 
select avg(speed)
from PC;

--12) Find out the average speed of the laptops priced over $1000. 
select avg(speed)
from Laptop
where price > 1000;

--13) Find out the average speed of the PCs produced by maker A. 
Select avg(speed)
from PC
inner join Product as p on p.model = PC.model and p.maker = 'A';

--14) Get the makers who produce only one product type and more than one model.
select distinct maker, type
from Product
where maker in
(select maker 
from product
group by maker 
having count(distinct type) = 1 and count(model)>1);

--15) Get hard drive capacities that are identical for two or more PCs. 
Select hd 
from PC
group by hd
having count(hd) > 1;

--16) Get pairs of PC models with identical speeds and the same RAM capacity. 
select distinct p.model, c.model, p.speed, c.ram
from pc as p, pc as c
where p.model > c.model and p.speed = c.speed and p.ram = c.ram;

--17) Get the laptop models that have a speed smaller than the speed of any PC. 
Select distinct p.type,c.model, c.speed 
From product as p, laptop as c
Where c.speed <all(select speed 
From pc) and p.type = 'laptop';

--18) Find the makers of the cheapest color printers.
select p.maker, min(distinct pr.price)
from product as p 
inner join printer as pr
on p.model = pr.model and p.type = 'printer' and pr.color = 'y'
where pr.price in (select min(pp.price)
from printer as pp
where pp.color = 'y')
group by p.maker, pr.price;

--19) For each maker having models in the Laptop table, find out the average screen size of the laptops he produces. 
select p.maker, avg(l.screen)
from product as p
inner join laptop as l
on p.model = l.model
group by p.maker;

--20) Find the makers producing at least three distinct models of PCs.
Select p.maker, count(distinct p.model) as count_mod
from product as p
where p.type = 'pc'
group by p.maker
having count(distinct p.model)>=3;


