declare @count int = 0

--select * into #temp_data from dim_data where data_hora >= '2020-09-06'
--declare @countData int = 0
--declare @minData int = (select min(id) from #temp_data)
--declare @maxData int = (select max(id) from #temp_data)
--declare @actualData int

while @count <= 24000
begin
	--set @actualData = @minData + @countData
	--if @actualData > @maxData
	--begin
	--	set @countData = 0
	--	set @actualData = @minData + @countData
	--end
	insert into fato_ligacao
	values (
		@count,
		(SELECT TOP 1 id_data FROM dim_data ORDER BY NEWID()),
		(SELECT TOP 1 id_data FROM dim_data ORDER BY NEWID()),
		(SELECT TOP 1 id_cliente FROM dim_cliente ORDER BY NEWID()),
		(SELECT TOP 1 id_atendente FROM dim_atendente ORDER BY NEWID()),
		(SELECT TOP 1 id_nps FROM dim_nps ORDER BY NEWID()),
		(SELECT TOP 1 id_produto FROM dim_produto ORDER BY NEWID()),
		(SELECT TOP 1 id_sla FROM dim_sla ORDER BY NEWID()),
		(select round(rand(),0)),
		(select round((@count + 1) * 60 *rand(),0) + 60)
	)
	set @count = @count + 1
end