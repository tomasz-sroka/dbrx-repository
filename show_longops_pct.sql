SET LINESIZE 200 long 3000 maxdata 3000
COLUMN sid FORMAT 9999
COLUMN serial# FORMAT 9999999
COLUMN machine FORMAT A30
COLUMN progress_pct FORMAT 99999999.00
COLUMN elapsed FORMAT A10
COLUMN remaining FORMAT A10
COLUMN module FORMAT A15 TRUNC
COLUMN username FORMAT A15 TRUNC
COLUMN pslave FORMAT A10 TRUNC

SELECT s.inst_id,
       s.sid,
       s.serial#,
       substr(s.program,25,10) pslave,
       s.username,
       s.module,
       ROUND(sl.elapsed_seconds/60) || ':' || MOD(sl.elapsed_seconds,60) elapsed,
       ROUND(sl.time_remaining/60) || ':' || MOD(sl.time_remaining,60) remaining,
       ROUND(sl.sofar/sl.totalwork*100, 2) progress_pct
FROM   gv$session s,
       gv$session_longops sl
WHERE  s.sid     = sl.sid
AND    s.inst_id = sl.inst_id
AND    s.serial# = sl.serial# 
/

