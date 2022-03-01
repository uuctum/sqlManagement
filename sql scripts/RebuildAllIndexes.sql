-- Reindex & Rebuild indexes for all tables
-----------------------------------------------------------------------
-- Disclaimer
-- These scripts are provided AS IS without warranty of any kind. 
-- The entire risk arising out of the use or performance of the sample 
-- scripts and documentation remains with you. 
-----------------------------------------------------------------------

EXEC sp_MSforeachtable "ALTER INDEX ALL ON ? REBUILD WITH (ONLINE=OFF)"
EXEC sp_MSforeachtable "UPDATE STATISTICS ? WITH FULLSCAN, COLUMNS"
