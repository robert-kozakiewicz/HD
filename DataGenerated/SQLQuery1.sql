select count(*) from [maxikino].dbo.Czas;
select count(*) from [maxikino].dbo.Data;
select count(*) from [maxikino].dbo.Data_miesieczna;

select * from [maxikino].dbo.Data_miesieczna x order by x.Rok, x.Miesiac


exec sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'  
exec sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER ALL'  
exec sp_MSforeachtable 'DELETE FROM ?'  
exec sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL'  
exec sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER ALL' 
exec sp_MSforeachtable 'select ''?'', count(*) from ?'


use [maxikino_source]
EXEC sp_MSforeachtable 'Select ''?'', count(*) from ?'



select * from maxikino.dbo.junk;
select * from maxikino.dbo.Dystrybucja;

update maxikino_source.dbo.Dystrybutor
set Nazwa_dystrybutora = SUBSTRING(nazwa_dystrybutora,1,20);

delete from maxikino.dbo.Sprzedaz_biletu

select * from maxikino_source.dbo.ZakupFilmu