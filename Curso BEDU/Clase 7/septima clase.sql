drop database if exists nombredelatabla;
create database if not exists nombredelatabla;

use LuisCastro;

SELECT * FROM LuisCastro.ratings;

select * from users where Occupation = 20;

delete from users where Occupation =20;

insert into users (`UserID`,`Gender`,`Age`,`Occupation`,`Zip-code`)
values(7000,"m",18,0,45060);
# consultar registro
select * from users where Zip-Code