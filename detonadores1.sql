select  * from payment
select  * from "generador"
create or replace function date_trigger() returns Trigger
as 
$$
begin 	
insert into "generador" values (old.payment_id, old.customer_id, old.staff_id, old.rental_id, old.amount, old.payment_date);
return new;
End
$$
Language plpgsql;
create trigger payment_update before update on payment
for each row 
execute procedure date_trigger();
