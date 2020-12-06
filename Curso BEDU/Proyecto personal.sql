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
select ipart.part_num,quantity as "cantidad de partes",sets.name as "nombre del set", themes.name as "Temática"
from inventory_parts as ipart 
join inventories as inv on ipart.inventory_id=inv.id
join sets  on inv.set_num=sets.set_num
join themes on sets.theme_id=themes.id
where ipart.quantity>2;
/* Obtén todos los sets que pertenezcan a un año de su elección y el número de 
sets disponibles (los elementos no existentes tambien deben aparecer */
select name,year,quantity from sets 
left join inventory_sets as isets on sets.set_num=isets.set_num
where year>2000 order by year;
/*Suponga que el promedio del costo de todas las piezas es 5 pesos, 
calcule el dinero que se tiene equivalente en la tabla inventory parts*/
Select sum(quantity) as "total de partes",sum(quantity)*5 as "total en dinero" from inventory_parts;
/*De igual forma obtén el costo de cada set, es importante desplegar el nombre de los sets */
Select sets.name, sum(quantity)*5 from inventory_sets 
join sets on sets.set_num=inventory_sets.inventory_id
group by name;
-- Identifica las categorías más costosas (top 10) tomando en cuenta que cada parte tiene un costo de 5 pesos --
