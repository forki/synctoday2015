/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [adapters.moneys4.PartialProduct]
      SET [ProductId] = P.[ProductId]
FROM [dbo].[entities.Product] P
where [adapters.moneys4.PartialProduct].Name = P.Name