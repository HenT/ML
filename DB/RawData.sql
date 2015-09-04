---------------------------
-- ����� ������ � ���������
---------------------------
use ML
go

if object_id('dbo.t_RawData', 'U') is not null
  drop table dbo.t_RawData
go
create table dbo.t_RawData
(
	 id				bigint		identity
	,RawData		xml			not null	-- ������
	,OwnerID		bigint		not null	-- vk_ID ��������� (��� �� ���� ��� ������)
	,SubjectID		int			not null	-- ID ���� ������� (���������/�����/������ � �.�.)
	,vkID			bigint		not null	-- vk_ID ������� (���� ����� ����� 0)
	,LoadDT			datetime	not null	-- ���� ��������
	,UpdateDT		datetime	not null	default getdate()

)
go

if object_id('dbo.v_RawData', 'V') is not null
  drop view dbo.v_RawData
go

create view dbo.v_RawData as
select 
	 id				
	,RawData		-- ������
	,OwnerID		-- vk_ID ��������� (��� �� ���� ��� ������)
	,SubjectID		-- ID ���� ������� (���������/�����/������ � �.�.)
	,vkID			-- vk_ID ������� (���� ����� ����� 0)
	,LoadDT			-- ���� ��������
	,UpdateDT		-- ���� ���������� (���� ��� ����)
from dbo.t_RawData
go

select * from dbo.v_RawData


