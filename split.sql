
--verilen stringi virgül ile ayırarak tablo yapar
CREATE FUNCTION dbo.split
(
	@str AS VARCHAR(max),
	@delimeter AS VARCHAR(10)
)
RETURNS @resulttable TABLE (ITEM VARCHAR(max),IDX INT)
AS
BEGIN

	DECLARE @i AS INT=1
	DECLARE @pos AS INT=1

		while @pos>=1
			BEGIN
				SET @pos = CHARINDEX(@delimeter,@str )
				
				DECLARE @item AS VARCHAR(max)
				SET @item = SUBSTRING(@str,0,@pos)

				SET @str = SUBSTRING(@str,@pos+1,LEN(@str)-@pos)

				IF @pos = 0
					SET @item = @str

				INSERT INTO @resulttable (ITEM,IDX)
				VALUES(@item,@i)
				SET @i = @i + 1
			END

RETURN 
END

SELECT * FROM dbo.split('ömer,ahmet,dadasdas,ythjgj,564545,osman,mehmet,mahmut',',')



DECLARE @a INT = charindex(',','ömer,ahmet,osman,mehmet,mahmut')
DECLARE @item AS VARCHAR(max) = substring('ömer,ahmet,osman,mehmet,mahmut',0,@a)
PRINT @item

