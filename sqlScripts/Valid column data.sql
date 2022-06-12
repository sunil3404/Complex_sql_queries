use complex_queries;
drop table comments_and_translation;
create table comments_and_translation(id int, comment varchar(100), translation varchar(100));

insert into comments_and_translation values(1, "very good", null);
insert into comments_and_translation values(2, "good", null);
insert into comments_and_translation values(3, "bad", null);
insert into comments_and_translation values(4, "ordinary", null);
insert into comments_and_translation values(5, "cdcdcdcdcd", "very bad");
insert into comments_and_translation values(6, "excellent", null);
insert into comments_and_translation values(7, "abababa", "not satisfied");
insert into comments_and_translation values(8, "satisfied", null);
insert into comments_and_translation values(1, "abababababa", "extraordinary");
insert into comments_and_translation values(1, "ccddccddadasd", "medium");

-- select case when translation is null
-- 				then comment 
-- 			else translation
-- 		end as output
-- from comments_and_translation;

select coalesce(translation, comment) as output
from comments_and_translation;