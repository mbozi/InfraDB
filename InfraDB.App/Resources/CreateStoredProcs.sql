SET nocount ON
DECLARE @spname nvarchar(25)
DECLARE @crudname nvarchar(25)
DECLARE @SP TABLE (SPNAME nvarchar(25))
INSERT INTO @SP(SPNAME)
VALUES 
('ServerRoles'),
('Releases'),
('EnvironmentTypes'),
('Servers'),
('Tenants'),
('UserAccounts'),
('AppTenants'),
('Applications')

DECLARE @CRUD TABLE (CRUDNAME nvarchar(10))
INSERT INTO @CRUD(CRUDNAME)
VALUES 
('INSERT'),
('DELETE'),
('UPDATE')

DECLARE  @SqlStatement AS NVARCHAR(MAX)
DECLARE db_cursor CURSOR FOR 
SELECT SPNAME, CRUDNAME FROM @SP, @CRUD

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @spname, @crudname

WHILE @@FETCH_STATUS = 0  
BEGIN  
      BEGIN
      SET @SqlStatement = 'IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[cusp_' + @spname + @crudname + ']'') AND type in (N''P'')) DROP PROCEDURE [dbo].[cusp_' + @spname + @crudname + ']'
      EXECUTE sp_executesql @SqlStatement
      END
      FETCH NEXT FROM db_cursor INTO @spname , @crudname
END 

CLOSE db_cursor  
DEALLOCATE db_cursor
--END--
CREATE PROCEDURE dbo.cusp_EnvironmentTypesINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.EnvironmentTypes([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.ServerRoles([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ReleasesINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.Releases([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_TenantsINSERT(@Name varchar(20),@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.Tenants([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.UserAccounts([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ServersINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.[Servers]([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ApplicationsINSERT(@Name varchar(20),	@Description varchar(100), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.[Applications]([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_AppTenantsINSERT(@ApplicationID int, @TenantID int, @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.[AppTenants]([ApplicationID],[TenantID],[DateModified],[DateCreated],[IsDeleted]) VALUES (@ApplicationID,@TenantID,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--

CREATE PROCEDURE dbo.cusp_EnvironmentTypesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.EnvironmentTypes SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.ServerRoles SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ReleasesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.Releases SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()  WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_TenantsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.Tenants SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.UserAccounts SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServersDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.[Servers] SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ApplicationsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.[Applications] SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_AppTenantsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.[AppTenants] SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_EnvironmentTypesUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.EnvironmentTypes SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.ServerRoles SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServersUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.Servers SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ReleasesUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.Releases SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_TenantsUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.Tenants SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.UserAccounts SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ApplicationsUPDATE(@ID int, @Name varchar(20), @Description varchar(100))
AS
UPDATE dbo.Applications SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_AppTenantsUPDATE(@ID int, @ApplicationID int, @TenantID int)
AS
UPDATE dbo.AppTenants SET [ApplicationID]=@ApplicationID, [TenantID]=@TenantID, [DateModified]= GETDATE() WHERE ID=@ID
