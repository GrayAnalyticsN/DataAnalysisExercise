select * from inv_item;

select * from inv_item_price;

select * from inv_item_stock;

select * from inv_stockroom;

select it.has_physical_inventory, avg(itp.price) 'Average Price'
from inv_item it
join inv_item_price itp on itp.item_id = it.item_id
group by it.has_physical_inventory; -- Answer to question 1

select stk.name, sum(its.quantity) 'Total Inventory'
from inv_item_stock its
join inv_stockroom stk on stk.stockroom_id = its.stockroom_id
group by stk.name
order by `Total Inventory` desc; -- Answer to question 2

SELECT date_created, date_changed, TIMESTAMPDIFF(MINUTE, STR_TO_DATE(date_created, '%m/%d/%Y %H:%i'), STR_TO_DATE(date_changed, '%m/%d/%Y %H:%i')) AS time_in_minutes
FROM inv_item_price
order by `time_in_minutes` desc; -- Answer to question 3

select * from inv_item
where minimum_quantity >0; -- Answer to question 4

select it.name, it.date_created, it.date_changed, TIMESTAMPDIFF(MINUTE, STR_TO_DATE(it.date_created, '%m/%d/%Y %H:%i'), STR_TO_DATE(it.date_changed, '%m/%d/%Y %H:%i')) AS time_in_minutes, its.item_id, its.quantity
from inv_item it
join inv_item_stock its on its.item_id = it.item_id
where its.quantity = 0; -- Answer to question 5
