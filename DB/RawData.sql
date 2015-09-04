---------------------------
-- —ырые данные о владельце
---------------------------
use ML
go

if object_id('dbo.t_RawData', 'U') is not null
  drop table dbo.t_RawData
go
create table dbo.t_RawData
(
	 id				bigint		identity
	,RawData		xml			not null	-- данные
	,OwnerID		bigint		not null	-- vk_ID владельца (тот от кого был запрос)
	,SubjectID		int			not null	-- ID типа объекта (сообщение/стена/группа и т.д.)
	,vkID			bigint		not null	-- vk_ID объекта (если нусто тогда 0)
	,LoadDT			datetime	not null	-- дата загрузки
	,UpdateDT		datetime	not null	default getdate()

)
go

if object_id('dbo.v_RawData', 'V') is not null
  drop view dbo.v_RawData
go

create view dbo.v_RawData as
select 
	 id				
	,RawData		-- данные
	,OwnerID		-- vk_ID владельца (тот от кого был запрос)
	,SubjectID		-- ID типа объекта (сообщение/стена/группа и т.д.)
	,vkID			-- vk_ID объекта (если нусто тогда 0)
	,LoadDT			-- дата загрузки
	,UpdateDT		-- дата обновлени€ (если оно было)
from dbo.t_RawData
go

select * from dbo.v_RawData


