create or replace procedure add_job_h (employee_id job_history, ) is
e_not_empty exception;
v_job_id number;
begin
select count(job_id)
into v_job_id
from jobs
where job_id = p_job_id;
if v_job_id = 0 then
insert into jobs(job_id, job_title, min_salary, max_salary)
values (p_job_id ,p_job_title ,NULL,NULL);
dbms_output.put_line('usuario agregado');
else
raise e_not_empty;
end if;
exception
when e_not_empty then dbms_output.put_line('usuario ya existe');
end add_job;
/
execute add_job ('IT_ANA_SYS', 'Analista de Sistemas');
/
