use [maxikino_source]
go
exec sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'  
exec sp_MSforeachtable 'ALTER TABLE ? DISABLE TRIGGER ALL'  
exec sp_MSforeachtable 'DELETE FROM ?'  
exec sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL'  
exec sp_MSforeachtable 'ALTER TABLE ? ENABLE TRIGGER ALL' 

EXEC sp_MSforeachtable 'Select ''?'', count(*) from ?'

BULK insert Dystrybutor from "C:/DataGenerated/20140601/Dystrybutor.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert Film from "C:/DataGenerated/20140601/Film.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert Bilet from "C:/DataGenerated/20140601/Bilety.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert Kino from "C:/DataGenerated/20140601/Kino.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert Sala from "C:/DataGenerated/20140601/Sala.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert Seans from "C:/DataGenerated/20140601/Seans.bulk" with (fieldterminator='|', rowterminator='\n')
ALTER TABLE Kino NOCHECK CONSTRAINT ALL
bulk insert Pracownik from "C:/DataGenerated/20140601/Pracownik.bulk" with (fieldterminator='|', rowterminator='\n')
ALTER TABLE Kino CHECK CONSTRAINT ALL
bulk insert ZakupFilmu from "C:/DataGenerated/20140601/ZakupFilmu.bulk" with (fieldterminator='|', rowterminator='\n')
bulk insert SprzedazBiletu from "C:/DataGenerated/20140601/SprzedazBiletow.bulk" with (fieldterminator='|', rowterminator='\n')

EXEC sp_MSforeachtable 'Select ''?'', count(*) from ?'