SELECT ci.city_name,pr.product_name,round(sum(ii.line_total_price),2)
as tot from city ci,customer cu, invoice i, invoice_item ii, product pr where ci.id=cu.city_id and cu.id = i.customer_id and i.id = ii.invoice_id and ii.product_id =pr.id
group by ci.city_name,pr.product_name
order by tot desc, ci.city_name, pr.product_name;

SELECT co.country_name,count(*),avg(i.total_price)
from country co,city ci, customer cu, invoice i
WHERE co.id= ci.country_id and ci.id=cu.city_id and cu.id=i.customer_id
group BY co.country_name
having avg(i.total_price) > (select avg(total_price)from invoice)
