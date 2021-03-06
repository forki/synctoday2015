/* 
declare @idVal int = 0
declare @ExternalIdVal nvarchar(2048) = NULL
declare @InternalIdVal uniqueidentifier = NULL
*/

declare @id int
select @id = @idVal
declare @ExternalId nvarchar(2048)
select @ExternalId  = @ExternalIdVal
declare @InternalId uniqueidentifier
select @InternalId  = @InternalIdVal

SELECT Id
      ,InternalId
      ,ExternalId
      ,[Description]
      ,Start
      ,[End]
      ,LastModified
      ,Location
      ,Summary
      ,CategoriesJSON
      ,ServiceAccountId
      ,Upload
      ,Tag
      ,IsNew
      ,WasJustUpdated
      ,LastDLError
      ,LastUPError
  FROM CalDavEvents
  where 
		Id = ( CASE WHEN @id = 0 THEN Id ELSE @id END ) AND
		ExternalId = ISNULL( @ExternalId, ExternalId ) AND
		InternalId = ( CASE WHEN @InternalId = '00000000-0000-0000-0000-000000000000' THEN InternalId ELSE ISNULL( @InternalId, InternalId ) END )
