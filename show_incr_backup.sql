SELECT FILE#, INCREMENTAL_LEVEL, COMPLETION_TIME, BLOCKS, DATAFILE_BLOCKS 
  FROM V$BACKUP_DATAFILE  order by 1;
