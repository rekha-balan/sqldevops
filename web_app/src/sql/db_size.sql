with fs
as
(
    select database_id, type, size * 8.0 / 1024 size
    from sys.master_files
)
select 
    name,
    (select sum(size) from fs where type = 0 and fs.database_id = db.database_id) data_file,
    (select sum(size) from fs where type = 1 and fs.database_id = db.database_id) log_file
from sys.databases db
--where database_id > 4