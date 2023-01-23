-------------------------
--- Performance Check ---
-------------------------
SELECT TOP 50 qs.total_elapsed_time as total_elapsed_time, qs.total_elapsed_time/execution_count as avg, execution_count, min_elapsed_time,max_elapsed_time,last_elapsed_time,qs.last_execution_time,
SUBSTRING(st.text, (qs.statement_start_offset/2)+1, 
((CASE qs.statement_end_offset
WHEN -1 THEN DATALENGTH(st.text)
ELSE qs.statement_end_offset
END - qs.statement_start_offset)/2) + 1) AS statement_text, qp.query_plan
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle)as qp
where execution_count >0  
  and min_elapsed_time > 0
  and last_execution_time between '20170307 00:01' and '20201231 23:59'
ORDER BY  total_elapsed_time DESC, execution_count DESc  
--dbcc freeproccache
