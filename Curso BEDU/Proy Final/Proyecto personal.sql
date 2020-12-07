use LuisCastro;
show tables;
describe parts;
-- De la tabla de partes obtén el nombre y la categoría de cada parte a la cual pertenecen--
select part.name as "Nombre parte",pc.name as "categoria" from parts as part 
join part_categories as pc on part.part_cat_id = pc.id order by categoria;
-- Del inventario de sets, obtén el nombre, el año y el tema de cada set--
select sets.name as "Nombre del set", themes.name as "Tematica" from inventory_sets as iset 
join sets on iset.set_num=sets.set_num join themes on sets.theme_id= themes.id order by "Nombre del set" desc;
-- De la tabla de colores cuenta cuantos colores son transparentes y cuantos no lo son--
select count(name) as "total de piezas",is_trans from colors group by is_trans;
-- De la tabla inventarios en existencia (mayor a 2) obtén el nombre de los sets y a qué temática pertenecen--
select ipart.part_num,quantity as "cantidad de sets",sets.name as "nombre del set", themes.name as "Temática",sets.year as año
from inventory_parts as ipart 
join inventories as inv on ipart.inventory_id=inv.id
join sets  on inv.set_num=sets.set_num
join themes on sets.theme_id=themes.id
where ipart.quantity>2;
/*Del inventario de partes, obtenga el color de la parte, el rango rgb, la cantidad en stock y si se vende por separado.*/
select quantity,is_spare,name,rgb from inventory_parts ip
join colors col on ip.color_id=col.id;
/*Obten las cantidades de sets disponibles, primero ordenando por año del más antiguo al más moderno y después por cantidad.*/
select name,year,quantity from sets
join inventory_sets iset on sets.set_num=iset.set_num order by year,quantity desc;
/*De las categorías de partes realiza un conteo de cuantas partes pertenecen a cada categoría*/
select pc.name,count(part.name) from parts as part 
join part_categories as pc on part.part_cat_id = pc.id group by pc.name order by count(part.name) desc;
/*Consulta de qué set son todas las piezas que se venden por separado y ordénalas de mayor a menor*/
select count(part_num) from inventory_parts ip 
join inventories inv on ip.inventory_id=inv.id
join sets on inv.set_num=sets.set_num
where is_spare="t"
group by name;
/*Consulta de qué set son todas las piezas que no se venden por separado y ordénalas de mayor a menor*/
select count(part_num) from inventory_parts ip 
join inventories inv on ip.inventory_id=inv.id
join sets on inv.set_num=sets.set_num
where is_spare="f"
group by name;
/*Crea una consulta empezando por la tabla partes de inventarios que incluya, el numero de parte, la cantidad, 
si se vende suelta, el color, el rgb, si es transparente, el set al que pertenece, el año del set y la temática.*/
select part_num,quantity,is_spare,version,sets.name,year,themes.name,col.name,rgb,is_trans from inventory_parts ip
join inventories inv on ip.inventory_id=inv.id
join sets on inv.set_num=sets.set_num
join themes on sets.theme_id= themes.id
join colors col on ip.color_id=col.id;
/* convierte 5 de las consultas anteriores en vistas*/
create view vista1 as (
select part.name as "Nombre parte",pc.name as "categoria" from parts as part 
join part_categories as pc on part.part_cat_id = pc.id order by categoria);

create view vista2 as (
select count(name) as "total de piezas",is_trans from colors group by is_trans);

create view vista3 as (
select quantity,is_spare,name,rgb from inventory_parts ip
join colors col on ip.color_id=col.id);

create view vista4 as (
select pc.name,count(part.name) from parts as part 
join part_categories as pc on part.part_cat_id = pc.id group by pc.name order by count(part.name) desc);

create view vista5 as (
select count(part_num) from inventory_parts ip 
join inventories inv on ip.inventory_id=inv.id
join sets on inv.set_num=sets.set_num
where is_spare="f"
group by name);