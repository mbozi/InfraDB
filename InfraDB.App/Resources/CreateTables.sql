SET nocount ON
DECLARE @tablename nvarchar(25)
DECLARE @TAB TABLE (TABLENAME nvarchar(25))
INSERT INTO @TAB(TABLENAME)
VALUES 
('ServerRoles'),
('Releases'),
('EnvironmentTypes'),
('Servers'),
('Tenants'),
('UserAccounts'),
('AppTenants'),
('Applications')

DECLARE  @SqlStatement AS NVARCHAR(MAX)
DECLARE db_cursor CURSOR FOR 
SELECT TABLENAME FROM @TAB

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @tablename

WHILE @@FETCH_STATUS = 0  
BEGIN  
      BEGIN
      SET @SqlStatement = 'IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[' + @tablename + ']'') AND type in (N''U'')) DROP TABLE [dbo].[' + @tablename + ']'
      EXECUTE sp_executesql @SqlStatement
      END
      FETCH NEXT FROM db_cursor INTO @tablename
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

CREATE TABLE [dbo].[Applications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[EnvironmentTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_EnvironmentTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Releases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] int NOT NULL,
	[Name] [nvarchar](50) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_Releases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[ServerRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_ServerRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Servers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Tenants](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[UserAccounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL UNIQUE,
	[Description] [nvarchar](100) NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[AppTenants](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[TenantID] [int] NOT NULL,
	[DateModified] smalldatetime NOT NULL,
	[DateCreated] smalldatetime NOT NULL,
	[IsDeleted] [char](1) NOT NULL,
 CONSTRAINT [PK_AppTenants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--END--
--ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_ServerRoles_RoleID] FOREIGN KEY([RoleID])
--REFERENCES [dbo].[ServerRoles] ([ID])
--ON DELETE CASCADE
--ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_ServerRoles_RoleID]
--ALTER TABLE [dbo].[EnvironmentTypes]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentTypes_Tenants_TenantID] FOREIGN KEY([TenantID])
--REFERENCES [dbo].[Tenants] ([ID])
--ALTER TABLE [dbo].[EnvironmentTypes] CHECK CONSTRAINT [FK_EnvironmentTypes_Tenants_TenantID]
