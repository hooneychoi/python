
select
    convert(char(10), RegisterDate, 121) dt
,   count(*) cnt
from tspurchase.dbo.charge
where RegisterDate between '20200501' and '20200515'
group by
    convert(char(10), RegisterDate, 121)
order by 1
option(maxdop 1)
--option(maxdop 1, hash group)



select
    convert(char(10), dateadd(dd, dt, '19700101'), 121) dt
,   cnt
from (
    select
        datediff(dd, '19700101', RegisterDate) dt
    ,   count(*) cnt
    from tspurchase.dbo.charge
    where RegisterDate between '20200501' and '20200515'
    group by
        datediff(dd, '19700101', RegisterDate)
) t
order by 1
option(maxdop 1)
--option(maxdop 1, hash group)