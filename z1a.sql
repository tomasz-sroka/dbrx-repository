explain plan set statement_id='tsdb'
for
SELECT /*+ index(t1 wip_id) */ DISTINCT t0.WIP_ID, t0.OPENED_AS_CODE, t0.CREATION_DATE, 
t0.EXPIRATION_DATE, t0.LOCATION, t0.OFFICER
 FROM WIP.WIP_GLOBAL t0, WIP.CUSTOMER t1 
WHERE ((((t0.EXPIRATION_DATE > :1)
 AND (t0.LOCATION = :2))
 AND (t1.SEARCHABLE_NAME LIKE :3))
 AND ((t1.WIP_ID = t0.WIP_ID)
 AND (t1.STATUS = :4)))
;
@exp

roll
