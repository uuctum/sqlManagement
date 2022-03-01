# sqlManagement
Scripts and Tips for SQL Performance &amp; management that I collected or created

## Disclaimer
These scripts are provided AS IS without warranty of any kind. 
The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. 

## Rebuild all indexes
Indexes should be rebuild and reorganized periodically. Although it's much more efficient to rebuild only the problematic indexes, in most cases the time benefit of filtered run can be ignored. In such cases, the following lines can be used to reindex all tables

## Fragmentation
List indexes that are fragmented more than the given percentage

## Missing Indexes
List of missing indexes that will help to improve the performance
