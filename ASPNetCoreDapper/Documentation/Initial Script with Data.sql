USE [ASPNetCoreDapper]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Companies]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/10/2021 10:39:05 AM ******/
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/10/2021 10:39:05 AM ******/
DROP TABLE [dbo].[Companies]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/10/2021 10:39:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/10/2021 10:39:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Address], [Country]) VALUES (1, N'IT_Solutions Ltd', N'583 Wall Dr. Gwynn Oak, MD 21207', N'USA')
INSERT [dbo].[Companies] ([Id], [Name], [Address], [Country]) VALUES (2, N'Admin_Solutions Ltd', N'312 Forest Avenue, BF 923', N'USA')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Age], [Position], [CompanyId]) VALUES (1, N'Sam Raiden', 26, N'Software developer', 1)
INSERT [dbo].[Employees] ([Id], [Name], [Age], [Position], [CompanyId]) VALUES (2, N'Kane Miller', 35, N'Administrator', 2)
INSERT [dbo].[Employees] ([Id], [Name], [Age], [Position], [CompanyId]) VALUES (3, N'Jana McLeaf', 30, N'Software developer', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Companies]
GO

CREATE PROCEDURE [dbo].[ShowCompanyForProvidedEmployeeId] @Id int
AS
SELECT c.Id, c.Name, c.Address, c.Country
FROM Companies c JOIN Employees e ON c.Id = e.CompanyId
Where e.Id = @Id
GO