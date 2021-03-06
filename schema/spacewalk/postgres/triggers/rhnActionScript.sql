-- oracle equivalent source sha1 805ed77e6884e688cdc1195c6b5a28fbd0fd9fef

create or replace function rhn_actscript_mod_trig_fun() returns trigger as
$$
begin
	new.modified := current_timestamp;
	return new;
end;
$$ language plpgsql;

create trigger
rhn_actscript_mod_trig
before insert or update on rhnActionScript
for each row
execute procedure rhn_actscript_mod_trig_fun();
