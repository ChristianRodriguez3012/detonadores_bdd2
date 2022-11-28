select  * from film
select  * from "generador2"
create or replace function cost_trigger() returns Trigger
as 
$$
begin 	
insert into "generador2" values (old.film_id, old.replacement_cost, old.last_update);	
return new;
End
$$
Language plpgsql;
create trigger film_update before update on film 
for each row 
execute procedure cost_trigger();