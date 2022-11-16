IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServerRolesINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServerRolesINSERT]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ReleasesINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ReleasesINSERT]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_EnvironmentTypesINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_EnvironmentTypesINSERT]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServersINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServersINSERT]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_TenantsINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_TenantsINSERT]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_UserAccountsINSERT]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_UserAccountsINSERT]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServerRolesDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServerRolesDELETE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ReleasesDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ReleasesDELETE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_EnvironmentTypesDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_EnvironmentTypesDELETE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServersDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServersDELETE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_TenantsDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_TenantsDELETE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_UserAccountsDELETE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_UserAccountsDELETE]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServerRolesUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServerRolesUPDATE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ReleasesUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ReleasesUPDATE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_EnvironmentTypesUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_EnvironmentTypesUPDATE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServersUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServersUPDATE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_TenantsUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_TenantsUPDATE]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_UserAccountsUPDATE]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_UserAccountsUPDATE]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServerRolesREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServerRolesREAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ReleasesREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ReleasesREAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_EnvironmentTypesREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_EnvironmentTypesREAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_ServersREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_ServersREAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_TenantsREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_TenantsREAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cusp_UserAccountsREAD]') AND type in (N'P')) DROP PROCEDURE [dbo].[cusp_UserAccountsREAD]

--END--
CREATE PROCEDURE dbo.cusp_EnvironmentTypesINSERT(@Name varchar(20),	@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.EnvironmentTypes([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesINSERT(@Name varchar(20),	@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.ServerRoles([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ReleasesINSERT(@Name varchar(20),	@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.Releases([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_TenantsINSERT(@Name varchar(20),@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.Tenants([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsINSERT(@Name varchar(20),	@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.UserAccounts([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_ServersINSERT(@Name varchar(20),	@Description varchar(20), @ID INT OUTPUT)
AS
SET NOCOUNT OFF;
INSERT INTO dbo.[Servers]([Name],[Description],[DateModified],[DateCreated],[IsDeleted]) VALUES (@Name,@Description,GETDATE(), GETDATE(),'0')
SET @ID = SCOPE_IDENTITY()
--END--
CREATE PROCEDURE dbo.cusp_EnvironmentTypesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.EnvironmentTypes SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.ServerRoles SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_ReleasesDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.Releases SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_TenantsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.Tenants SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.UserAccounts SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_ServersDELETE(@ID int, @UNDELETE char(1)='0')
AS
SET NOCOUNT OFF;
UPDATE dbo.[Servers] SET IsDeleted=CASE WHEN @UNDELETE='1' THEN '0' ELSE '1' END, [DateModified]= GETDATE()
--END--
CREATE PROCEDURE dbo.cusp_EnvironmentTypesUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.EnvironmentTypes SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServerRolesUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.ServerRoles SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ServersUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.Servers SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_ReleasesUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.Releases SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_TenantsUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.Tenants SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID
--END--
CREATE PROCEDURE dbo.cusp_UserAccountsUPDATE(@ID int, @Name varchar(20), @Description varchar(20))
AS
UPDATE dbo.UserAccounts SET [Name]=@Name, [Description]=@Description, [DateModified]= GETDATE() WHERE ID=@ID