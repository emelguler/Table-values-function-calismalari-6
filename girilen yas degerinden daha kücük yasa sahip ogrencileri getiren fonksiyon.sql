USE [Okul]

--girilen yas degerinden daha kücük yasa sahip ogrencileri getiren fonksiyon:

create function [dbo].[DogummTarihiId](@Yas int)
 returns table
 as 
 return
 select *,(DATEPART(year,getdate())- DATEPART(year,o.Dogum_Tarihi)) AS YAS from dbo.Ogrenci as o  where 

 (DATEPART(year,getdate())- DATEPART(year,o.Dogum_Tarihi)) < @Yas
 AND O.Statu=1


--cagiralim:
 select * from dbo.DogummTarihiId(25)