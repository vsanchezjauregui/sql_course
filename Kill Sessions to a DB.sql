declare @query nvarchar(max) = '', @db nvarchar(max) = 'rentacar';
drop table if exists #process;
select distinct
	/*d.name ,*/ 
	cast(convert (smallint, req_spid) as nvarchar) As spid
	into #process
from	
	master.dbo.syslockinfo l, 
    master.dbo.spt_values v,
    master.dbo.spt_values x, 
    master.dbo.spt_values u, 
    master.dbo.sysdatabases d
where
	l.rsc_type = v.number 
    and v.type = 'LR' 
    and l.req_status = x.number 
    and x.type = 'LS' 
    and l.req_mode + 1 = u.number
    and u.type = 'L' 
    and l.rsc_dbid = d.dbid 
    and rsc_dbid = (select top 1 dbid from 
                    master..sysdatabases 
                    where name like @db)

select @query = @query + 'Kill ' + spid + '; ' from #process;
--select @query 

EXEC master.dbo.sp_executesql @query;
PRINT 'Process have been Killed'

--select top 1 * from master..