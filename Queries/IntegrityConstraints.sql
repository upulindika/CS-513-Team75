
-- Checks for the foreign key violations and deleting those records

select distinct menu_id from cleaned_menupage where menu_id not in (select id from cleaned_menu)

delete from cleaned_menupage where menu_id in (select distinct menu_id from cleaned_menupage where menu_id not in (select id from cleaned_menu))

select distinct dish_id from cleaned_menuitem where dish_id not in (select id from cleaned_dish)
and dish_id <>''

select distinct menu_page_id from cleaned_menuitem where menu_page_id not in (select id from cleaned_menupage)

delete from cleaned_menuitem where dish_id  in (select dish_id from cleaned_menuitem where dish_id not in (select id from cleaned_dish))

delete from cleaned_menuitem where menu_page_id in (select distinct menu_page_id from cleaned_menuitem where menu_page_id not in (select id from cleaned_menupage))



-- Checks for cleaned_dish

select * from cleaned_dish where id is NULL;

select * from cleaned_dish where menus_appeared is NULL or times_appeared is NULL;

select * from cleaned_dish where cast(first_appeared as year) > cast(last_appeared as year) and last_appeared <> '0';

select * from cleaned_dish where lowest_price > highest_price;

select * from cleaned_dish where (lowest_price is NULL) or (highest_price is NULL);

select count(*) from cleaned_dish where (lowest_price is  NULL or  lowest_price ='') or (highest_price is  NULL or highest_price ='')
--29101 rows should be deleted

select count(*) from cleaned_dish where (substr(first_appeared,1,4) not between '1851' and '2012') or (substr(last_appeared,1,4) not between '1851' and '2012')
--59926

select id, count(id) as cnt
from cleaned_dish
group by id
having count(id)  > 1


-- Checks for cleaned_menu

select id, count(id) as cnt
from cleaned_menu
group by id
having count(id)  > 1;

select * from cleaned_menu where id is NULL;

select * from cleaned_menu where sponsor is 'NULL' or '';

select * from cleaned_menu where page_count is 'NULL' or '';



-- Checks for cleaned_menupage

select * from cleaned_menupage where id is NULL;

select * from cleaned_menupage where page_number  = '0';

select * from cleaned_menupage where page_number  is NULL;

select * from cleaned_menupage where created_at > updated_at;

select id, count(id) as cnt
from cleaned_menupage
group by id
having count(id)  > 1;


-- Checks for cleaned_menuitem

select * from cleaned_menuitem where id is NULL;

select * from cleaned_menuitem where updated_at < created_at;

select * from cleaned_menuitem where xpos < 0 and xpos > 1;

select * from cleaned_menuitem where ypos < 0 and ypos > 1;

select id, count(id) as cnt
from cleaned_menuitem
group by id
having count(id)  > 1;

