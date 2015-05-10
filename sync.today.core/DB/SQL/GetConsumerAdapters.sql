/*  
declare @adapterIdVal int = 0
declare @consumerIdVal int = 0
declare @dataVal nvarchar(max) = NULL
*/

declare @adapterId int = @adapterIdVal
declare @consumerId int = @consumerIdVal
declare @data nvarchar(max) = @dataVal

SELECT * FROM ConsumerAdapters WHERE 
	AdapterId = ( CASE WHEN @adapterId = 0 THEN AdapterId ELSE @adapterId END ) AND
	ConsumerId = ( CASE WHEN @consumerId = 0 THEN ConsumerId ELSE @consumerId END ) AND 
	DateJSON = ISNULL(@data, DateJSON)


