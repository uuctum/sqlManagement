/*
	SQL çalýþýrken I/O yu ne kadar bekliyor....
	https://www.mssqltips.com/sqlservertutorial/254/investigating-io-bottlenecks/
*/
Select
	cast(DB_Name(database_id) as varchar) as Database_name,
    physical_name,io_stall_read_ms/num_of_reads as okuma, io_stall_write_ms/num_of_writes as YAZMA
from (
	SELECT 
	--cast(DB_Name(a.database_id) as varchar) as Database_name,
	--b.physical_name, 
	b.*,a.io_stall_read_ms, a.io_stall_write_ms,a.num_of_reads,a.num_of_writes
	FROM  
	sys.dm_io_virtual_file_stats(null, null) a 
	INNER JOIN sys.master_files b ON a.database_id = b.database_id and a.file_id = b.file_id
	--ORDER BY Database_Name
) X
ORDER BY YAZMA DESC
